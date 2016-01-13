; Recursive accumulate as higher-order procedure
(define (accumulate combiner null term a next b)
  (if (> a b) 
	null
	(combiner (term a) (accumulate combiner null term (next a) next b))))

; Iterative accumulate as higher-order procedure
(define (iaccumulate combiner null term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (combiner result (term a)))))
  (iter a null))

; Sum as accumulate
(define (sum term a next b)
  (accumulate + 0 term a next b))

; Product as accumulate
(define (product term a next b)
  (accumulate * 1 term a next b))
