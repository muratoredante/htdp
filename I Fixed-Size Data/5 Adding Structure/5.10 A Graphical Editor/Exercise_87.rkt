;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_87) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [text i])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; text contains the entire text entered
; i is the  number of characters between the first character
; (counting from the left) and the cursor

; Constants
(define BCKG-WIDTH 200)
(define L-SIZE 11)
(define LIMIT (* (/ BCKG-WIDTH L-SIZE) 3))
(define BCKG (empty-scene BCKG-WIDTH 20))
(define CURSOR (rectangle 1 20 "solid" "red"))

; String Number -> Image
; Places cursor at i place in string
(check-expect (place-cursor "ABC" 1)
              (overlay/align "left" "center"
               (beside (text (substring "ABC" 0 1) L-SIZE "black")
                       CURSOR
                       (text (substring "ABC" 1 3) L-SIZE "black"))
               BCKG))
(define (place-cursor s i)
              (overlay/align "left" "center"
               (beside (text (substring s 0 i) L-SIZE "black")
                       CURSOR
                       (text (substring s i (string-length s))
                                        L-SIZE "black"))
               BCKG))