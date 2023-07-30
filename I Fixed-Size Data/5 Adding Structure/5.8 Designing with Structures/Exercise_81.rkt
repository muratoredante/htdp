;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_81) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct time-point [hour minute second])
; A time-point is a structure
; (make-time-point Number Number Number)
; hour [0,23], minute [0,60], second [0,60]
; Interpretation point in time since midnight

; time-point -> Number
; consumes t and produces the number of seconds
; that have passed since midnight
(check-expect (time->seconds (make-time-point 1 1 1))
              (+ (* 1 3600) (* 1 60) 1))
(define (time->seconds t)
  (+ (* (time-point-hour t) 3600)
     (* (time-point-minute t) 60)
     (time-point-second t)))