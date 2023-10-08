;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_196) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
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

; A Letter-Counts is a posn
; (make-posn String Number)
; Represents how many of a certain letter were counted

; A List-of-Letter-Counts is one of:
; '()
; (cons Letter-Counts List-of-Letter-Counts)

; Dictionary -> List-of-Letter-Counts
; counts how often each letter is used as the first
; one of a word in the given dictionary

(check-expect (count-by-letter (list "ab" "ba" "as" "af" "cab"))
              (list (make-posn "a" 3) (make-posn "b" 1) (make-posn "c" 1)))
(check-expect (count-by-letter '())
              '())
              
(define (count-by-letter d)
  (cleanup (aux-count-by-letter d LETTERS)))

(define (aux-count-by-letter d lr)
  (cond
    [(empty? lr) '()]
    [else (cons (make-posn (first lr) (starts-with# (first lr) d))
                 (aux-count-by-letter d (rest lr)))]))

(define (cleanup l)
  (cond
    [(empty? l) '()]
    [else (if (= (posn-y (first l)) 0)
              (cleanup (rest l))
              (cons (first l) (cleanup (rest l))))]))

(count-by-letter AS-LIST)