;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_142) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; ImageOrFalse is one of:
; – Image
; – #false

; List-of-images is one of:
; - '()
; (cons Image List-of-images)

; List-of-images -> ImageOrFalse
; It produces the first image on loi that is not an n by n
; square; if it cannot find such an image, it produces #false.
(check-expect (ill-sized? '()) #false)
(check-expect (ill-sized? (cons (rectangle 50 50 "outline" "red")
                                '())) #false)
(check-expect (ill-sized?
              (cons (rectangle 50 50 "outline" "red")
                    (cons (rectangle 49 50 "outline" "red")
                                '()))) (rectangle 49 50 "outline" "red"))



(define (ill-sized? l)
  (cond
    [(empty? l) #false]
    [else (if (not (= (image-height (first l))
                 (image-width (first l)))) (first l)
                 (ill-sized? (rest l)))]))


