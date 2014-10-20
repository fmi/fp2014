(define (sum a b)
  (if (> a b)
      0
      (+ a (sum (+ a 1) b))))

(define (sum-iter a b)
  (sum-iter-helper a b 0))

(define (sum-iter-helper a b result)
  (if (> a b)
      result
      (sum-iter-helper (+ a 1) b (+ result a))))

(define (square a)
  (* a a))

(define (sum-squares a b)
  (if (> a b)
      0
      (+ (square a) (sum-squares (+ a 1) b))))

(define (sum-squares-iter a b)
  (sum-squares-iter-helper a b 0))

(define (sum-squares-iter-helper a b result)
  (if (> a b)
      result
      (sum-squares-iter-helper (+ a 1) b (+ result (square a)))))

(define (sum-generic f a b)
  (if (> a b)
      0
      (+ (f a) (sum-generic f (+ a 1) b))))

(define (sum-progression a b)
  (if (> a b)
      0
      (+ (square a) (sum-progression (+ a 2) b))))

(define (sum-generic-next f a next b)
  (if (> a b)
      0
      (+ (f a) (sum-generic-next f (next a) next b))))

(define (accumulate op initial-value f a next b)
  (if (> a b)
      initial-value
      (op (f a) (accumulate op initial-value f (next a) next b))))

(define (power x n)
  (accumulate * 1 (lambda (t) x) 1 (lambda (x) (+ x 1)) n))

(define (repeated f x n)
  (if (= n 0)
      x
      (f (repeated f x (- n 1)))))

(define EPS 0.0000000000001)

(define (derivative f)
  (lambda (x)
    (/ (- (f (+ x EPS)) (f x)) EPS)))
