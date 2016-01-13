; Recursive gcd procedure
(define (gcd2 a b)
  (if (= b 0) a
	(gcd2 b (remainder b a))))
