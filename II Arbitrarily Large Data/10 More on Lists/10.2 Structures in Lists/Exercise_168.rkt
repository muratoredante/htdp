;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_168) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-Posns -> List-of-Posns
; For each (make-posn x y) in the former,
; the latter contains (make-posn x (+ y 1)).

(check-expect (translate (cons (make-posn 1 2)
                          (cons (make-posn 4 5)'())))
              (cons (make-posn 1 3)
                (cons (make-posn 4 6)'())))

(define (translate l)
  (cond
    [(empty? l) '()]
    [else (cons (increment (first l)) (translate (rest l)))]))

; Posn -> Posn
; Increment y-coordinate by one
(check-expect (increment (make-posn 1 2)) (make-posn 1 3))
(define (increment p)
  (make-posn (posn-x p) (+ (posn-y p) 1)))