;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_79) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A Color is one of: 
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"

; Examples: "green", "black"


; H is a Number between 0 and 100.
; interpretation represents a happiness value

; Examples: 0, 100, 50

(define-struct person [fstname lstname male?])
; A Person is a structure:
;   (make-person String String Boolean)

; Examples: (make-person "Albert" "Einsten" #true)
;           (make-person "Ayya"   "Khema"   #false)

; Is it a good idea to use a field name that looks
; like the name of a predicate?
; No. We want to be consistent in that x? are predicates

(define-struct dog [owner name age happiness])
; A Dog is a structure:
;   (make-dog Person String PositiveInteger H)

; Examples: (make-dog (make-person "Albert "Einsten" #true)
;             "Clifford" 4 80)

; A Weapon is one of: 
; — #false
; — Posn
; interpretation #false means the missile hasn't 
; been fired yet; a Posn means it is in flight

; Examples: #false, (make-posn 4 5)

