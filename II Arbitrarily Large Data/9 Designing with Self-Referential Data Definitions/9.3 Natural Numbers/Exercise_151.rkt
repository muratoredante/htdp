;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_151) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

; N Number -> Number
; Multiples n by m without *

(check-expect (multiply 0 2) 0)
(check-expect (multiply 2 0) 0)
(check-expect (multiply 2 3) 6)
(define (multiply n m)
  (cond
    [(zero? n) 0]
    [(positive? n) (+ m (multiply (sub1 n) m))]))

; We are defining n*m as m + m + ... n times

