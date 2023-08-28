;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_140) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-booleans is one of:
; - ()'
; - (cons Boolean List-of-booleans)

; List-of-booleans -> Boolean
; Determines whether all of them are #true
(check-expect (all-true '()) #true)
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #true (cons #false '()))) #false)

(define (all-true l)
  (cond
    [(empty? l) #true]
    [else (and (first l) (all-true (rest l)))]))

; List-of-booleans -> Boolean
; Determines whether at least one item on the list is #true
(check-expect (one-true '()) #false)
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #false (cons #true '()))) #true)
(check-expect (one-true (cons #false (cons #false '()))) #false)

(define (one-true l)
  (cond
    [(empty? l) #false]
    [else (or (first l) (all-true (rest l)))]))