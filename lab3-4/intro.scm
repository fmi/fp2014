; identity
; square
; fact with
; fact with cond
; in-between?
; sum-of-digits
; contains-digit?

(define (identity x)
    x)

(define (square x)
    (* x x))

; Using if construction
(define (fact n)
    (if (= n 0)
        1
        (* n (fact (- n 1)))))

(define (fact2 n)
    (cond
        ( (= n 0) 1)
        (else (* n (fact (- n 1))))))

(define (in-between? x a b)
    (and (>= x a) (<= x b)))

(define (sum-of-digits n)
    (cond
        ((< n 10) n)
        (else (+ (remainder n 10) (sum-of-digits (quotient n 10))))))

(define (contains-digit? n x)
    (cond
        ((= n x) #t) ; this is a case for (contains-digit? 0 0)
        ((zero? n) #f)
        (else (or (= x (remainder n 10)) (contains-digit? (quotient n 10) x)))))
