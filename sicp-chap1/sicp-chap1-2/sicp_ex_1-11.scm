(define (f n)
  (define (f-iter a b c n)
	;; a=f(n-1) b=f(n-2) c=f(n-3)
	;; return: f(n)=f(n-1) + 2f(n-2) + 3f(n-3) (for n >= 3)
	(if (< n 3) a
	  (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))
  )
  (if (< n 3) n
    (f-iter 2 1 0 n))
)
