;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_58) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define INEXPENSIVE 1000)
(define LUXURY 10000)

(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p INEXPENSIVE)) 0]
    [(and (<= INEXPENSIVE p) (< p LUXURY)) (* 0.05 p)]
    [(>= p LUXURY) (* 0.08 p)]))

