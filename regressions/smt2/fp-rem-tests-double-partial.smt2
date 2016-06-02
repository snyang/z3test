;; Copyright (c) 2015 Microsoft Corporation

(set-logic QF_FP)
(set-info :source "Handcrafted by CM Wintersteiger")
(set-info :status unsat)

(define-sort FPN () (_ FloatingPoint 11 53))
(declare-const x FPN)
(declare-const y FPN)
(declare-const r FPN)

(push)
(assert (= x (fp #b0 #b10000111111 #x0000000000000)))
(assert (= y (fp #b0 #b01111111111 #x0000000000000)))
(assert (= r (fp.rem x y)))
(assert (not (= r (fp #b0 #b00000000000 #x0000000000000))))
(check-sat-using qffp)
(check-sat-using (then fpa2bv smt))
(pop)

(push)
(assert (= x (fp #b1 #b10001111111 #x0000000000000)))
(assert (= y (fp #b0 #b01111111111 #x0000000000000)))
(assert (= r (fp.rem x y)))
(assert (not (= r (fp #b1 #b00000000000 #x0000000000000))))
(check-sat-using qffp)
(check-sat-using (then fpa2bv smt))
(pop)

(push)
(assert (= x (fp #b0 #b10000111111 #x0000000000002)))
(assert (= y (fp #b0 #b01111111111 #x0000000000001)))
(assert (= r (fp.rem x y)))
(assert (not (= r (fp #b1 #b01111010111 #x0000000000000))))
(check-sat-using qffp)
(check-sat-using (then fpa2bv smt))
(pop)

(push)
(assert (= x (fp #b0 #b10001111111 #x0000000000002)))
(assert (= y (fp #b0 #b01101111111 #x0000000000001)))
(assert (= r (fp.rem x y)))
(assert (not (= r (fp #b0 #b01101111011 #x0000000000000))))
(check-sat-using qffp)
(check-sat-using (then fpa2bv smt))
(pop)

(exit)