;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_109) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a (b|c)* d

; ExpectsToSee is one of:
; – AA
; – BB
; – DD 
; – ER 
 
(define AA "start, expect an 'a'")
(define BB "expect 'b', 'c', or 'd'")
(define DD "finished")
(define ER "error, illegal key" )

; Constants

(define WHITE  (rectangle 100 100 "solid" "white"))
(define YELLOW (rectangle 100 100 "solid" "yellow"))
(define GREEN  (rectangle 100 100 "solid" "green"))
(define RED    (rectangle 100 100 "solid" "red"))

; ExpectsToSee -> Image
; Color for each state
(check-expect (render AA) WHITE)
(check-expect (render BB) YELLOW)
(check-expect (render DD) GREEN)
(check-expect (render ER) RED)

(define (render e)
  (cond
    [(string=? e AA) WHITE]
    [(string=? e BB) YELLOW]
    [(string=? e DD) GREEN]
    [(string=? e ER) RED]))

; ExpectsToSee KeyStroke -> ExpectsToSee
; Actual FSM
(check-expect (k-handle AA "a") BB)
(check-expect (k-handle AA "d") ER)
(check-expect (k-handle BB "b") BB)
(check-expect (k-handle BB "c") BB)
(check-expect (k-handle BB "h") ER)
(check-expect (k-handle BB "d") DD)
(check-expect (k-handle DD "p") DD)

(define (k-handle e k)
  (cond
    [(string=? e AA) (if (string=? k "a") BB ER)]
    [(string=? e BB)
     (cond
       [(or (string=? k "b") (string=? k "c")) BB]
       [(string=? k "d") DD]
       [else ER])
     ]
    [else e]))

(define (main ws)
   (big-bang ws
     [to-draw render]
     [on-key k-handle]))