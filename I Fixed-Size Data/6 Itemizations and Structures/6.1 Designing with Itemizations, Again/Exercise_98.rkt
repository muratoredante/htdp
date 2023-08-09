;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_98) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 10)

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
(define-struct tank [loc vel])

; UFO Missile -> Boolean
; True when Missile is close enough to UFO
(check-expect (check-distance (make-posn 10 10) (make-posn 20 20)) #false)
(check-expect (check-distance (make-posn 1 2) (make-posn 2 1)) #true)
(define (check-distance u m)
  (> 5 (sqrt (+ (sqr (- (posn-x u) (posn-x m)))
                (sqr (- (posn-y u) (posn-y m)))))))

; SIGS -> Boolean
; True when UFO lands or missile hits UFO
(define exaf (make-aim (make-posn 10 10) (make-tank 30 -3)))
(define exat (make-aim (make-posn 10 200) (make-tank 30 -3)))
(define exff (make-fired (make-posn 10 10) (make-tank 30 -3) (make-posn 20 20)))
(define exft (make-fired (make-posn 1 2) (make-tank 30 -3) (make-posn 2 1)))
(check-expect (si-game-over? exaf) #false)
(check-expect (si-game-over? exat) #true)
(check-expect (si-game-over? exff) #false)
(check-expect (si-game-over? exft) #true)

(define (si-game-over? x)
  (cond
    [(aim? x)  (> (posn-y (aim-ufo x)) (- 200 HEIGHT))]
    [(fired? x) (check-distance (fired-ufo x) (fired-missile x))]))

; SIGS -> Image
; Show at end
(define (si-render-final x)
  (rectangle 200 200 "solid" "red"))