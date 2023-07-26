;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_60) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; TrafficLight -> TrafficLight
; yields the next state given current state s
; An N-TrafficLight is one of:
; – 0 interpretation the traffic light shows red
; – 1 interpretation the traffic light shows green
; – 2 interpretation the traffic light shows yellow

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next-numeric 0) 1)
(check-expect (tl-next-numeric 1) 2)
(check-expect (tl-next-numeric 2) 0)
(define (tl-next-numeric cs) (modulo (+ cs 1) 3))


; It is harder to remember what each data stands for in
; terms of information. But the use of modulo does give
; a deeper understanding of the problem.