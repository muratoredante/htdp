;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_103) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct spider [legs space])
; A spider is a structure:
; (make-spider Number Number)
; interpretation Number of missing legs and space needed

; A elephant is a Number
; interptation Number represents the space they need

(define-struct boa [length girth])
; A boa constrictor is a structure:
; (make-spider Number Number)
; interpretation length and girth

(define-struct armadillo [space name])
; An armardillo is a data structure:
; (make-armadillo Number String)
; interptation Space they need and its name

; A ZooAnimal is one of:
; -spider
; -elephant
; -boa
; -armadillo

; ZooAnimal Number -> Boolean
; Checks whether the v volume of the cage is enough for animal
(define (fits? a v)
  (< v
     (cond
    [(spider? a) ]
    [(elephant? a)]
    [(number? a)]
    [(armadillo? a)]))