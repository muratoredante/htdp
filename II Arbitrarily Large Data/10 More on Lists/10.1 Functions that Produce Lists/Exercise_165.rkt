;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_165) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-Strings -> List-of-Strings
; Replaces every "robot" to "r2d2"
(check-expect (subst-robot (cons "toy" (cons "robot" '())))
              (cons "toy" (cons "r2d2" '())))

(define (subst-robot l)
  (cond
    [(empty? l) '()]
    [else (cons (if (string=? (first l) "robot") "r2d2" (first l))
          (subst-robot (rest l)))]))

; List-of-Strings String String -> List-of-Strings
; Replaces every occurence of str with sub
(check-expect (replace (cons "toy" (cons "robot" '())) "robot" "r2d2")
              (cons "toy" (cons "r2d2" '())))

(define (replace l str sub)
  (cond
    [(empty? l) '()]
    [else (cons (if (string=? (first l) str) sub (first l))
          (subst-robot (rest l)))]))