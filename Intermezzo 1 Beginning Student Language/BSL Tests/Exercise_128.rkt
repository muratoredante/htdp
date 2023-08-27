;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_128) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(check-member-of "green" "red" "yellow" "grey")
; "green" != "red"

(check-within (make-posn #i1.0 #i1.1)
              (make-posn #i0.9 #i1.2)  0.01)
; 1.0 - 0.9 = 0.1 and 0.1 > 0.01

(check-range #i0.9 #i0.6 #i0.8)
; 0.9 is outside of the range (0.6, 0.8)

(check-random (make-posn (random 3) (random 9))
              (make-posn (random 9) (random 3)))
; 3 != 9


(check-satisfied 4 odd?)
; 4 is not odd
