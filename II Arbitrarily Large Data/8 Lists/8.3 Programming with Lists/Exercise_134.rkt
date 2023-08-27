;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_134) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; String List-of-names -> Boolean
(check-expect (contains? "Flatt" (cons "b" (cons "Flatt" '()))) #true)
(check-expect (contains? "Flatt" (cons "b" (cons "Fltt" '()))) #false)
(define (contains? str lst)
  (cond
    [(empty? lst) #false]
    [(cons? lst)
     (or (string=? (first lst) str)
         (contains? str (rest lst)))]))