;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_174) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; 1String -> String
; converts the given 1String to a 3-letter numeric String
 
(check-expect (encode-letter "z") (code1 "z"))
(check-expect (encode-letter "\t")
              (string-append "00" (code1 "\t")))
(check-expect (encode-letter "a")
              (string-append "0" (code1 "a")))
 
(define (encode-letter s)
  (cond
    [(>= (string->int s) 100) (code1 s)]
    [(< (string->int s) 10)
     (string-append "00" (code1 s))]
    [(< (string->int s) 100)
     (string-append "0" (code1 s))]))
 
; 1String -> String
; converts the given 1String into a String
 
(check-expect (code1 "z") "122")
 
(define (code1 c)
  (number->string (string->int c)))

; String -> String
; Codes the string
(define (code s)
  (aux-code (explode s)))

; List-of-Strings -> String
(define (aux-code s)
  (cond
    [(empty? s) ""]
    [else (string-append (code1 (first s))
                         (aux-code (rest s)))]))


; String -> String
; Encodes a text file
(define (encode f)
  (write-file (string-append "encoded-" f)
              (collapse (read-words/line f))))

; LN -> String
; Converts list of lines into string separating with " " and \n
(define l1 (cons "a" (cons "b" (cons "c" '()))))
(define l2 (cons "d" (cons "e" (cons "f" '()))))
(define (collapse ln)
  (cond
    [(empty? ln) ""]
    [else (string-append (line-collapse (first ln)) "\n"
                         (collapse (rest ln)))]))


; List-of-Strings -> String
; Converts a list-of-strings into a string by spacing " "
(define (line-collapse ls)
  (cond
    [(empty? ls) ""]
    [else (string-append (code (first ls)) " " (line-collapse (rest ls)))]))
