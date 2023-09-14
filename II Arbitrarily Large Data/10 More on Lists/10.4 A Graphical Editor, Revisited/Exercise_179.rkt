;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_179) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor Lo1S Lo1S) 
; An Lo1S is one of: 
; – '()
; – (cons 1String Lo1S)

; Lo1s 1String -> Lo1s
; creates a new list by adding s to the end of l
 
(check-expect
  (add-at-end (cons "c" (cons "b" '())) "a")
  (cons "c" (cons "b" (cons "a" '()))))
(define (add-at-end l s)
  (cond
    [(empty? l) (cons s '())]
    [else
     (cons (first l) (add-at-end (rest l) s))]))

; Lo1s -> Lo1s 
; produces a reverse version of the given list 
 
(check-expect
  (rev (cons "a" (cons "b" (cons "c" '()))))
  (cons "c" (cons "b" (cons "a" '()))))
(define (rev l)
  (cond
    [(empty? l) '()]
    [else (add-at-end (rev (rest l)) (first l))]))


; String String -> Editor
; The first string is the text to the left of the cursor and the
; second string is the text to the right of the cursor
(check-expect (create-editor "ah" "bc")
              (make-editor (cons "h" (cons "a" '())) (cons "b" (cons "c" '()))))

(define (create-editor l r)
  (make-editor (rev (explode l)) (explode r)))

; Editor -> Editor
; moves the cursor position one 1String left, 
; if possible
(check-expect (editor-lft (create-editor "ab" "c"))
                          (create-editor "a" "bc"))
(check-expect (editor-lft (create-editor "c" ""))
                          (create-editor "" "c"))
(check-expect (editor-lft (create-editor "" "ab"))
                          (create-editor "" "ab"))

(define (editor-lft ed)
  (if (empty? (editor-pre ed)) ed
  (make-editor (rest (editor-pre ed))
               (cons (first (editor-pre ed)) (editor-post ed)))))

; Editor -> Editor
; moves the cursor position one 1String right, 
; if possible 
(check-expect (editor-rgt (create-editor "a" "bc"))
                          (create-editor "ab" "c"))
(check-expect (editor-rgt (create-editor "" "c"))
                          (create-editor "c" ""))
(check-expect (editor-rgt (create-editor "ab" ""))
                          (create-editor "ab" ""))

(define (editor-rgt ed)
  (if (empty? (editor-post ed)) ed
  (make-editor (cons (first (editor-post ed)) (editor-pre ed))
               (rest (editor-post ed)))))

 
; Editor -> Editor
; deletes a 1String to the left of the cursor,
; if possible
(check-expect (editor-del (create-editor "ab" "c"))
                          (create-editor "a" "c"))
(check-expect (editor-del (create-editor "ab" ""))
                          (create-editor "a" ""))
(check-expect (editor-del (create-editor "" "cd"))
                          (create-editor "" "cd"))
(define (editor-del ed)
  (if (empty? (editor-pre ed)) ed
  (make-editor (rest (editor-pre ed)) (editor-post ed))))
