;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_42) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the end of the car


; WorldState -> Image
; places the end of the car x pixels from 
; the left margin of the BACKGROUND image 
(define (render ws)
  (place-image CAR (- ws (* WHEEL-RADIUS 2.5))
                      Y-CAR  BACKGROUND))
