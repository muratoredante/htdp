;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_82) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A TLW is one of
; - Lowercase 1Strings
; - #false

(define-struct three-letter-w [l1 l2 l3])
; A three-letter-w is a structure
; (make-three-letter-w TLW TLW TLW)
; Interpretation three-letter words


; TLW TLW -> TLW
; Compares two letters
(check-expect (tlw-c "a" "a") "a")
(check-expect (tlw-c "a" "b") #false)
(define (tlw-c l1 l2)
  (cond
    [(or (boolean? l1) (boolean? l2)) #false]
    [(string=? l1 l2) l1]
    [else #false]))

; three-letter-w three-letter-w -> three-letter-w
; It produces a word that indicates where the
; given ones agree and disagree
(check-expect (compare-word
               (make-three-letter-w "a" "a" "a")
               (make-three-letter-w "a" "a" "a"))
               (make-three-letter-w "a" "a" "a"))
(check-expect (compare-word
               (make-three-letter-w "a" "a" "a")
               (make-three-letter-w "a" "b" "a"))
               (make-three-letter-w "a" #false "a"))
(define (compare-word w1 w2)
  (make-three-letter-w (tlw-c (three-letter-w-l1 w1) (three-letter-w-l1 w2))
                       (tlw-c (three-letter-w-l2 w1) (three-letter-w-l2 w2)) 
                       (tlw-c (three-letter-w-l3 w1) (three-letter-w-l3 w2))))

