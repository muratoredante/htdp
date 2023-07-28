;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_72) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct centry [name home office cell])
 
(define-struct phone [area number])
; A phone is a structure:
; (make-phone Number String)
; interpretation area code and local phone number.

(define-struct phone# [area switch num])
; A phone is a structure:
; (make-phone String String String)
; interpretation
; Area code [000,999]
; Code for the phone switch [000,999]
; Local Phone [0000,9999]