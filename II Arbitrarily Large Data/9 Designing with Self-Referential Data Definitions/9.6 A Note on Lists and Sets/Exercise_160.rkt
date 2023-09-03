;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_160) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A Son.L is one of: 
; – empty 
; – (cons Number Son.L)
; 
; Son is used when it 
; applies to Son.L and Son.R
  

; A Son.R is one of: 
; – empty 
; – (cons Number Son.R)
; 
; Constraint If s is a Son.R, 
; no number occurs twice in s


; Number Son.L -> Son.L
; adds x to s 
(define (set+.L x s)
  (cons x s))

; Number Son.R -> Son.L
; adds x to s 
(define (set+.R x s)
  (if (check-all x s) s
      (cons x s)))

; Number Son.R -> Boolean
; Checks whether the element x is in the set
(define (check-all x s)
  (cond
    [(empty? s) #false]
    [else (or (= (first s) x) (check-all x (rest s)))]))
