;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_69) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])
(make-movie "The Shining" "Robert Fryer" 1980)

                               movie
+-------------+--------------+------+
|    title    |   producer   | year |
+-------------+--------------+------+
| The Shining | Robert Fryer | 1980 |
+-------------+--------------+------+



(define-struct person [name hair eyes phone])
(make-person "John" "black" "blue" 123456789)

                             person
+------+--------+------+-----------+
| name |  hair  | eyes |   phone   |
+------+--------+------+-----------+
| John | black  | blue | 123456789 |
+------+--------+------+-----------+

(define-struct pet [name number])
(make-pet "frida" 123)

              pet
+-------+--------+
| name  | number |
+-------+--------+
| frida |    123 |
+-------+--------+

(define-struct CD [artist title price])
(make-CD "The Beatles" "Revolver" 0.0)

                                      CD
+----------------+-------------+-------+
|    artist      |   title     | price |
+----------------+-------------+-------+
| "The Beatles"  | "Revolver"  |   0.0 |
+----------------+-------------+-------+


(define-struct sweater [material size producer])
(make-sweater "wool" "Medium" "SW Company")

                                sweater
+-----------+-----------+--------------+
| material  |   size    |   producer   |
+-----------+-----------+--------------+
| "wool"    | "Medium"  | "SW Company" |
+-----------+-----------+--------------+
