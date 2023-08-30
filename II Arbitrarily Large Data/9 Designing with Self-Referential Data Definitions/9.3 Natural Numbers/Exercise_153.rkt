;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_153) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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


(define LECTURE-HALL (place-image
                                  (col 20 (row 10 (square 10 "outline" "black")))
                                  50 100
                                  (empty-scene 100 200)))

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
