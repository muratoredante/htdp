;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_193) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define MT (empty-scene 50 50))
(define square-p
  (list
    (make-posn 10 10)
    (make-posn 20 10)
    (make-posn 20 20)
    (make-posn 10 20)))


; Image NELoP -> Image
; connects the Posns in p in an image
(define (connect-dots img p)
  (cond
    [(empty? (rest p)) img]
    [else (render-line (connect-dots img (rest p))
                       (first p)
                       (second p))]))
 
; Image Posn Posn -> Image 
; draws a red line from Posn p to Posn q into im
(define (render-line im p q)
  (scene+line
    im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))
 
; Polygon -> Posn
; extracts the last item from p
(define (last p)
  (cond
    [(empty? (rest (rest (rest p)))) (third p)]
    [else (last (rest p))]))

; Number Polygon -> Posn
; Adds an aditional point to the end of a polygon
(check-expect (add-at-end (make-posn 4 4)
              (list (make-posn 1 1) (make-posn 2 2) (make-posn 3 3)))
              (list (make-posn 1 1) (make-posn 2 2) (make-posn 3 3) (make-posn 4 4)))
(check-expect (add-at-end (make-posn 5 5)
              (list (make-posn 1 1) (make-posn 2 2) (make-posn 3 3) (make-posn 4 4)))
              (list (make-posn 1 1) (make-posn 2 2) (make-posn 3 3) (make-posn 4 4) (make-posn 5 5)))
(define (add-at-end e p)
  (cond
    [(empty? (rest (rest (rest p))))
     (cons (first p) (cons (second p) (cons (third p) (cons e '()))))]
    [else (cons (first p) (add-at-end e (rest p)))]))

(check-expect
  (render-poly-v1 MT square-p)
  (scene+line
    (scene+line
      (scene+line
        (scene+line MT 10 10 20 10 "red")
        20 10 20 20 "red")
      20 20 10 20 "red")
    10 20 10 10 "red"))
; Image Polygon -> Image 
; adds a corner of p to img
(define (render-poly-v1 img p)
  (connect-dots img (cons (last p) p)))

(check-expect
  (render-poly-v2 MT square-p)
  (scene+line
    (scene+line
      (scene+line
        (scene+line MT 10 10 20 10 "red")
        20 10 20 20 "red")
      20 20 10 20 "red")
    10 20 10 10 "red"))
; Image Polygon -> Image 
; adds a corner of p to img
(define (render-poly-v2 img p)
  (connect-dots img (add-at-end (first p) p)))

