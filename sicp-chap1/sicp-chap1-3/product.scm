; Recursive Product using higher-order procedures
(define (product term a next b)
  (if (> a b)
	1
	(* (term a) (product term (next a) next b))))

; Iterative Product using higher-order procedures
(define (iproduct term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (* result (term a)))))
  (iter a 1))

; Increment and identity
(define (inc x) (+ x 1))
(define (id x) x)

; Factorial
(define (factorial n)
  (product id 1 inc n))

; pi Approximation
(define (pi-product n)
  (define (pi-term x)
	(if (even? x) 
	  (/ (+ 2 x) (+ 1 x))
	  (/ (+ 1 x) (+ 2 x))))
  (* 4.0 (product pi-term 1 inc n)))
