(define (expmod base expn m)
  (define (square a) (* a a))
  (cond ((< m 1) #f)
		((= expn 0) (remainder 1 m))
		((even? expn) (remainder (square (expmod base (/ expn 2) m)) m))
		(else
		  (remainder (* base (expmod base (- expn 1) m)) m))))

(define (fermat-test n)
  (define rand (+ 1 (random (- n 1))))
  (= (expmod rand n n) rand))

(define (prime? p times)
  (cond ((< p 2) #f)
		((= times 0) #t)
		((fermat-test p) (prime? p (- times 1)))
		(else #f)))
