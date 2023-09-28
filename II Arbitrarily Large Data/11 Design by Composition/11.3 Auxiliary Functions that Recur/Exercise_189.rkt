;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_189) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Number List-of-numbers -> Boolean
; Check if n is in the sorted list alon
(check-expect (search 5 (list 2 4 5 7)) #true)
(check-expect (search 5 (list 2 4 6 7)) #false)

(define (search n alon)
  (cond
    [(empty? alon) #false]
    [else (if (> (first alon) n) #false
           (or (= (first alon) n)
              (search n (rest alon))))]))
