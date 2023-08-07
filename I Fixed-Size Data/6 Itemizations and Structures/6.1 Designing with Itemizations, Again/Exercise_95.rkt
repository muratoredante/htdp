;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_95) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game

; Explain why the three instances are generated
; according to the first or
; second clause of the data definition

; A SIGS must be one of those two.

; (make-aim (make-posn 20 10) (make-tank 28 -3))
; It uses "make-aim" and has 2 arguments. First clause.

; (make-fired (make-posn 20 10)
;             (make-tank 28 -3)
;             (make-posn 28 (- HEIGHT TANK-HEIGHT)))
; It uses "make-fired" and has 3 arguments. Second clause

; Also UFO and Missle are simply Posn structures.