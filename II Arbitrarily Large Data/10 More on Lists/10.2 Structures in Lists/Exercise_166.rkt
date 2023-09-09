;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_166) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct work [name number rate hours])
; A (piece of) Work is a structure: 
;   (make-work String Number Number Number)
; interpretation (make-work n i r h) combines the name 
; with the pay rate r and the number of hours h
; i represents the employee number

(define-struct paycheck [name number amount])
; A Paycheck is a structure:
; (make-paycheck String Number Number)
; name of employee, employee number and amount payed

; Low (short for list of works) is one of: 
; – '()
; – (cons Work Low)
; interpretation an instance of Low represents the 
; hours worked for a number of employees

; LoP (short for list of paychecks) is one of: 
; – '()
; – (cons Work Paycheck)
; interpretation an instance of LoP represents the 
; paychecks for a number of employees

; Low -> LoP
; computes the weekly wages for all weekly work records 
 
(check-expect
  (wage*.v4 (cons (make-work "Rob" 2 11 35) '()))
  (cons (make-paycheck "Rob" 2 (* 11 35)) '()))
 
(define (wage*.v4 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low) (cons (wage.v4 (first an-low))
                          (wage*.v4 (rest an-low)))]))
 
; Work -> Paycheck
; computes the wage for the given work record w
(check-expect (wage.v4 (make-work "Rob" 2 11 35))
              (make-paycheck "Rob" 2 (* 11 35)))
(define (wage.v4 w)
  (make-paycheck (work-name w) (work-number w) (* (work-rate w) (work-hours w))))