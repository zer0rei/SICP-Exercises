; Cube and increment procedures
(define (cube x) (* x x x))
(define (inc x) (+ x 1))

; Sum using higher-order procedures
(define (sum term a next b)
  (if (> a b) 0
	(+ (term a) (sum term (next a) next b))))

; Integral approximation using the simpson's rule
(define (simpson-integral f a b n)
  (define h (/ (- b a) n)) 
  (define (y k) 
    (define fk (f (+ a (* k h)))) 
	(* (cond ((or (= k n) (= k 0)) 1)
			 ((even? k) 2)
			 (else 4)) fk))
  (* (/ h 3) (sum y 0 inc n)))
