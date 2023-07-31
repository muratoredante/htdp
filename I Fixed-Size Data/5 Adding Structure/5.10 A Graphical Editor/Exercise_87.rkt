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

; editor -> Image
; Renders the strings with cursor between them.
(check-expect (render (make-editor "ABC" 1)) (place-cursor "ABC" 1))
(define (render e)
  (place-cursor (editor-text e) (editor-i e)))

; Number String -> String
; Deletes char at given position
(check-expect (string-delete 1 "ABC") "AC")
(check-expect (string-delete 2 "ABC") "AB")
(define (string-delete i str)
  (if (= (string-length str) 0) ""
  (string-append (substring str 0 i)
                 (substring str (+ i 1) (string-length str)))))

; Number String 1String -> String
; Places char at given position
(check-expect (string-insert 1 "ABC" "X") "AXBC") 
(define (string-insert i str char)
  (string-append (substring str 0 i) char
                 (substring str i (string-length str))))

; editor -> Boolean
; Check if text is inside limit
(define (ed-limit ed)
  (< (string-length (editor-text ed))
                    LIMIT))

; editor KeyEvent -> editor
; Add corresponding character to editor
(define edx (make-editor "ABC" 1))
(define edx-left (make-editor "ABC" 0))
(define edx-right (make-editor "ABC" 2))
(check-expect (edit edx "D") (make-editor "ADBC" 2))
(check-expect (edit edx "\b") (make-editor "BC" 0))
(check-expect (edit edx-left "\b") (make-editor "ABC" 0))
(check-expect (edit edx "left") (make-editor "ABC" 0))
(check-expect (edit edx "right") (make-editor "ABC" 2))
(check-expect (edit edx "up") edx)

(define (edit ed ke)
  (cond
    [(string=? "\b" ke) (if (> (editor-i ed) 0)
     (make-editor (string-delete (- (editor-i ed) 1) (editor-text ed))
                                     (- (editor-i ed) 1)) ed)]
    [(and (string=? "left" ke) (> (editor-i ed) 0))
     (make-editor (editor-text ed) (- (editor-i ed) 1))]
    [(and (string=? "right" ke) (< (editor-i ed) (string-length (editor-text ed))))
     (make-editor (editor-text ed) (+ (editor-i ed) 1))]
    [(and (= (string-length ke) 1) (ed-limit ed))
     (make-editor (string-insert (editor-i ed) (editor-text ed) ke) (+ (editor-i ed) 1))]
    [else ed]))


(define (run text)
   (big-bang (make-editor text 0)
     [to-draw render]
     [on-key edit]))
