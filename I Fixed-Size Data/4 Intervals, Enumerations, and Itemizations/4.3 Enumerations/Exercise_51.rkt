;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_51) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume 

; WorldState is a TrafficLight
; Describes the color of the state

;Constants
(define R 20)

; WorldState -> Image
; Represent ws as circle of corresponding color
(check-expect (render "red") (circle R "solid" "red"))
(check-expect (render "red") (circle R "solid" "red"))
(define (render ws)
 (circle R "solid" ws))

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; WorldState -> WorldState
; Changes TrafficLight accordingly at each tock
(check-expect (tock "red") "green")
(define (tock x)
  (traffic-light-next x))

(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]))