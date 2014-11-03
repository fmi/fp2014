(load "../../test-framework.scm")

(define (ordinals n)
    (cond
        ((and (<= (remainder n 100) 19) (>= (remainder n 100) 10)) (string-append (number->string n) "th"))
        ((= 1 (remainder n 10)) (string-append (number->string n) "st"))
        ((= 2 (remainder n 10)) (string-append (number->string n) "nd"))
        ((= 3 (remainder n 10)) (string-append (number->string n) "rd"))
        (else (string-append (number->string n) "th"))))

(assert-equal?
    "1st"
    (ordinals 1))

(assert-equal?
    "2nd"
    (ordinals 2))

(assert-equal?
    "11th"
    (ordinals 11))

(assert-equal?
    "12th"
    (ordinals 12))

(assert-equal?
    "13th"
    (ordinals 13))

(assert-equal?
    "14th"
    (ordinals 14))

(assert-equal?
    "15th"
    (ordinals 15))

(assert-equal?
    "16th"
    (ordinals 16))

(assert-equal?
    "17th"
    (ordinals 17))

(assert-equal?
    "18th"
    (ordinals 18))

(assert-equal?
    "19th"
    (ordinals 19))

(assert-equal?
    "20th"
    (ordinals 20))

(assert-equal?
    "2nd"
    (ordinals 2))

(assert-equal?
    "22nd"
    (ordinals 22))

(assert-equal?
    "32nd"
    (ordinals 32))

(assert-equal?
    "111th"
    (ordinals 111))


(assert-equal?
    "121st"
    (ordinals 121))
