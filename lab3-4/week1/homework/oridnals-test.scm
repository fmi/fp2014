(load "../test-framework.scm")
(load "ordinals.scm")

(announce "Testing oridnals")

(framework-check
    "1st"
    (ordinals 1))

(framework-check
    "2nd"
    (ordinals 2))

(framework-check
    "11th"
    (ordinals 11))

(framework-check
    "12th"
    (ordinals 12))

(framework-check
    "13th"
    (ordinals 13))

(framework-check
    "14th"
    (ordinals 14))

(framework-check
    "15th"
    (ordinals 15))

(framework-check
    "16th"
    (ordinals 16))

(framework-check
    "17th"
    (ordinals 17))

(framework-check
    "18th"
    (ordinals 18))

(framework-check
    "19th"
    (ordinals 19))

(framework-check
    "20th"
    (ordinals 20))

(framework-check
    "2nd"
    (ordinals 2))

(framework-check
    "22nd"
    (ordinals 22))

(framework-check
    "32nd"
    (ordinals 32))
