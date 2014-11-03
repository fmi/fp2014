(load "../../test-framework.scm")

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

; идентитен
(define (id x) x)

(define (min-of f g)
  (lambda (x) (min (f x) (g x))))

(assert-equal? 1 ((min-of inc dec) 2))
(assert-equal? 3 ((min-of inc inc) 2))
(assert-equal? 90 ( (min-of square (lambda (x) (* x (- x 1)))) 10))
