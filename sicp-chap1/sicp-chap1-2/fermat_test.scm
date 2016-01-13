; Expmod
(include "expmod.scm")

; Fermat test
(define (fermat-test n)
  (define rand (+ 1 (random (- n 1))))
  (= (expmod rand n n) rand))

; Fermat test for a given number of times
(define (fermat-prime? p times)
  (cond ((< p 2) #f)
		((= times 0) #t)
		((fermat-test p) (fermat-prime? p (- times 1)))
		(else #f)))

; Fermat test for 10 times
(define (prime? p)
  (fermat-prime? p 10))
