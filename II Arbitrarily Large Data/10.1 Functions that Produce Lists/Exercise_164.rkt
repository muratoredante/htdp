;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_164) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define EURATE 0.93)

; List-of-Numbers -> List-of-Numbers
; Converts list of USD to list of EUR
(check-expect (convert-euro (cons 5 '())) (cons (* 5 0.93) '()))

(define (convert-euro l)
  (cond
    [(empty? l) '()]
    [else (cons (* 0.93 (first l)) (convert-euro (rest l)))]))

; List-of-Numbers Number -> List-of-Numbers
; Converts list of USD to list of EUR based on given rate
(check-expect (convert-euro* (cons 5 '()) EURATE) (cons (* 5 0.93) '()))
(define (convert-euro* l rate)
  (cond
    [(empty? l) '()]
    [else (cons (* rate (first l)) (convert-euro (rest l)))]))

