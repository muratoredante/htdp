;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_163) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (C f)
  (* 5/9 (- f 32)))

; List-of-Numbers -> List-of-Numbers
; Converts list of F to list of C
(check-expect (convertFC (cons 5 '())) (cons (* 5/9 (- 5 32)) '()))
(define (convertFC lf)
  (cond
    [(empty? lf) '()]
    [else (cons (C (first lf)) (convertFC (rest lf)))]))