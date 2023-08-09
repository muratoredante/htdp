;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_99) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 10)
(define MISSILE-SPEED 50)
(define UFO-Y-SPEED 20)

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])
(define-struct tank [loc vel])

; SIGS -> SIGS
; moves the space-invader objects 
(define (si-move w)
  (si-move-proper w (random 200)))
 
; SIGS Number -> SIGS 
; moves the space-invader objects predictably by delta
(define exa (make-aim (make-posn 10 10) (make-tank 30 -3)))
(define exf (make-fired (make-posn 10 10) (make-tank 30 -3) (make-posn 20 20)))
(check-expect (si-move-proper exa 5)
              (make-aim (move-ufo  (make-posn 10 10) 5)
                        (move-tank (make-tank 30 -3)))) 
(check-expect (si-move-proper exf 7)
              (make-fired (move-ufo  (make-posn 10 10) 7)
                          (move-tank (make-tank 30 -3))
                          (move-missile (make-posn 20 20 )))) 
(define (si-move-proper w delta)
  (cond
    [(aim? w) 　　(make-aim    (move-ufo  (aim-ufo w) delta)
                              (move-tank (aim-tank w)))]
    [(fired? w)　 (make-fired (move-ufo  (fired-ufo w) delta)
                              (move-tank (fired-tank w))
                              (move-missile (fired-missile w)))]))

; UFO Number -> UFO
; Move UFO
(check-expect (move-ufo (make-posn 10 10) 7) (make-posn 7 (+ 10 UFO-Y-SPEED)))
(define (move-ufo u delta)
  (make-posn delta (+ (posn-y u) UFO-Y-SPEED)))

; Tank -> Tank
; Move Tank
(check-expect (move-tank (make-tank 5 -3)) (make-tank (+ 5 -3) -3))
(define (move-tank t)
  (make-tank (+ (tank-loc t) (tank-vel t)) (tank-vel t)))

; Missile -> Missile
; Move Missile
(check-expect (move-missile (make-posn 10 10)) (make-posn 10 (+ 10 MISSILE-SPEED)))
(define (move-missile m)
  (make-posn (posn-x m) (+ (posn-y m) MISSILE-SPEED)))