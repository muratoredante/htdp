;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_152) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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


