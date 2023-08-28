;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_145) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures 

; NEList-of-temperatures -> Boolean
; Checks if the temperatures are sorted in descending order
(check-expect (sorted>? (cons 5 '())) #true)
(check-expect (sorted>? (cons 5 (cons 4 '()))) #true)
(check-expect (sorted>? (cons 4 (cons 5 '()))) #false)

(define (sorted>? l)
  (cond
    [(empty? (rest l)) #true]
    [else (and (> (first l) (first (rest l))) (sorted>? (rest l)))]))