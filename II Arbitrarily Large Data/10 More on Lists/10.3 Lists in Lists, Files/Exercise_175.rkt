;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_175) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define l1 (cons "a" (cons "bc" (cons "ccc" '()))))
(define l2 (cons "d" (cons "be" (cons "f" '()))))

(define-struct wc-result [char word line])
; (make-wc-result Number Number Number)
; Result of counting 1Strings, words and lines in a file.

; String -> wc-result
; Counts the number of 1Strings, words, and lines in a given file.
(define (wc f)
 (wc-aux (read-words/line f)))

; LN -> wc-result
(check-expect (wc-aux (cons l1 (cons l2 '())))
              (make-wc-result 10 6 2))
(define (wc-aux ln)
  (make-wc-result (count-letters ln) (count-words ln) (length ln)))

; LN -> Number
(check-expect (count-words (cons l1 (cons l2 '())))
              (+ 3 3))
(define (count-words ln)
  (cond
    [(empty? ln) 0]
    [else (+ (length (first ln)) (count-words (rest ln)))]))

; LN -> Number
(check-expect (count-letters (cons l1 (cons l2 '())))
              (+ (+ 1 2 3) (+ 1 2 1)))
(define (count-letters ln)
  (cond
    [(empty? ln) 0]
    [else (+ (length-letters (first ln)) (count-letters (rest ln)))]))

; List-of-Strings -> Number
(check-expect (length-letters l1) (+ 1 2 3))
(define (length-letters ls)
  (cond
    [(empty? ls) 0]
    [else (+ (string-length (first ls)) (length-letters (rest ls)))]))