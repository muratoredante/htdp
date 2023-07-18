;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_43) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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


; An AnimationState is a Number.
; interpretation the number of clock ticks 
; since the animation started

; AnimationState -> AnimationState
; Increase the state at each tock
(define (tock ws)
  (+ ws 1))

(check-expect (tock 1) 2)

; AnimationState -> Image
; Places the center of the car at a x-coordinate distance
; equal to number of tocks from the left side.
(define (render x)
  (place-image CAR x (+ (* (sin x) 5) 20) BACKGROUND))


; WorldState -> Boolean
; Determines when car x-coordinate leaves scene
(define (end? x)
  (> x (+ WIDTH-OF-WORLD (* WHEEL-RADIUS 3))))

(check-expect (end? 201) #false)
(check-expect (end? 999) #true)


; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))





