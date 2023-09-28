;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_138) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)

; Example
(cons 200 (cons 500 '()))

; List-of-amounts -> Number
; Computes the sum of amounts
(check-expect (sum '()) 0)
(check-expect (sum (cons 5'())) 5)
(check-expect (sum (cons 200 (cons 500 '()))) (+ 200 500))
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sum (rest l)))]))