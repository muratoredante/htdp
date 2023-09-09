;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_171) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-strings is one of:
; '()
; (cons String List-of-strings)

(cons "TTT" (cons "Put up in a place"
                  (cons "where it's easy to see..." '())))


; List-of-list-of-strings is one of:
; '()
; (cons List-of-strings List-of-list-of-strings)


(cons (cons "Put" (cons "up" (cons "in" (cons "a" (cons "place" '())))))
 (cons (cons "TTT" '())
       '()))

