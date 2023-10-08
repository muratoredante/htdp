;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_195) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define LOCATION "/usr/share/dict/words")

; A Dictionary is a List-of-strings.
(define AS-LIST (read-lines LOCATION))

; A Letter is one of the following 1Strings: 
; – "a"
; – ... 
; – "z"
; or, equivalently, a member? of this list: 
(define LETTERS
  (explode "abcdefghijklmnopqrstuvwxyz"))

; Letter Dictionary -> Number
; consumes a Letter and Dictionary and then counts how many
; words in the given Dictionary start with the given Letter.
(check-expect (starts-with# "a" (list "all" "arc" "board" "san" "ack")) 3)
(check-expect (starts-with# "a" (list  "board" "san")) 0)
(check-expect (starts-with# "a" (list )) 0)
(define (starts-with# l d)
  (cond
    [(empty? d) 0]
    [else (if (starts-with l (first d))
              (+ 1 (starts-with# l (rest d)))
              (starts-with# l (rest d)))]))

; 1String String -> Boolean
(check-expect (starts-with "a" "ab") #true)
(define (starts-with c w)
  (if (> (string-length w) 0)
      (string=? (substring w 0 1) c)
      #false))

(starts-with# "e" AS-LIST)
(starts-with# "z" AS-LIST)