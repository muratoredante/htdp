;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_188) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct email [from date message])
; An Email Message is a structure: 
;   (make-email String Number String)
; interpretation (make-email f d m) represents text m 
; sent by f, d seconds after the beginning of time 

; Email-List -> Email-List
(check-expect (sort-emails (list (make-email "a" 2 "a") (make-email "b" 4 "b")))
              (list (make-email "b" 4 "b") (make-email "a" 2 "a")))

(define (sort-emails l)
  (cond
    [(empty? l) '()]
    [else (insert (first l) (sort-emails (rest l)))]))

; Email Email-List -> Email-List
(check-expect (insert (make-email "a" 2 "a") (list (make-email "b" 4 "b")))
              (list (make-email "b" 4 "b") (make-email "a" 2 "a")))
(define (insert e l)
  (cond
    [(empty? l) (list e)]
    [else (if (greater e (first l)) (cons e (rest l))
              (cons (first l) (insert e (rest l))))]))

; Email Email -> Boolean
(check-expect (greater (make-email "b" 4 "b") (make-email "a" 2 "a")) #true)
(check-expect (greater (make-email "b" 2 "b") (make-email "a" 4 "a")) #false)
(define (greater e1 e2)
  (>= (email-date e1) (email-date e2)))

; To sort by date we merely replace greater with greater-alph
; in the insertion function

; Email Email -> Boolean
(check-expect (greater (make-email "b" 4 "b") (make-email "a" 2 "a")) #true)
(define (greater-alph e1 e2)
 (string>? (email-from e1) (email-from e2)))