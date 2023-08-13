;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_102) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 
 
; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place


(define-struct sigs [ufo tank missile])
; A SIGS.v2 (short for SIGS version 2) is a structure:
;   (make-sigs UFO Tank MissileOrNot)
; interpretation represents the complete state of a
; space invader game
 
; A MissileOrNot is one of: 
; – #false
; – Posn
; interpretation#false means the missile is in the tank;
; Posn says the missile is at that location

; MissileOrNot Image -> Image 
; adds an image of missile m to scene s
(check-expect (missile-render.v2 #false CANVAS) CANVAS)
(check-expect (missile-render.v2 (make-posn 32 50) CANVAS)
              (place-image MISSILE 32 50 CANVAS))
(define (missile-render.v2 m s)
  (cond
    [(boolean? m) s]
    [(posn? m)
     (place-image MISSILE (posn-x m) (posn-y m) s)]))

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

; UFO MissileOrNot -> Boolean
; True when Missile is close enough to UFO
(check-expect (check-distance (make-posn 10 10) (make-posn 20 20)) #false)
(check-expect (check-distance (make-posn 1 2) (make-posn 2 1)) #true)
(define (check-distance u m)
  (> 5 (sqrt (+ (sqr (- (posn-x u) (posn-x m)))
                (sqr (- (posn-y u) (posn-y m)))))))


; SIGS -> Boolean
; True when UFO lands or missile hits UFO
(define exaf (make-sigs (make-posn 10 10) (make-tank 30 -3)  #false))
(define exat (make-sigs (make-posn 10 200) (make-tank 30 -3) #false))
(define exff (make-sigs (make-posn 10 10) (make-tank 30 -3) (make-posn 20 20)))
(define exft (make-sigs (make-posn 1 2) (make-tank 30 -3) (make-posn 2 1)))
(check-expect (si-game-over? exaf) #false)
(check-expect (si-game-over? exat) #true)
(check-expect (si-game-over? exff) #false)
(check-expect (si-game-over? exft) #true)

(define (si-game-over? x)
  (cond
    [(boolean? (sigs-missile x))  (> (posn-y (sigs-ufo x)) (- 200 HEIGHT))]
    [(posn?  (sigs-missile x)) (check-distance (sigs-ufo x) (sigs-missile x))]))

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
(define exa (make-sigs (make-posn 10 10) (make-tank 30 -3) #false))
(define exf (make-sigs (make-posn 10 10) (make-tank 30 -3) (make-posn 20 20)))
(check-expect (si-move-proper exa 5)
              (make-sigs (move-ufo  (make-posn 10 10) 5)
                        (move-tank (make-tank 30 -3)) #false)) 
(check-expect (si-move-proper exf 7)
              (make-sigs (move-ufo  (make-posn 10 10) 7)
                          (move-tank (make-tank 30 -3))
                          (move-missile (make-posn 20 20 )))) 
(define (si-move-proper w delta)
  (cond
    [(boolean? (sigs-missile w))   (make-sigs  (move-ufo  (sigs-ufo w) delta)
                                   (move-tank (sigs-tank w)) #false)]
    [(posn?  (sigs-missile w))  (make-sigs (move-ufo  (sigs-ufo w) delta)
                                (move-tank (sigs-tank w))
                                (move-missile (sigs-missile w)))]))


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

; MissleOrNot -> MissileOrNot
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
(check-expect (si-control (make-sigs (make-posn 10 10) (make-tank 30 -3) #false) "right")
              (make-sigs (make-posn 10 10) (make-tank 30 3) #false))
(check-expect (si-control (make-sigs (make-posn 10 10) (make-tank 30 -3) #false) " ")
              (make-sigs (make-posn 10 10) (make-tank 30 -3) (make-posn 30 (- 200 HEIGHT))))
(check-expect (si-control (make-sigs (make-posn 10 10) (make-tank 30 5) (make-posn 30 HEIGHT))  "left")
              (make-sigs (make-posn 10 10) (make-tank 30 -5) (make-posn 30 HEIGHT)))

(define (si-control w k)
(cond
    [(boolean? (sigs-missile w))
     (cond
       [(or (string=? k "left") (string=? k "right"))
        (make-sigs (sigs-ufo w) (shift-tank (sigs-tank w) k) #false)]
       [(string=? k " ") (make-sigs (sigs-ufo w) (sigs-tank w) (make-posn (tank-loc (sigs-tank w)) (- 200 HEIGHT)))]
       [else w])]
    [(posn? (sigs-missile w))
     (cond
       [(or (string=? k "left") (string=? k "right"))
        (make-sigs (sigs-ufo w) (shift-tank (sigs-tank w) k) (sigs-missile w))]
       [else w])]))


; SIGS -> Image
; Renders Space Invaders Game
(define (si-render w)
  (cond
    [(boolean? (sigs-missile w)) (tank-render (sigs-tank w) (ufo-render (sigs-ufo w) CANVAS))]
    [(posn?    (sigs-missile w)) (missile-render.v2 (sigs-missile w)
                                (tank-render (sigs-tank w)
                                              (ufo-render (sigs-ufo w) CANVAS)))
     ]))

(define (main x)
  (big-bang x
    [on-tick si-move]
    [on-key si-control]
    [to-draw si-render]
    [stop-when si-game-over? si-render-final]))