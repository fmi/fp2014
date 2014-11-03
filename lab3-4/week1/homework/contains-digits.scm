(load "../../test-framework.scm")

(define (contains-digit? n x)
    (cond
        ((= n x) #t) ; this is a case for (contains-digit? 0 0)
        ((zero? n) #f)
        (else (or (= x (remainder n 10)) (contains-digit? (quotient n 10) x)))))

(define (contains-digits? x y)
  (cond ((zero? y) #t)
        (else (and (contains-digit? x (remainder y 10)) (contains-digits? x (quotient y 10))))))

(assert-equal? #f (contains-digits? 111111 222))
(assert-equal? #t (contains-digits? 1111112 222))
(assert-equal? #t (contains-digits? 12345 123))
(assert-equal? #t (contains-digits? 1230 11111111111111111111111130))
