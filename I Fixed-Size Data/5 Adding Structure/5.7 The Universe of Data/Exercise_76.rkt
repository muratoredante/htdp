;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_76) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])
; A movie is a structure
; (make-movie String String Number)
; Interpretation a movie's title producer and release year

(define-struct person [name hair eyes phone])
; A person is a structure
; (make-person String String String String)
; Interpretation a person's name, hair color, eye color
; and phone number

(define-struct pet [name number])
; A pet is a structure
; (make-pet String String)
; A pet's name and owners number

(define-struct CD [artist title price])
; A CD is a structure
; (make-CD String String Number)
; A CD's artist and title with its price

(define-struct sweater [material size producer])
; A sweater is a structure
; (make-sweater String Number String)
; A sweater's material type, size and producer