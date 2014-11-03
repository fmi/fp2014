(load "../../test-framework.scm")

(define (sum-of-digits n)
  (define (iter n result)
    (cond
      ((= n 0) result)
      (else (iter (quotient n 10) (+ result (remainder n 10))))))
  (iter n 0))

(define (reverse-int n)
  (define (iter n result)
    (cond
    ((= n 0) result)
    (else (iter (quotient n 10) (+ (remainder n 10) (* result 10))))))
  (iter n 0))

(define (to-binary-int n)
  (string->number (number->string n 2)))

(define (int-palindrom? n)
 (= n (reverse-int n)))

(define (is-palindrom-in-binary? n)
  (int-palindrom? (to-binary-int n)))

(define (odd-1s-in-binary? n)
  (odd? (sum-of-digits (to-binary-int n))))

(define (is-hack-number? n)
  (and (is-palindrom-in-binary? n) (odd-1s-in-binary? n)))


(assert-equal? #t (is-hack-number? 1))
(assert-equal? #t (is-hack-number? 7))
(assert-equal? #f (is-hack-number? 8190))
(assert-equal? #t (is-hack-number? 7919))
