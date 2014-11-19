(load "../test-framework.scm")
(load "../../exam/functools.scm")

; Връща главния диагонал
(define (diagonal M)
  (let (
          (n (- (length M) 1)) )
    (map (lambda (index row) (nth index row)) (range 0 n) M)))

(assert-equal? (list 1 5 9) (diagonal (list (list 1 2 3) (list 4 5 6) (list 7 8 9))))

; Връща вторичния диагонал
(define (seconday-diagonal M)
  (diagonal (map reverse M)))

(assert-equal? (list 3 5 7) (seconday-diagonal (list (list 1 2 3) (list 4 5 6) (list 7 8 9))))

; qsort-а се намира във functools.scm
; тук е имплементация с let*

(define (qsort items)
  (cond ((null? items) (list))
        (else (let*
                    ( (pivot (car items))
                      (rest (cdr items))
                      (lesser (filter (lambda (x) (< x pivot)) rest))
                      (greater (filter (lambda (x) (>= x pivot)) rest)) )
          (append
            (qsort lesser)
            (list pivot)
            (qsort greater))))))

(assert-equal? (list 0 1 2 3) (qsort (list 3 1 2 0)))

; Връща списък от thing-ове, повторени count на брой пъти
(define (repeat count thing)
  (map (lambda (_) thing) (range 1 count)))

(assert-equal? (list "scm" "scm" "scm") (repeat 3 "scm"))
