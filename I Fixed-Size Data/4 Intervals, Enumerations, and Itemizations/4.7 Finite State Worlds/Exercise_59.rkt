;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_59) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; Constants
(define HEIGHT 20)
(define LENGTH 60)
(define t-rectangle (rectangle LENGTH HEIGHT "outline" "black"))
(define t-red (place-image (circle (/ HEIGHT 3) "outline" "red") (* LENGTH 0.25) (/ HEIGHT 2) t-rectangle))
(define t-red-yellow (place-image (circle (/ HEIGHT 3) "outline" "yellow") (* LENGTH 0.50) (/ HEIGHT 2) t-red))
(define traffic-lights (place-image (circle (/ HEIGHT 3) "outline" "green") (* LENGTH 0.75) (/ HEIGHT 2) t-red-yellow))

; TrafficLight -> Image
; Light a particular traffic light
(check-expect (light "red")
              (place-image (circle (/ HEIGHT 3) "solid" "red")
              (* LENGTH 0.25) (/ HEIGHT 2) traffic-lights))
(check-expect (light "yellow")
              (place-image (circle (/ HEIGHT 3) "solid" "yellow")
              (* LENGTH 0.5) (/ HEIGHT 2) traffic-lights))
(check-expect (light "green")
              (place-image (circle (/ HEIGHT 3) "solid" "green")
              (* LENGTH 0.75) (/ HEIGHT 2) traffic-lights))
(define (light c)
  (place-image (circle (/ HEIGHT 3) "solid" c)
               (* LENGTH
                    (cond
    [(string=? "red" c) 0.25]
    [(string=? "yellow" c) 0.50]
    [(string=? "green" c) 0.75]))

               (/ HEIGHT 2) traffic-lights)
)


; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (tl-next "red") "green")
(check-expect (tl-next "green") "yellow")
(check-expect (tl-next "yellow") "red")
(define (tl-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw light]
    [on-tick tl-next 1]))