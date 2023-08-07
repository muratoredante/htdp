;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_94) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Constants

(define HEIGHT 10)
(define WIDTH  20)

(define UFO (circle HEIGHT "solid" "green"))

(define TANK (rectangle HEIGHT HEIGHT "solid" "blue"))

(define MISSILE (triangle (/ HEIGHT 2) "solid" "red"))

(define WIDTH-OF-WORLD 250)
(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD (* 2 WIDTH-OF-WORLD)))

(define TANK-SPEED 30)
(define MISSILE-SPEED 50)
(define UFO-SPEED 40)