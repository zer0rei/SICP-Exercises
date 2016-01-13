; Expmod
(include "expmod.scm")

; Fermat Carmichael test
(define (fermat-test n)
  (define (fermat-test-iter n a)
	(if (= a n) #t
  	  (if (= (expmod a n n) a) 
		(fermat-test-iter n (+ a 1))
	    #f)))
  (fermat-test-iter n 1))

(define (prime? p)
  (cond ((< p 2) #f)
		(else (fermat-test p))))
