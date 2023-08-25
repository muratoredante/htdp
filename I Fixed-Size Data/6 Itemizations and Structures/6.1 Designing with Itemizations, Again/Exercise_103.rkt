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

; Boa -> Number
; Calculates volume of boa
(define (volume-boa b)
  (* (sqr (boa-length b)) (boa-girth b) pi))

; ZooAnimal Number -> Boolean
; Checks whether the v volume of the cage is enough for animal
(check-expect (fits? 5 10) #true)
(check-expect (fits? (make-spider 11 9) 8) #false)
(check-expect (fits? (make-boa 5 5) 392) #false)
(check-expect (fits? (make-armadillo 4 5) 5) #true)
(define (fits? a v)
  (> v
     (cond
    [(spider? a) (spider-space a)]
    [(boa? a) (volume-boa a)]
    [(number? a) a]
    [(armadillo? a) (armadillo-space a)])))