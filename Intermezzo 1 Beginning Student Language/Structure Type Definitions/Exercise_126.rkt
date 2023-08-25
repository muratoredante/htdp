;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_126) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct point [x y z])
(define-struct none  [])

(make-point 1 2 3)
; (make-point value value value)
; value

(make-point (make-point 1 2 3) 4 5)
; (make-point (make-point value value value) value value)
; (make-point value value value)
; value

(make-point (+ 1 2) 3 4)
; (make-point (primitive value value) value value)
; (make-point value value value)
; value

(make-none)
; value

(make-point (point-x (make-point 1 2 3)) 4 5)
; (make-point (point-x (make-point value value value)) value value)
; (make-point (point-x value) value value)
; (make-point value value value)
; value