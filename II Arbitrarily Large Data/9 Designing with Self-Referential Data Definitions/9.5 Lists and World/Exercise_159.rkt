;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_159) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; N Image -> Image
; Produces a column of n copies of img
(check-expect (col 0 (circle 4 "outline" "red")) empty-image)
(check-expect (col 3 (circle 4 "outline" "red"))
              (above (circle 4 "outline" "red")
                      (above (circle 4 "outline" "red") (circle 4 "outline" "red"))))

(define (col n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (above img (col (sub1 n) img))]))

; N Image -> Image
; Produces a row of n copies of img
(check-expect (row 0 (circle 4 "outline" "red")) empty-image)
(check-expect (row 3 (circle 4 "outline" "red"))
              (beside (circle 4 "outline" "red")
                      (beside (circle 4 "outline" "red") (circle 4 "outline" "red"))))

(define (row n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (beside img (row (sub1 n) img))]))


; List-of-Posn -> Image
; Lecture hall with red dots added as specified
(check-expect (add-ballons '()) LECTURE-HALL)
(check-expect (add-ballons (cons (make-posn 10 20)'()))
                           (place-image
                            (circle 5 "solid" "red")
                            10 20
                            LECTURE-HALL))

(define (add-ballons l)
  (cond
    [(empty? l) LECTURE-HALL]
    [else (place-image (circle 5 "solid" "red") (posn-x (first l)) (posn-y (first l))
                       (add-ballons (rest l)))]))


(define-struct pair [balloon# lob])
; A Pair is a structure (make-pair N List-of-posns)
; A List-of-posns is one of: 
; – '()
; – (cons Posn List-of-posns)
; interpretation (make-pair n lob) means n balloons 
; must yet be thrown and added to lob

; Constants

(define LECTURE-HALL (place-image
                                  (col 20 (row 10 (square 10 "outline" "black")))
                                  50 100
                                  (empty-scene 100 200)))

; Pair -> Pair
; Throw a ballon
(check-random (tock (make-pair 3 (cons (make-posn 1 3) '())))
                    (make-pair 2 (cons (make-posn (random 100) (random 200)) (cons (make-posn 1 3) '()))))
(check-random (tock (make-pair 0 (cons (make-posn 1 3) '())))
                    (make-pair 0 (cons (make-posn 1 3) '())))

(define (tock p)
  (if (> (pair-balloon# p) 0)
  (make-pair (- (pair-balloon# p) 1)
             (cons (make-posn (random 100) (random 200)) (pair-lob p)))
  p))

; Pair -> Image
; Renders the balloons

(check-expect (render (make-pair 3 (cons (make-posn 1 3) '())))
              (add-ballons (cons (make-posn 1 3) '())))

(define (render p)
  (add-ballons (pair-lob p)))


(define (main w0)
  (big-bang w0
    [on-tick tock]
    [to-draw render]))