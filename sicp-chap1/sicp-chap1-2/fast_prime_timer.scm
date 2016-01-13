; Fermat primality test
(include "fermat_test.scm")

; Timer for calculating a prime
(define (prime-timer n)
  (define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))
  (define (start-prime-test n start-time)
	(cond ((prime? n)
	  (report-prime (- (current-inexact-milliseconds) start-time)))))
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

; Timer for searching first 3 primes bigger than n
(define (search-primes n)
  (define (search-primes-count n count)
	(if (even? n)
	  (search-primes-count (+ n 1) count)
	  (cond ((> count 0) 
		(if (prime? n)
		  (begin
		    (prime-timer n)
		    (search-primes-count (+ n 2) (- count 1)))
		  (search-primes-count (+ n 2) count))))))
  (search-primes-count n 3)
  (newline))
