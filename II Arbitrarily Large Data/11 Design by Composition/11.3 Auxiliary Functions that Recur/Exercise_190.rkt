;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_190) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-1Strings -> List-of-1Strings
; consumes a list of 1Strings and produces the list of all suffixes
(check-expect (suffixes (list "a" "b" "c"))
              (list (list "a" "b" "c") (list "b" "c") (list "c")))

(define (suffixes l)
  (cond
    [(empty? l) '()]
    [else (cons l (suffixes (rest l)))]))

; List-of-1Strings -> List-of-1Strings
; consumes a list of 1Strings and produces the list of all prefixes
(check-expect (prefixes (list "a" "b" "c"))
              (list (list "a" "b" "c") (list "a" "b") (list "a")))

(define (prefixes l)
  (cond
    [(empty? l) '()]
    [else (cons l (prefixes (remove-last l)))]))

(check-expect (remove-last (list "a" "b" "c"))
              (list "a" "b"))
(define (remove-last l)
  (cond
    [(empty? l) '()]
    [(empty? (rest l)) '()]
    [else (cons (first l) (remove-last (rest l)))]))