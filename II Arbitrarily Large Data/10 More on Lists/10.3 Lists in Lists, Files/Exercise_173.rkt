;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_173) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; String -> Boolean
; Check if string is an article
(check-expect (check-article "a") #true)
(check-expect (check-article "b") #false)
(define (check-article s)
  (or (string=? "a" s) (string=? "an" s) (string=? "the" s)))

; List-of-Strings -> List-of-Strings
; Removes articles
(check-expect (article-remove (cons "the" (cons "b" '()))) (cons "b" '()))

(define (article-remove ls)
  (cond
    [(empty? ls) '()]
    [else (if (check-article (first ls))
              (article-remove (rest ls))
              (cons (first ls) (article-remove (rest ls))))]))

; An LN is one of: 
; – '()
; – (cons Los LN)
; interpretation a list of lines, each is a list of Strings

; LN -> String
; Converts list of lines into string separating with " " and \n
(define l1 (cons "a" (cons "b" (cons "c" '()))))
(define l2 (cons "d" (cons "e" (cons "f" '()))))
(check-expect (article-collapse (cons l1 (cons l2 '()))) "b c \nd e f \n")

(define (article-collapse ln)
  (cond
    [(empty? ln) ""]
    [else (string-append (line-collapse (article-remove (first ln))) "\n"
                         (article-collapse (rest ln)))]))


; List-of-Strings -> String
; Converts a list-of-strings into a string by spacing " "
(check-expect (line-collapse l1) "a b c ")
(check-expect (line-collapse l2) "d e f ")

(define (line-collapse ls)
  (cond
    [(empty? ls) ""]
    [else (string-append (first ls) " " (line-collapse (rest ls)))]))


; String -> String
; The program consumes the name n of a file, reads the file,
; removes the articles, and writes the result out to a file
; whose name is the result of concatenating "no-articles-" with n.
(define (no-articles f)
  (write-file (string-append "no-articles-" f)
              (article-collapse (read-words/line f))))

