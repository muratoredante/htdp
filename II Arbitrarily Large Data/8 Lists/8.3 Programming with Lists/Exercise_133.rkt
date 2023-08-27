;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_133) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;(cond
;      [(string=? (first alon) "Flatt") #true]
;      [else (contains-flatt? (rest alon))]) ...
;vs
;       (or (string=? (first alon) "Flatt")
;        (contains-flatt? (rest alon)))]

; The first expression says:
; If first condition is true return true
; otherwise return the boolean value of second expression
; Therefore if first condition is true then true
; If second condition is true regardless of first then true
; That is the same as an or.

; I find the second one more clear
; because it avoids nesting another cond
; It also makes the fact that the return value
; is a boolean more clear