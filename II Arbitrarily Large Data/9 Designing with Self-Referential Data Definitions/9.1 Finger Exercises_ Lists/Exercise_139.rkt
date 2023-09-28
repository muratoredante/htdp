;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_139) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A List-of-numbers is one of: 
; – '()
; – (cons Number List-of-numbers)

; List-of-numbers -> Boolean
; Determines whether all numbers are positive
(check-expect (pos? '()) #true)
(check-expect (pos? (cons 4 '())) #true)
(check-expect (pos? (cons 5(cons -4 '()))) #false)

(define (pos? l)
  (cond
    [(empty? l) #true]
    [else (and (positive? (first l)) (pos? (rest l)))]))


; List-of-amounts -> Number
; Computes the sum of amounts
(check-expect (sum '()) 0)
(check-expect (sum (cons 5'())) 5)
(check-expect (sum (cons 200 (cons 500 '()))) (+ 200 500))
(define (sum l)
  (cond
    [(empty? l) 0]
    [else (+ (first l) (sum (rest l)))]))

; List-of-amounts -> Number
; Computes the sum of amounts
(check-error (sum-checked (cons 5(cons -4 '())))
             "Not a list-of-amounts")
(define (sum-checked l)
  (cond
    [(pos? l) (sum l)]
    [else (error "Not a list-of-amounts")]))