(define (expmod base expn m)
  (define (square a) (* a a))
  (cond ((< m 1) #f)
		((= expn 0) (remainder 1 m))
		((even? expn) (remainder (square (expmod base (/ expn 2) m)) m))
		(else
		  (remainder (* base (expmod base (- expn 1) m)) m))))

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
