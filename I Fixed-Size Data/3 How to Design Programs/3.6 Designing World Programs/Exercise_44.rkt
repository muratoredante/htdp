;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_44) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 8)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle (* WHEEL-RADIUS 1.5) 1 "solid" "white"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define RED-BLOCK
  (rectangle (* WHEEL-RADIUS 5) (* WHEEL-RADIUS 2) "solid" "red"))

(define CAR (above RED-BLOCK BOTH-WHEELS))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define NON-TREE-BACKGROUND
  (empty-scene WIDTH-OF-WORLD (* WHEEL-RADIUS 5)))
(define Y-CAR (* WHEEL-RADIUS 3))

(define BACKGROUND
  (place-image tree (/ WIDTH-OF-WORLD 2) Y-CAR NON-TREE-BACKGROUND))


; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
(define (tock cw)
  (+ cw 3))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

; WorldState -> Image
; places the image of the car x pixels from 
; the left margin of the BACKGROUND image 
(define (render x)
  (place-image CAR x Y-CAR BACKGROUND))

(check-expect (render 5)
              (place-image CAR 5 Y-CAR BACKGROUND))

; WorldState -> Boolean
; Determines when car x-coordinate leaves scene
(define (end? x)
  (> x (+ WIDTH-OF-WORLD (* WHEEL-RADIUS 3))))

(check-expect (end? 201) #false)
(check-expect (end? 999) #true)



; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "mode") 42)

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [on-mouse hyper]
     [to-draw render]
     [stop-when end?]))