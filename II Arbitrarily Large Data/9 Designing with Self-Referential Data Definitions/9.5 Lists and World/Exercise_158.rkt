;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_158) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 220) ; distances in terms of pixels 
(define WIDTH 30)
(define XSHOTS (/ WIDTH 3))
 
; graphical constants 
(define BACKGROUND (rectangle WIDTH HEIGHT "solid" "GREEN"))
(define SHOT (rectangle 3 7 "solid" "red"))

; ShotWorld -> ShotWorld 
(define (main w0)
  (big-bang w0
    [on-tick tock]
    [on-key keyh]
    [to-draw to-image]))
 
; ShotWorld -> ShotWorld 
; moves each shot up by one pixel
; When shot outside cavas, removes it
(check-expect (tock '()) '())
(check-expect (tock (cons 4 (cons 5 '()))) (cons 3 (cons 4 '())))
(check-expect (tock (cons 4 (cons -5 '()))) (cons 3 '()))

(define (tock w)
  (cond
    [(empty? w) '()]
    [else (if (> (sub1 (first w)) 0)
              (cons (sub1 (first w)) (tock (rest w)))
              (tock (rest w)))]))
 
; ShotWorld KeyEvent -> ShotWorld 
; adds a shot to the world if the space bar is hit
(check-expect (keyh (cons 3 (cons 2 '())) "A") (cons 3 (cons 2 '())))
(check-expect (keyh (cons 3 (cons 2 '())) " ") (cons HEIGHT (cons 3 (cons 2 '()))))

(define (keyh w ke)
  (if (key=? ke " ") (cons HEIGHT w) w))
 
; ShotWorld -> Image 
; adds each shot y on w at (XSHOTS,y} to BACKGROUND
(check-expect (to-image '()) BACKGROUND)
(check-expect (to-image (cons 9 '()))
              (place-image SHOT XSHOTS 9 BACKGROUND))


(define (to-image w)
  (cond
    [(empty? w) BACKGROUND]
    [else (place-image SHOT XSHOTS (first w)
                       (to-image (rest w)))]))