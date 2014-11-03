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


; идентитен
(define (id x) x)

; връща винаги true
(define (truth x) #t)

(define (inc x) (+ x 1))

(define (aggregate oper term pred? next a b start-value)
  ; Вътрешна функция, която ни помага по-лесно да сметнем резултата
  (define (get-result a prev-result)
    (cond
        ((pred? a) (oper (term a) prev-result))
        (else prev-result)))

  ; вътрешната функция, която прави опашковата рекурсия
  (define (iter a result)
    (cond
      ((> a b) result)
      (else (iter (next a) (get-result a result)))))
(iter a start-value))

(define (sum-of-hack a b)
  (aggregate + id is-hack-number? inc a b 0))

(assert-equal? 8 (sum-of-hack 1 10))
(assert-equal? 226 (sum-of-hack 1 100))
