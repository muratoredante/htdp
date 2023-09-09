;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_169) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-Posn -> List-of-Posn
; Returns all Posns whose x-coordinates are between 0 and 100
; and whose y-coordinates are between 0 and 200


(define (legal l)
  (cond
    [(empty? l) '()]
    [else (if (legality (first l)) (cons (first l) (rest l))
               (legal (rest l)))]))

; Posn -> Boolean
(check-expect (legality (make-posn 2 4)) #true)
(check-expect (legality (make-posn 101 0)) #false)
(check-expect (legality (make-posn 0 201)) #false)
(check-expect (legality (make-posn 0 -5)) #false)

(define (legality p)
  (and (and (>= (posn-x p) 0) (<= (posn-x p) 100))
       (and (>= (posn-y p) 0) (<= (posn-y p) 200))))