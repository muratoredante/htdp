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

