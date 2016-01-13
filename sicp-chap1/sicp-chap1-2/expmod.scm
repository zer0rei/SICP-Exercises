; Procedure for calculating the exponent base^expn modulo m
; fast example
(define (expmod base expn m)
  (define (square a) (* a a))
  (cond ((< m 1) #f)
		((= expn 0) (remainder 1 m))
		((even? expn) (remainder (square (expmod base (/ expn 2) m)) m))
		(else
		  (remainder (* base (expmod base (- expn 1) m)) m))))

; slow example
(define (expmod2 base expn m)
  (define (iexpt b n)
	(define (square a) (* a a))
	(define (expt-iter b n a) 
	  (cond ((= n 0) a)
			((even? n) (expt-iter (square b) (/ n 2) a))
			(else (expt-iter b (- n 1) (* b a)))))
	(expt-iter b n 1))
  (remainder (iexpt base expn) m))
