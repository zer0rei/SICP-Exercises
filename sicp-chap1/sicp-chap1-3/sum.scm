; Recursive sum using higher-order procedures
(define (sum term a next b)
  (if (> a b)
	0
	(+ (term a) (sum term (next a) next b))))

; Iterative sum using higher-order procedures
(define (isum term a next b)
  (define (iter a result)
	(if (> a b)
	  result
	  (iter (next a) (+ result (term a)))))
  (iter a 0))
