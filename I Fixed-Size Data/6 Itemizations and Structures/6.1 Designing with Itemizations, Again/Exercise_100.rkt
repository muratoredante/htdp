;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_100) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Constants

(define HEIGHT 10)
(define WIDTH  20)

(define UFO (circle HEIGHT "solid" "green"))

(define TANK (rectangle HEIGHT HEIGHT "solid" "blue"))

(define MISSILE (triangle (/ HEIGHT 2) "solid" "red"))

(define Y-TANK (- 200 (image-height TANK)))

(define CANVAS
  (empty-scene 200 200))

(define MISSILE-SPEED 1)
(define UFO-Y-SPEED 1)


; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
 
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 
 
; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
(define-struct tank [loc vel])

; Tank Image -> Image 
; adds t to the given image im
(check-expect (tank-render (make-tank 100 3) (rectangle 100 100 "outline" "black"))
              (place-image TANK 100 Y-TANK (rectangle 100 100 "outline" "black")))
(define (tank-render t im)
  (place-image TANK (tank-loc t) Y-TANK im))


; UFO Image -> Image 
; adds u to the given image im
(check-expect (ufo-render (make-posn 50 25) (rectangle 100 100 "outline" "black"))
              (place-image UFO 50 25 (rectangle 100 100 "outline" "black")))
(define (ufo-render u im)
  (place-image UFO (posn-x u) (posn-y u) im))

; Missile Image -> Image 
; adds m to the given image im
(check-expect (missile-render (make-posn 50 25) (rectangle 100 100 "outline" "black"))
              (place-image MISSILE 50 25 (rectangle 100 100 "outline" "black")))
(define (missile-render m im)
  (place-image MISSILE (posn-x m) (posn-y m) im))


; UFO Missile -> Boolean
; True when Missile is close enough to UFO
(check-expect (check-distance (make-posn 10 10) (make-posn 20 20)) #false)
(check-expect (check-distance (make-posn 1 2) (make-posn 2 1)) #true)
(define (check-distance u m)
  (> 5 (sqrt (+ (sqr (- (posn-x u) (posn-x m)))
                (sqr (- (posn-y u) (posn-y m)))))))

; SIGS -> Boolean
; True when UFO lands or missile hits UFO
(define exaf (make-aim (make-posn 10 10) (make-tank 30 -3)))
(define exat (make-aim (make-posn 10 200) (make-tank 30 -3)))
(define exff (make-fired (make-posn 10 10) (make-tank 30 -3) (make-posn 20 20)))
(define exft (make-fired (make-posn 1 2) (make-tank 30 -3) (make-posn 2 1)))
(check-expect (si-game-over? exaf) #false)
(check-expect (si-game-over? exat) #true)
(check-expect (si-game-over? exff) #false)
(check-expect (si-game-over? exft) #true)

(define (si-game-over? x)
  (cond
    [(aim? x)  (> (posn-y (aim-ufo x)) (- 200 HEIGHT))]
    [(fired? x) (check-distance (fired-ufo x) (fired-missile x))]))

; SIGS -> Image
; Show at end
(define (si-render-final x)
  (rectangle 200 200 "solid" "red"))

; SIGS -> SIGS
; moves the space-invader objects 
(define (si-move w)
  (si-move-proper w (random 200)))
 
; SIGS Number -> SIGS 
; moves the space-invader objects predictably by delta
(define exa (make-aim (make-posn 10 10) (make-tank 30 -3)))
(define exf (make-fired (make-posn 10 10) (make-tank 30 -3) (make-posn 20 20)))
(check-expect (si-move-proper exa 5)
              (make-aim (move-ufo  (make-posn 10 10) 5)
                        (move-tank (make-tank 30 -3)))) 
(check-expect (si-move-proper exf 7)
              (make-fired (move-ufo  (make-posn 10 10) 7)
                          (move-tank (make-tank 30 -3))
                          (move-missile (make-posn 20 20 )))) 
(define (si-move-proper w delta)
  (cond
    [(aim? w) 　　(make-aim    (move-ufo  (aim-ufo w) delta)
                              (move-tank (aim-tank w)))]
    [(fired? w)　 (make-fired (move-ufo  (fired-ufo w) delta)
                              (move-tank (fired-tank w))
                              (move-missile (fired-missile w)))]))

; UFO Number -> UFO
; Move UFO
(check-expect (move-ufo (make-posn 10 10) 7) (make-posn 7 (+ 10 UFO-Y-SPEED)))
(define (move-ufo u delta)
  (make-posn delta (+ (posn-y u) UFO-Y-SPEED)))

; Tank -> Tank
; Move Tank
(check-expect (move-tank (make-tank 5 -3)) (make-tank (+ 5 -3) -3))
(define (move-tank t)
  (make-tank (+ (tank-loc t) (tank-vel t)) (tank-vel t)))

; Missile -> Missile
; Move Missile
(check-expect (move-missile (make-posn 10 10)) (make-posn 10 (- 10 MISSILE-SPEED)))
(define (move-missile m)
  (make-posn (posn-x m) (- (posn-y m) MISSILE-SPEED)))

; Tank KeyStroke-> Tank
; Move left or right
(check-expect (shift-tank (make-tank 30 3) "left") (make-tank 30 -3))
(check-expect (shift-tank (make-tank 30 -6) "right") (make-tank 30 6))

(define (shift-tank t k)
  (cond
    [(string=? k "left")  (make-tank (tank-loc t) (- (abs (tank-vel t))))]
    [(string=? k "right") (make-tank (tank-loc t)    (abs (tank-vel t)))]))

; SIGS KeyStroke -> SIGS
; Move Tank left to right and fire missile
(check-expect (si-control (make-aim (make-posn 10 10) (make-tank 30 -3)) "right")
              (make-aim (make-posn 10 10) (make-tank 30 3)))
(check-expect (si-control (make-aim (make-posn 10 10) (make-tank 30 -3)) " ")
              (make-fired (make-posn 10 10) (make-tank 30 -3) (make-posn 30 (- 200 HEIGHT))))
(check-expect (si-control (make-fired (make-posn 10 10) (make-tank 30 5) (make-posn 30 HEIGHT))  "left")
              (make-fired (make-posn 10 10) (make-tank 30 -5) (make-posn 30 HEIGHT)))

(define (si-control w k)
(cond
    [(aim? w)
     (cond
       [(or (string=? k "left") (string=? k "right"))
        (make-aim (aim-ufo w) (shift-tank (aim-tank w) k))]
       [(string=? k " ") (make-fired (aim-ufo w) (aim-tank w) (make-posn (tank-loc (aim-tank w)) (- 200 HEIGHT)))]
       [else w])]
    [(fired? w)
     (cond
       [(or (string=? k "left") (string=? k "right"))
        (make-fired (fired-ufo w) (shift-tank (fired-tank w) k) (fired-missile w))]
       [else w])]))


; SIGS -> Image
; Renders Space Invaders Game
(define (si-render w)
  (cond
    [(aim? w) (tank-render (aim-tank w) (ufo-render (aim-ufo w) CANVAS))]
    [(fired? w) (missile-render (fired-missile w)
                                (tank-render (fired-tank w)
                                              (ufo-render (fired-ufo w) CANVAS)))
     ]))

(define (main x)
  (big-bang x
    [on-tick si-move]
    [on-key si-control]
    [to-draw si-render]
    [stop-when si-game-over? si-render-final]))