;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_86) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t


; Constants
(define BCKG-WIDTH 200)
(define L-SIZE 11)
(define LIMIT (* (/ BCKG-WIDTH L-SIZE) 3))
(define BCKG (empty-scene BCKG-WIDTH 20))
(define CURSOR (rectangle 1 20 "solid" "red"))

; String String -> Image
; Places cursor between strings
(check-expect (place-cursor "A" "B")
              (overlay/align "left" "center"
               (beside (text "A" L-SIZE "black")
                       CURSOR
                       (text "B" L-SIZE "black"))
               BCKG))
(define (place-cursor s1 s2)
                (overlay/align "left" "center"
               (beside (text s1 L-SIZE "black")
                       CURSOR
                       (text s2 L-SIZE "black"))
               BCKG))

; editor -> Image
; Renders the strings with cursor between them.
(check-expect (render (make-editor "A" "B")) (place-cursor "A" "B"))
(define (render e)
  (place-cursor (editor-pre e) (editor-post e)))
         


; Number String -> String
; Deletes char at given position
(check-expect (string-delete 1 "ABC") "AC")
(check-expect (string-delete 2 "ABC") "AB")
(define (string-delete i str)
  (if (= (string-length str) 0) ""
  (string-append (substring str 0 i)
                 (substring str (+ i 1) (string-length str)))))

; String -> String
; Delete last char of a string
(check-expect (string-rfirst "ABC") "BC")
(define (string-rfirst s)
  (string-delete 0 s))

; String -> String
; Delete last char of a string
(check-expect (string-rlast "ABC") "AB")
(define (string-rlast s)
  (string-delete (- (string-length s) 1) s))

; String -> String
; Get first char from string
(check-expect (string-first "ABC") "A")
(define (string-first s)
  (substring s 0 1))

; String -> String
; Get last char from string
(check-expect (string-last "ABC") "C")
(define (string-last s)
  (substring s (- (string-length s) 1) (string-length s)))


; String String -> editor
; Gets last from s1, adds it to s2 and deletes from s1. 
(check-expect (left-edit "A" "B") (make-editor "" "AB"))
(define (left-edit s1 s2)
  (make-editor (string-rlast s1) (string-append
                                  (string-last s1) s2)))
; String String -> editor 
; Gets first from s2, appends it to s1 and deletes from s2
(check-expect (right-edit "A" "B") (make-editor "AB" ""))
(define (right-edit s1 s2)
  (make-editor (string-append s1 (string-first s2))
               (string-rfirst s2)))

; editor -> Boolean
; Check if text is inside limit
(define (ed-limit ed)
  (< (+ (string-length (editor-pre ed))
     (string-length (editor-post ed)))
                    LIMIT))


; editor KeyEvent -> editor
; Add corresponding character to editor
(define edx (make-editor "A" "B"))
(define edxEmpty (make-editor "" "B"))
(check-expect (edit edx "C") (make-editor "AC" "B"))
(check-expect (edit edx "\b") (make-editor "" "B"))
(check-expect (edit edxEmpty "\b") (make-editor "" "B"))
(check-expect (edit edx "left") (make-editor "" "AB"))
(check-expect (edit edx "right") (make-editor "AB" ""))
(check-expect (edit edx "up") edx)

(define (edit ed ke)
  (cond
    [(string=? "\b" ke) (make-editor (string-rlast (editor-pre ed))
                                     (editor-post ed))]
    [(string=? "left" ke) (left-edit (editor-pre ed) (editor-post ed))]
    [(string=? "right" ke) (right-edit (editor-pre ed) (editor-post ed))]
    [(and (= (string-length ke) 1) (ed-limit ed))
          (make-editor
                               (string-append (editor-pre ed) ke)
                               (editor-post ed))]
    [else ed]))


(define (run pre)
   (big-bang (make-editor pre "")
     [to-draw render]
     [on-key edit]))
