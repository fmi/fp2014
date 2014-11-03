(load "../../test-framework.scm")

(define (reverse-int n)
  (define (iter n result)
    (cond
      ((= n 0) result)
      (else (iter (quotient n 10) (+ (remainder n 10) (* result 10))))))
    (iter n 0))

(define (int-palindrom? n)
  (= n (reverse-int n)))

(define (one-step-lychrel n)
  (int-palindrom? (+ n (reverse-int n))))

(define (non-lychrel-sum a b)
    (define (iter a b result)
        (cond
            ((> a b) result)
            ( (one-step-lychrel a) (iter (+ a 1) b (+ a result)))
            (else (iter (+ a 1) b result) ) ) )
    (iter a b 0))

(assert-equal? 373 (non-lychrel-sum 10 30))
(assert-equal? 678 (non-lychrel-sum 40 60))
(assert-equal? 367 (non-lychrel-sum 70 80))
(assert-equal? 4844 (non-lychrel-sum 110 200))
