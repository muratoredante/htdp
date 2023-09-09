;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_170) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct phone [area switch four])
; A Phone is a structure: 
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999. 
; A Four is a Number between 1000 and 9999. 

; List-of-phones -> List-of-phones
(check-expect (replace (cons (make-phone 713 1 1)
                            (cons (make-phone 712 1 1) '())))
              (cons (make-phone 281 1 1)
                            (cons (make-phone 712 1 1) '())))
(define (replace lp)
  (cond
    [(empty? lp) '()]
    [else (cons (helper (first lp)) (replace (rest lp)))]))

; Phone -> Phone
(check-expect (helper (make-phone 713 1 1 ))
              (make-phone 281 1 1))
(check-expect (helper (make-phone 712 1 1 ))
              (make-phone 712 1 1))
(define (helper p)
  (make-phone (if (= (phone-area p) 713) 281 (phone-area p))
              (phone-switch p) (phone-four p)))