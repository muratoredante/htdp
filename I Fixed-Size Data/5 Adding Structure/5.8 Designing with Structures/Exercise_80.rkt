;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_80) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])
(define (f1 x)
  ...(movie-title x)...(movie-producer x)...(movie-year x))

(define-struct pet [name number])
(define (f2 x)
  (pet-name x)...(pet-number x))


(define-struct CD [artist title price])
(define (f3 x)
  (CD-artist x)... (CD-title x)...(CD-price x))

(define-struct sweater [material size producer])
(define (f4 x)
  (sweater-material x)... (sweater-size x)... (sweater-producer x))
