;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_172) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; An LN is one of: 
; – '()
; – (cons Los LN)
; interpretation a list of lines, each is a list of Strings

; LN -> String
; Converts list of lines into string separating with " " and \n
(define l1 (cons "a" (cons "b" (cons "c" '()))))
(define l2 (cons "d" (cons "e" (cons "f" '()))))
(check-expect (collapse (cons l1 (cons l2 '()))) "a b c \nd e f \n")

(define (collapse ln)
  (cond
    [(empty? ln) ""]
    [else (string-append (line-collapse (first ln)) "\n"
                         (collapse (rest ln)))]))


; List-of-Strings -> String
; Converts a list-of-strings into a string by spacing " "
(check-expect (line-collapse l1) "a b c")
(check-expect (line-collapse l2) "d e f")

(define (line-collapse ls)
  (cond
    [(empty? ls) ""]
    [else (string-append (first ls) " " (line-collapse (rest ls)))]))