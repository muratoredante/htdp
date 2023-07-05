;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A tree would be a green circle on top of a brown rectangle.

(define proportion 1.5)
(define leaves (circle (* proportion 15) "solid" "green"))
(define trunk  (rectangle (* proportion 10) (* proportion 20)
                          "solid" "brown"))

(above leaves trunk)

; Is there a better way to scale?