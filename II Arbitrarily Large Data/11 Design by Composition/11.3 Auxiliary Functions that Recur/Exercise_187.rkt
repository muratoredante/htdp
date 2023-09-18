;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_187) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct gp [name score])
; A GamePlayer is a structure: 
;    (make-gp String Number)
; interpretation (make-gp p s) represents player p who 
; scored a maximum of s points

; GamePlayer-List -> GamePlayer-List
(check-expect (sort-players (list (make-gp "a" 2) (make-gp "b" 4)))
              (list (make-gp "b" 4) (make-gp "a" 2)))

(define (sort-players l)
  (cond
    [(empty? l) '()]
    [else (insert (first l) (sort-players (rest l)))]))

; GamePlayer GamePlayer-List -> GamePlayer-List
(check-expect (insert (make-gp "a" 2) (list (make-gp "b" 4)))
              (list (make-gp "b" 4) (make-gp "a" 2)))
(define (insert g l)
  (cond
    [(empty? l) (list g)]
    [else (if (greater g (first l)) (cons g l)
              (cons (first l) (insert g (rest l))))]))

; GamePlayer GamePlayer -> Boolean
(check-expect (greater (make-gp "b" 4) (make-gp "a" 2)) #true)
(define (greater gp1 gp2)
  (> (gp-score gp1) (gp-score gp2)))