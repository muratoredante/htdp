;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_114) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game

(define (SIGS? v)
  (or (aim? v) (fired? v)))

; A Coordinate is one of: 
; – a NegativeNumber 
; interpretation on the y axis, distance from top
; – a PositiveNumber 
; interpretation on the x axis, distance from left
; – a Posn
; interpretation an ordinary Cartesian point

(define (Coordinate? c)
  (or (number? c) (posn? c)))

; A VAnimal is either
; – a VCat
; – a VCham

(define (VAnimal? a)
  (or (VCat? a) (VCham? a)))


; Won't actually copy paste the entire programs but the idea is:

(define (main s0)
  (big-bang s0
            ...
            [check-with SIGS?]
            ...))

(define (main s0)
  (big-bang s0
            ...
            [check-with Coordinate?]
            ...))

(define (main s0)
  (big-bang s0
            ...
            [check-with VAnimal?]
            ...))