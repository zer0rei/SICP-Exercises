; Filtered accumulate with higher-order procedures
(define (filtered-accumulate combiner null term a next b filtr)
  (if (> a b)
	null
	(if (filtr a) 
		(combiner (term a) (filtered-accumulate combiner null term (next a) next b filtr))
		(combiner null (filtered-accumulate combiner null term (next a) next b filtr)))))

; Square, identity and increment procedures
(define (square x) (* x x))
(define (id x) x)
(define (inc x) (+ x 1))

; Sum of squares of the prime numbers in interval a to b
(include "../sicp-chap1-2/miller-rabin.scm")
(define (sum-squares-of-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

; Product of positive integers less than n that are prime to n
(define (product-of-numbers-prime-to n)
  (define (prime-to-n? a) (= (gcd a n) 1))
  (filtered-accumulate * 1 id 1 inc n prime-to-n?))
