;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_96) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Constants

(define HEIGHT 10)
(define WIDTH  20)

(define UFO (circle HEIGHT "solid" "green"))

(define TANK (rectangle HEIGHT HEIGHT "solid" "blue"))

(define MISSILE (triangle (/ HEIGHT 2) "solid" "red"))

(define Y-TANK (- 200 (image-height TANK)))

(define CANVAS
  (empty-scene 200 200))

(define TANK-SPEED 30)
(define MISSILE-SPEED 50)
(define UFO-SPEED 40)

; (make-aim (make-posn 20 10) (make-tank 28 -3))
; UFO is at (20, 10) while the tank is at x=28 at speed -3

(place-image UFO 20 10
 (place-image TANK 28 Y-TANK CANVAS))

; (make-fired (make-posn 20 10)
;            (make-tank 28 -3)
;            (make-posn 28 (- HEIGHT TANK-HEIGHT)))
; UFO is at (20, 10), Tank at 28
; Missile at (28, (- HEIGHT TANK-HEIGHT)
(place-image MISSILE 28 (- 200 HEIGHT)
 (place-image UFO 20 10
 (place-image TANK 28 Y-TANK CANVAS)))

; (make-fired (make-posn 20 100)
;            (make-tank 100 3)
;            (make-posn 22 103))
(place-image MISSILE 22 103
 (place-image UFO 20 100
 (place-image TANK 100 Y-TANK CANVAS)))