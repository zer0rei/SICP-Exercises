; Modifies expmod for the miller rabin primality test
(define (expmod base expn m)
  (define (square a) (* a a))
  (define (sqrmod-with-check x)
	(define (check-nontrivial-sqrt x sqrmod)
	  (if (and (= sqrmod 1)
			   (not (= x 1))
			   (not (= x (- m 1))))
		0
		sqrmod))
	(check-nontrivial-sqrt x (remainder (square x) m)))
  (cond ((< m 1) 0)
		((= expn 0) 1)
		((even? expn) (sqrmod-with-check (expmod base (/ expn 2) m)))
		(else
		  (remainder (* base (expmod base (- expn 1) m)) m))))

; Miller rabin test
(define (miller-rabin? n)
  (define rand (+ 1 (random (- n 1))))
  (= (expmod rand (- n 1) n) 1))

; Primality test for a given number of times
(define (miller-rabin-prime? p times)
  (cond ((< p 2) #f)
		((= times 0) #t)
		((miller-rabin? p) (miller-rabin-prime? p (- times 1)))
		(else #f)))

; Primality test for 10 times
(define (prime? p)
  (miller-rabin-prime? p 10))
