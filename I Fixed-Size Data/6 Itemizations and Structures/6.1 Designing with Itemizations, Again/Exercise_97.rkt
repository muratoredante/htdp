;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_97) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Constants

(define HEIGHT 10)
(define WIDTH  20)

(define UFO (circle HEIGHT "solid" "green"))

(define TANK (rectangle HEIGHT HEIGHT "solid" "blue"))

(define MISSILE (triangle (/ HEIGHT 2) "solid" "red"))

(define Y-TANK (- 200 (image-height TANK)))

(define CANVAS
  (empty-scene 200 200))

(define MISSILE-SPEED 50)
(define UFO-Y-SPEED 20)


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