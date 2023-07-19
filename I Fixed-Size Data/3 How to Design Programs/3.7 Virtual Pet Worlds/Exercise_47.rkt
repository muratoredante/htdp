;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_47) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Constants

(define MIN 0)
(define MAX 100)
(define BAR-HEIGHT 50)
(define D-RATE 0.1)
(define BACKGROUND
  (empty-scene MAX BAR-HEIGHT))


; A WorldState is a Number
; Interpretation: Level of Happiness

; WorldState -> WorldState
; At each tock happiness decreases by 0.1
(define (tock x)
  (if (> (- x D-RATE) 0) (- x D-RATE) 0))

(check-expect (tock 5) 4.9)
(check-expect (tock 0) 0)

; WorldState -> Image
; Show red bar based on happiness level
(define (render x)
  (rectangle x BAR-HEIGHT "solid" "red"))

; WorldState String -> WorldState
; Up-Down arrows change happiness
(define (keystroke-handler ws k)
  (cond
    [(string=? k "down") (- ws (* ws 1/5))]
    [(string=? k "up") (+ ws (* ws 1/3))]
    [else ws]))

(check-expect (keystroke-handler 5 "down")   (- 5(* 5 1/5)))
(check-expect (keystroke-handler 5 "up") (+ 5 (* 5 1/3)))

(define (gauge-prog ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [on-key keystroke-handler]))

; Missing a bunch of limit checkings, not great.