;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_83) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

; Constants
(define BCKG (empty-scene 200 20))
(define CURSOR (rectangle 1 20 "solid" "red"))

; String String -> Image
; Places cursor between strings
(check-expect (place-cursor "A" "B")
              (overlay/align "left" "center"
               (beside (text "A" 11 "black")
                       CURSOR
                       (text "B" 11 "black"))
               BCKG))
(define (place-cursor s1 s2)
                (overlay/align "left" "center"
               (beside (text s1 11 "black")
                       CURSOR
                       (text s2 11 "black"))
               BCKG))

; editor -> Image
; Renders the strings with cursor between them.
(check-expect (render (make-editor "A" "B")) (place-cursor "A" "B"))
(define (render e)
  (place-cursor (editor-pre e) (editor-post e)))
         