;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_162) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-numbers -> List-of-numbers
; computes the weekly wages for all given weekly hours
(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons (* 28 H-WAGE) '()))
(check-expect (wage* (cons 4 (cons 2 '()))) (cons (* 4 H-WAGE) (cons (* 2 H-WAGE) '())))


(define (wage* whrs)
  (cond
    [(not (hour-check whrs)) (error "Some hours exceed 100")]
    [(empty? whrs) '()]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))

(define H-WAGE 14)
; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* H-WAGE h))

; List-of-numbers -> Boolean
; Check if no worked hours exceeds 100
(check-expect (hour-check (cons 4 (cons 101 '()))) #false)
(check-expect (hour-check (cons 4 (cons 100 '()))) #true)

(define (hour-check l)
  (cond
    [(empty? l) #true]
    [else (and (<= (first l) 100) (hour-check (rest l)))]))
