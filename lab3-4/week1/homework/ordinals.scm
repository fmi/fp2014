(define (ordinals n)
    (cond
        ( (and (<= n 19) (>= n 10)) (string-append (number->string n) "th") )
        ( (= 1 (remainder n 10)) (string-append (number->string n) "st"))
        ( (= 2 (remainder n 10)) (string-append (number->string n) "nd"))
        ( (= 3 (remainder n 10)) (string-append (number->string n) "rd"))
        (else (string-append (number->string n) "th"))))
