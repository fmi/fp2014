(load "../../test-framework.scm")

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

; идентитен
(define (id x) x)

(define (compose f g)
  (lambda (x) (f (g x))))

(assert-equal? 1 ((compose inc dec) 1))
(assert-equal? 16 ( (compose square square) 2))
(assert-equal? 5 ( (compose (lambda (x) (+ x 1)) (lambda (x) (+ x 2))) 2))
