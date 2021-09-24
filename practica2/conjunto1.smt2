(set-option :produce-models true)
(set-logic QF_LIA)
(declare-fun refinVeg_0_0 () Int)
(declare-fun compVeg_0_0 () Int)
(declare-fun almacVeg_0_0 () Int)
(declare-fun refinVeg_0_1 () Int)
(declare-fun compVeg_0_1 () Int)
(declare-fun almacVeg_0_1 () Int)
(declare-fun refinNoVeg_0_0 () Int)
(declare-fun compNoVeg_0_0 () Int)
(declare-fun almacNoVeg_0_0 () Int)
(declare-fun refinNoVeg_0_1 () Int)
(declare-fun compNoVeg_0_1 () Int)
(declare-fun almacNoVeg_0_1 () Int)
(declare-fun refinNoVeg_0_2 () Int)
(declare-fun compNoVeg_0_2 () Int)
(declare-fun almacNoVeg_0_2 () Int)
(declare-fun benef_0 () Int)
(declare-fun refinVeg_1_0 () Int)
(declare-fun compVeg_1_0 () Int)
(declare-fun almacVeg_1_0 () Int)
(declare-fun refinVeg_1_1 () Int)
(declare-fun compVeg_1_1 () Int)
(declare-fun almacVeg_1_1 () Int)
(declare-fun refinNoVeg_1_0 () Int)
(declare-fun compNoVeg_1_0 () Int)
(declare-fun almacNoVeg_1_0 () Int)
(declare-fun refinNoVeg_1_1 () Int)
(declare-fun compNoVeg_1_1 () Int)
(declare-fun almacNoVeg_1_1 () Int)
(declare-fun refinNoVeg_1_2 () Int)
(declare-fun compNoVeg_1_2 () Int)
(declare-fun almacNoVeg_1_2 () Int)
(declare-fun benef_1 () Int)
(declare-fun refinVeg_2_0 () Int)
(declare-fun compVeg_2_0 () Int)
(declare-fun almacVeg_2_0 () Int)
(declare-fun refinVeg_2_1 () Int)
(declare-fun compVeg_2_1 () Int)
(declare-fun almacVeg_2_1 () Int)
(declare-fun refinNoVeg_2_0 () Int)
(declare-fun compNoVeg_2_0 () Int)
(declare-fun almacNoVeg_2_0 () Int)
(declare-fun refinNoVeg_2_1 () Int)
(declare-fun compNoVeg_2_1 () Int)
(declare-fun almacNoVeg_2_1 () Int)
(declare-fun refinNoVeg_2_2 () Int)
(declare-fun compNoVeg_2_2 () Int)
(declare-fun almacNoVeg_2_2 () Int)
(declare-fun benef_2 () Int)
(declare-fun refinVeg_3_0 () Int)
(declare-fun compVeg_3_0 () Int)
(declare-fun almacVeg_3_0 () Int)
(declare-fun refinVeg_3_1 () Int)
(declare-fun compVeg_3_1 () Int)
(declare-fun almacVeg_3_1 () Int)
(declare-fun refinNoVeg_3_0 () Int)
(declare-fun compNoVeg_3_0 () Int)
(declare-fun almacNoVeg_3_0 () Int)
(declare-fun refinNoVeg_3_1 () Int)
(declare-fun compNoVeg_3_1 () Int)
(declare-fun almacNoVeg_3_1 () Int)
(declare-fun refinNoVeg_3_2 () Int)
(declare-fun compNoVeg_3_2 () Int)
(declare-fun almacNoVeg_3_2 () Int)
(declare-fun benef_3 () Int)
(declare-fun refinVeg_4_0 () Int)
(declare-fun compVeg_4_0 () Int)
(declare-fun almacVeg_4_0 () Int)
(declare-fun refinVeg_4_1 () Int)
(declare-fun compVeg_4_1 () Int)
(declare-fun almacVeg_4_1 () Int)
(declare-fun refinNoVeg_4_0 () Int)
(declare-fun compNoVeg_4_0 () Int)
(declare-fun almacNoVeg_4_0 () Int)
(declare-fun refinNoVeg_4_1 () Int)
(declare-fun compNoVeg_4_1 () Int)
(declare-fun almacNoVeg_4_1 () Int)
(declare-fun refinNoVeg_4_2 () Int)
(declare-fun compNoVeg_4_2 () Int)
(declare-fun almacNoVeg_4_2 () Int)
(declare-fun benef_4 () Int)
(declare-fun refinVeg_5_0 () Int)
(declare-fun compVeg_5_0 () Int)
(declare-fun almacVeg_5_0 () Int)
(declare-fun refinVeg_5_1 () Int)
(declare-fun compVeg_5_1 () Int)
(declare-fun almacVeg_5_1 () Int)
(declare-fun refinNoVeg_5_0 () Int)
(declare-fun compNoVeg_5_0 () Int)
(declare-fun almacNoVeg_5_0 () Int)
(declare-fun refinNoVeg_5_1 () Int)
(declare-fun compNoVeg_5_1 () Int)
(declare-fun almacNoVeg_5_1 () Int)
(declare-fun refinNoVeg_5_2 () Int)
(declare-fun compNoVeg_5_2 () Int)
(declare-fun almacNoVeg_5_2 () Int)
(declare-fun benef_5 () Int)
(assert (> 150 0 ) )
(assert (> 200 0 ) )
(assert (> 250 0 ) )
(assert (> 1000 0 ) )
(assert (< 3 6 ) )
(assert (<= 500 1000 ) )
(assert (<= 500 1000 ) )
(assert (<= 500 1000 ) )
(assert (<= 500 1000 ) )
(assert (<= 500 1000 ) )
(assert (>= almacVeg_0_0 0 ) )
(assert (>= compVeg_0_0 0 ) )
(assert (>= refinVeg_0_0 0 ) )
(assert (<= compVeg_0_0 1200 ) )
(assert (>= almacVeg_0_1 0 ) )
(assert (>= compVeg_0_1 0 ) )
(assert (>= refinVeg_0_1 0 ) )
(assert (<= compVeg_0_1 1200 ) )
(assert (>= almacNoVeg_0_0 0 ) )
(assert (>= compNoVeg_0_0 0 ) )
(assert (>= refinNoVeg_0_0 0 ) )
(assert (<= compNoVeg_0_0 1250 ) )
(assert (>= almacNoVeg_0_1 0 ) )
(assert (>= compNoVeg_0_1 0 ) )
(assert (>= refinNoVeg_0_1 0 ) )
(assert (<= compNoVeg_0_1 1250 ) )
(assert (>= almacNoVeg_0_2 0 ) )
(assert (>= compNoVeg_0_2 0 ) )
(assert (>= refinNoVeg_0_2 0 ) )
(assert (<= compNoVeg_0_2 1250 ) )
(assert (>= almacVeg_1_0 0 ) )
(assert (>= compVeg_1_0 0 ) )
(assert (>= refinVeg_1_0 0 ) )
(assert (<= compVeg_1_0 1200 ) )
(assert (>= almacVeg_1_1 0 ) )
(assert (>= compVeg_1_1 0 ) )
(assert (>= refinVeg_1_1 0 ) )
(assert (<= compVeg_1_1 1200 ) )
(assert (>= almacNoVeg_1_0 0 ) )
(assert (>= compNoVeg_1_0 0 ) )
(assert (>= refinNoVeg_1_0 0 ) )
(assert (<= compNoVeg_1_0 1250 ) )
(assert (>= almacNoVeg_1_1 0 ) )
(assert (>= compNoVeg_1_1 0 ) )
(assert (>= refinNoVeg_1_1 0 ) )
(assert (<= compNoVeg_1_1 1250 ) )
(assert (>= almacNoVeg_1_2 0 ) )
(assert (>= compNoVeg_1_2 0 ) )
(assert (>= refinNoVeg_1_2 0 ) )
(assert (<= compNoVeg_1_2 1250 ) )
(assert (>= almacVeg_2_0 0 ) )
(assert (>= compVeg_2_0 0 ) )
(assert (>= refinVeg_2_0 0 ) )
(assert (<= compVeg_2_0 1200 ) )
(assert (>= almacVeg_2_1 0 ) )
(assert (>= compVeg_2_1 0 ) )
(assert (>= refinVeg_2_1 0 ) )
(assert (<= compVeg_2_1 1200 ) )
(assert (>= almacNoVeg_2_0 0 ) )
(assert (>= compNoVeg_2_0 0 ) )
(assert (>= refinNoVeg_2_0 0 ) )
(assert (<= compNoVeg_2_0 1250 ) )
(assert (>= almacNoVeg_2_1 0 ) )
(assert (>= compNoVeg_2_1 0 ) )
(assert (>= refinNoVeg_2_1 0 ) )
(assert (<= compNoVeg_2_1 1250 ) )
(assert (>= almacNoVeg_2_2 0 ) )
(assert (>= compNoVeg_2_2 0 ) )
(assert (>= refinNoVeg_2_2 0 ) )
(assert (<= compNoVeg_2_2 1250 ) )
(assert (>= almacVeg_3_0 0 ) )
(assert (>= compVeg_3_0 0 ) )
(assert (>= refinVeg_3_0 0 ) )
(assert (<= compVeg_3_0 1200 ) )
(assert (>= almacVeg_3_1 0 ) )
(assert (>= compVeg_3_1 0 ) )
(assert (>= refinVeg_3_1 0 ) )
(assert (<= compVeg_3_1 1200 ) )
(assert (>= almacNoVeg_3_0 0 ) )
(assert (>= compNoVeg_3_0 0 ) )
(assert (>= refinNoVeg_3_0 0 ) )
(assert (<= compNoVeg_3_0 1250 ) )
(assert (>= almacNoVeg_3_1 0 ) )
(assert (>= compNoVeg_3_1 0 ) )
(assert (>= refinNoVeg_3_1 0 ) )
(assert (<= compNoVeg_3_1 1250 ) )
(assert (>= almacNoVeg_3_2 0 ) )
(assert (>= compNoVeg_3_2 0 ) )
(assert (>= refinNoVeg_3_2 0 ) )
(assert (<= compNoVeg_3_2 1250 ) )
(assert (>= almacVeg_4_0 0 ) )
(assert (>= compVeg_4_0 0 ) )
(assert (>= refinVeg_4_0 0 ) )
(assert (<= compVeg_4_0 1200 ) )
(assert (>= almacVeg_4_1 0 ) )
(assert (>= compVeg_4_1 0 ) )
(assert (>= refinVeg_4_1 0 ) )
(assert (<= compVeg_4_1 1200 ) )
(assert (>= almacNoVeg_4_0 0 ) )
(assert (>= compNoVeg_4_0 0 ) )
(assert (>= refinNoVeg_4_0 0 ) )
(assert (<= compNoVeg_4_0 1250 ) )
(assert (>= almacNoVeg_4_1 0 ) )
(assert (>= compNoVeg_4_1 0 ) )
(assert (>= refinNoVeg_4_1 0 ) )
(assert (<= compNoVeg_4_1 1250 ) )
(assert (>= almacNoVeg_4_2 0 ) )
(assert (>= compNoVeg_4_2 0 ) )
(assert (>= refinNoVeg_4_2 0 ) )
(assert (<= compNoVeg_4_2 1250 ) )
(assert (>= almacVeg_5_0 0 ) )
(assert (>= compVeg_5_0 0 ) )
(assert (>= refinVeg_5_0 0 ) )
(assert (<= compVeg_5_0 1200 ) )
(assert (>= almacVeg_5_1 0 ) )
(assert (>= compVeg_5_1 0 ) )
(assert (>= refinVeg_5_1 0 ) )
(assert (<= compVeg_5_1 1200 ) )
(assert (>= almacNoVeg_5_0 0 ) )
(assert (>= compNoVeg_5_0 0 ) )
(assert (>= refinNoVeg_5_0 0 ) )
(assert (<= compNoVeg_5_0 1250 ) )
(assert (>= almacNoVeg_5_1 0 ) )
(assert (>= compNoVeg_5_1 0 ) )
(assert (>= refinNoVeg_5_1 0 ) )
(assert (<= compNoVeg_5_1 1250 ) )
(assert (>= almacNoVeg_5_2 0 ) )
(assert (>= compNoVeg_5_2 0 ) )
(assert (>= refinNoVeg_5_2 0 ) )
(assert (<= compNoVeg_5_2 1250 ) )
(assert (< (+ refinVeg_0_1 refinVeg_0_0 ) 200 ) )
(assert (< (+ refinVeg_1_1 refinVeg_1_0 ) 200 ) )
(assert (< (+ refinVeg_2_1 refinVeg_2_0 ) 200 ) )
(assert (< (+ refinVeg_3_1 refinVeg_3_0 ) 200 ) )
(assert (< (+ refinVeg_4_1 refinVeg_4_0 ) 200 ) )
(assert (< (+ refinVeg_5_1 refinVeg_5_0 ) 200 ) )
(assert (< (+ refinNoVeg_0_2 (+ refinNoVeg_0_1 refinNoVeg_0_0 ) ) 250 ) )
(assert (< (+ refinNoVeg_1_2 (+ refinNoVeg_1_1 refinNoVeg_1_0 ) ) 250 ) )
(assert (< (+ refinNoVeg_2_2 (+ refinNoVeg_2_1 refinNoVeg_2_0 ) ) 250 ) )
(assert (< (+ refinNoVeg_3_2 (+ refinNoVeg_3_1 refinNoVeg_3_0 ) ) 250 ) )
(assert (< (+ refinNoVeg_4_2 (+ refinNoVeg_4_1 refinNoVeg_4_0 ) ) 250 ) )
(assert (< (+ refinNoVeg_5_2 (+ refinNoVeg_5_1 refinNoVeg_5_0 ) ) 250 ) )
(assert (>= (+ almacVeg_0_0 compVeg_0_0 ) refinVeg_0_0 ) )
(assert (>= (+ almacVeg_0_1 compVeg_0_1 ) refinVeg_0_1 ) )
(assert (>= (+ almacNoVeg_0_0 compNoVeg_0_0 ) refinNoVeg_0_0 ) )
(assert (>= (+ almacNoVeg_0_1 compNoVeg_0_1 ) refinNoVeg_0_1 ) )
(assert (>= (+ almacNoVeg_0_2 compNoVeg_0_2 ) refinNoVeg_0_2 ) )
(assert (>= (+ almacVeg_1_0 compVeg_1_0 ) refinVeg_1_0 ) )
(assert (>= (+ almacVeg_1_1 compVeg_1_1 ) refinVeg_1_1 ) )
(assert (>= (+ almacNoVeg_1_0 compNoVeg_1_0 ) refinNoVeg_1_0 ) )
(assert (>= (+ almacNoVeg_1_1 compNoVeg_1_1 ) refinNoVeg_1_1 ) )
(assert (>= (+ almacNoVeg_1_2 compNoVeg_1_2 ) refinNoVeg_1_2 ) )
(assert (>= (+ almacVeg_2_0 compVeg_2_0 ) refinVeg_2_0 ) )
(assert (>= (+ almacVeg_2_1 compVeg_2_1 ) refinVeg_2_1 ) )
(assert (>= (+ almacNoVeg_2_0 compNoVeg_2_0 ) refinNoVeg_2_0 ) )
(assert (>= (+ almacNoVeg_2_1 compNoVeg_2_1 ) refinNoVeg_2_1 ) )
(assert (>= (+ almacNoVeg_2_2 compNoVeg_2_2 ) refinNoVeg_2_2 ) )
(assert (>= (+ almacVeg_3_0 compVeg_3_0 ) refinVeg_3_0 ) )
(assert (>= (+ almacVeg_3_1 compVeg_3_1 ) refinVeg_3_1 ) )
(assert (>= (+ almacNoVeg_3_0 compNoVeg_3_0 ) refinNoVeg_3_0 ) )
(assert (>= (+ almacNoVeg_3_1 compNoVeg_3_1 ) refinNoVeg_3_1 ) )
(assert (>= (+ almacNoVeg_3_2 compNoVeg_3_2 ) refinNoVeg_3_2 ) )
(assert (>= (+ almacVeg_4_0 compVeg_4_0 ) refinVeg_4_0 ) )
(assert (>= (+ almacVeg_4_1 compVeg_4_1 ) refinVeg_4_1 ) )
(assert (>= (+ almacNoVeg_4_0 compNoVeg_4_0 ) refinNoVeg_4_0 ) )
(assert (>= (+ almacNoVeg_4_1 compNoVeg_4_1 ) refinNoVeg_4_1 ) )
(assert (>= (+ almacNoVeg_4_2 compNoVeg_4_2 ) refinNoVeg_4_2 ) )
(assert (>= (+ almacVeg_5_0 compVeg_5_0 ) refinVeg_5_0 ) )
(assert (>= (+ almacVeg_5_1 compVeg_5_1 ) refinVeg_5_1 ) )
(assert (>= (+ almacNoVeg_5_0 compNoVeg_5_0 ) refinNoVeg_5_0 ) )
(assert (>= (+ almacNoVeg_5_1 compNoVeg_5_1 ) refinNoVeg_5_1 ) )
(assert (>= (+ almacNoVeg_5_2 compNoVeg_5_2 ) refinNoVeg_5_2 ) )
(assert (and (> (+ (* refinNoVeg_0_2 5 ) (+ (* refinNoVeg_0_2 5 ) (+ (* refinNoVeg_0_1 4 ) (+ (* refinNoVeg_0_1 4 ) (+ (* refinNoVeg_0_0 2 ) (+ (* refinNoVeg_0_0 2 ) (+ (* refinVeg_0_1 6 ) (* refinVeg_0_0 9 ) ) ) ) ) ) ) ) (* 3 (+ refinNoVeg_0_2 (+ refinNoVeg_0_1 (+ refinNoVeg_0_0 (+ refinVeg_0_1 refinVeg_0_0 ) ) ) ) ) ) (< (+ (* refinVeg_0_1 6 ) (* refinVeg_0_0 9 ) ) (* 6 (+ refinNoVeg_0_2 (+ refinNoVeg_0_1 (+ refinNoVeg_0_0 (+ refinVeg_0_1 refinVeg_0_0 ) ) ) ) ) ) ) )
(assert (and (> (+ (* refinNoVeg_1_2 5 ) (+ (* refinNoVeg_1_2 5 ) (+ (* refinNoVeg_1_1 4 ) (+ (* refinNoVeg_1_1 4 ) (+ (* refinNoVeg_1_0 2 ) (+ (* refinNoVeg_1_0 2 ) (+ (* refinVeg_1_1 6 ) (* refinVeg_1_0 9 ) ) ) ) ) ) ) ) (* 3 (+ refinNoVeg_1_2 (+ refinNoVeg_1_1 (+ refinNoVeg_1_0 (+ refinVeg_1_1 refinVeg_1_0 ) ) ) ) ) ) (< (+ (* refinVeg_1_1 6 ) (* refinVeg_1_0 9 ) ) (* 6 (+ refinNoVeg_1_2 (+ refinNoVeg_1_1 (+ refinNoVeg_1_0 (+ refinVeg_1_1 refinVeg_1_0 ) ) ) ) ) ) ) )
(assert (and (> (+ (* refinNoVeg_2_2 5 ) (+ (* refinNoVeg_2_2 5 ) (+ (* refinNoVeg_2_1 4 ) (+ (* refinNoVeg_2_1 4 ) (+ (* refinNoVeg_2_0 2 ) (+ (* refinNoVeg_2_0 2 ) (+ (* refinVeg_2_1 6 ) (* refinVeg_2_0 9 ) ) ) ) ) ) ) ) (* 3 (+ refinNoVeg_2_2 (+ refinNoVeg_2_1 (+ refinNoVeg_2_0 (+ refinVeg_2_1 refinVeg_2_0 ) ) ) ) ) ) (< (+ (* refinVeg_2_1 6 ) (* refinVeg_2_0 9 ) ) (* 6 (+ refinNoVeg_2_2 (+ refinNoVeg_2_1 (+ refinNoVeg_2_0 (+ refinVeg_2_1 refinVeg_2_0 ) ) ) ) ) ) ) )
(assert (and (> (+ (* refinNoVeg_3_2 5 ) (+ (* refinNoVeg_3_2 5 ) (+ (* refinNoVeg_3_1 4 ) (+ (* refinNoVeg_3_1 4 ) (+ (* refinNoVeg_3_0 2 ) (+ (* refinNoVeg_3_0 2 ) (+ (* refinVeg_3_1 6 ) (* refinVeg_3_0 9 ) ) ) ) ) ) ) ) (* 3 (+ refinNoVeg_3_2 (+ refinNoVeg_3_1 (+ refinNoVeg_3_0 (+ refinVeg_3_1 refinVeg_3_0 ) ) ) ) ) ) (< (+ (* refinVeg_3_1 6 ) (* refinVeg_3_0 9 ) ) (* 6 (+ refinNoVeg_3_2 (+ refinNoVeg_3_1 (+ refinNoVeg_3_0 (+ refinVeg_3_1 refinVeg_3_0 ) ) ) ) ) ) ) )
(assert (and (> (+ (* refinNoVeg_4_2 5 ) (+ (* refinNoVeg_4_2 5 ) (+ (* refinNoVeg_4_1 4 ) (+ (* refinNoVeg_4_1 4 ) (+ (* refinNoVeg_4_0 2 ) (+ (* refinNoVeg_4_0 2 ) (+ (* refinVeg_4_1 6 ) (* refinVeg_4_0 9 ) ) ) ) ) ) ) ) (* 3 (+ refinNoVeg_4_2 (+ refinNoVeg_4_1 (+ refinNoVeg_4_0 (+ refinVeg_4_1 refinVeg_4_0 ) ) ) ) ) ) (< (+ (* refinVeg_4_1 6 ) (* refinVeg_4_0 9 ) ) (* 6 (+ refinNoVeg_4_2 (+ refinNoVeg_4_1 (+ refinNoVeg_4_0 (+ refinVeg_4_1 refinVeg_4_0 ) ) ) ) ) ) ) )
(assert (and (> (+ (* refinNoVeg_5_2 5 ) (+ (* refinNoVeg_5_2 5 ) (+ (* refinNoVeg_5_1 4 ) (+ (* refinNoVeg_5_1 4 ) (+ (* refinNoVeg_5_0 2 ) (+ (* refinNoVeg_5_0 2 ) (+ (* refinVeg_5_1 6 ) (* refinVeg_5_0 9 ) ) ) ) ) ) ) ) (* 3 (+ refinNoVeg_5_2 (+ refinNoVeg_5_1 (+ refinNoVeg_5_0 (+ refinVeg_5_1 refinVeg_5_0 ) ) ) ) ) ) (< (+ (* refinVeg_5_1 6 ) (* refinVeg_5_0 9 ) ) (* 6 (+ refinNoVeg_5_2 (+ refinNoVeg_5_1 (+ refinNoVeg_5_0 (+ refinVeg_5_1 refinVeg_5_0 ) ) ) ) ) ) ) )
(assert (= almacVeg_0_0 500 ) )
(assert (= almacVeg_0_1 500 ) )
(assert (= almacNoVeg_0_0 500 ) )
(assert (= almacNoVeg_0_1 500 ) )
(assert (= almacNoVeg_0_2 500 ) )
(assert (= almacVeg_1_0 (- (+ almacVeg_0_0 compVeg_0_0 ) refinVeg_0_0 ) ) )
(assert (= almacVeg_1_1 (- (+ almacVeg_0_1 compVeg_0_1 ) refinVeg_0_1 ) ) )
(assert (= almacVeg_2_0 (- (+ almacVeg_1_0 compVeg_1_0 ) refinVeg_1_0 ) ) )
(assert (= almacVeg_2_1 (- (+ almacVeg_1_1 compVeg_1_1 ) refinVeg_1_1 ) ) )
(assert (= almacVeg_3_0 (- (+ almacVeg_2_0 compVeg_2_0 ) refinVeg_2_0 ) ) )
(assert (= almacVeg_3_1 (- (+ almacVeg_2_1 compVeg_2_1 ) refinVeg_2_1 ) ) )
(assert (= almacVeg_4_0 (- (+ almacVeg_3_0 compVeg_3_0 ) refinVeg_3_0 ) ) )
(assert (= almacVeg_4_1 (- (+ almacVeg_3_1 compVeg_3_1 ) refinVeg_3_1 ) ) )
(assert (= almacVeg_5_0 (- (+ almacVeg_4_0 compVeg_4_0 ) refinVeg_4_0 ) ) )
(assert (= almacVeg_5_1 (- (+ almacVeg_4_1 compVeg_4_1 ) refinVeg_4_1 ) ) )
(assert (= almacNoVeg_1_0 (- (+ almacNoVeg_0_0 compNoVeg_0_0 ) refinNoVeg_0_0 ) ) )
(assert (= almacNoVeg_1_1 (- (+ almacNoVeg_0_1 compNoVeg_0_1 ) refinNoVeg_0_1 ) ) )
(assert (= almacNoVeg_1_2 (- (+ almacNoVeg_0_2 compNoVeg_0_2 ) refinNoVeg_0_2 ) ) )
(assert (= almacNoVeg_2_0 (- (+ almacNoVeg_1_0 compNoVeg_1_0 ) refinNoVeg_1_0 ) ) )
(assert (= almacNoVeg_2_1 (- (+ almacNoVeg_1_1 compNoVeg_1_1 ) refinNoVeg_1_1 ) ) )
(assert (= almacNoVeg_2_2 (- (+ almacNoVeg_1_2 compNoVeg_1_2 ) refinNoVeg_1_2 ) ) )
(assert (= almacNoVeg_3_0 (- (+ almacNoVeg_2_0 compNoVeg_2_0 ) refinNoVeg_2_0 ) ) )
(assert (= almacNoVeg_3_1 (- (+ almacNoVeg_2_1 compNoVeg_2_1 ) refinNoVeg_2_1 ) ) )
(assert (= almacNoVeg_3_2 (- (+ almacNoVeg_2_2 compNoVeg_2_2 ) refinNoVeg_2_2 ) ) )
(assert (= almacNoVeg_4_0 (- (+ almacNoVeg_3_0 compNoVeg_3_0 ) refinNoVeg_3_0 ) ) )
(assert (= almacNoVeg_4_1 (- (+ almacNoVeg_3_1 compNoVeg_3_1 ) refinNoVeg_3_1 ) ) )
(assert (= almacNoVeg_4_2 (- (+ almacNoVeg_3_2 compNoVeg_3_2 ) refinNoVeg_3_2 ) ) )
(assert (= almacNoVeg_5_0 (- (+ almacNoVeg_4_0 compNoVeg_4_0 ) refinNoVeg_4_0 ) ) )
(assert (= almacNoVeg_5_1 (- (+ almacNoVeg_4_1 compNoVeg_4_1 ) refinNoVeg_4_1 ) ) )
(assert (= almacNoVeg_5_2 (- (+ almacNoVeg_4_2 compNoVeg_4_2 ) refinNoVeg_4_2 ) ) )
(assert (= (- (+ compVeg_5_0 almacVeg_5_0 ) refinVeg_5_0 ) 500 ) )
(assert (= (- (+ compVeg_5_1 almacVeg_5_1 ) refinVeg_5_1 ) 500 ) )
(assert (= (- (+ compNoVeg_5_0 almacNoVeg_5_0 ) refinNoVeg_5_0 ) 500 ) )
(assert (= (- (+ compNoVeg_5_1 almacNoVeg_5_1 ) refinNoVeg_5_1 ) 500 ) )
(assert (= (- (+ compNoVeg_5_2 almacNoVeg_5_2 ) refinNoVeg_5_2 ) 500 ) )
(assert (<= almacVeg_0_0 1000 ) )
(assert (<= almacVeg_0_1 1000 ) )
(assert (<= almacNoVeg_0_0 1000 ) )
(assert (<= almacNoVeg_0_1 1000 ) )
(assert (<= almacNoVeg_0_2 1000 ) )
(assert (<= almacVeg_1_0 1000 ) )
(assert (<= almacVeg_1_1 1000 ) )
(assert (<= almacNoVeg_1_0 1000 ) )
(assert (<= almacNoVeg_1_1 1000 ) )
(assert (<= almacNoVeg_1_2 1000 ) )
(assert (<= almacVeg_2_0 1000 ) )
(assert (<= almacVeg_2_1 1000 ) )
(assert (<= almacNoVeg_2_0 1000 ) )
(assert (<= almacNoVeg_2_1 1000 ) )
(assert (<= almacNoVeg_2_2 1000 ) )
(assert (<= almacVeg_3_0 1000 ) )
(assert (<= almacVeg_3_1 1000 ) )
(assert (<= almacNoVeg_3_0 1000 ) )
(assert (<= almacNoVeg_3_1 1000 ) )
(assert (<= almacNoVeg_3_2 1000 ) )
(assert (<= almacVeg_4_0 1000 ) )
(assert (<= almacVeg_4_1 1000 ) )
(assert (<= almacNoVeg_4_0 1000 ) )
(assert (<= almacNoVeg_4_1 1000 ) )
(assert (<= almacNoVeg_4_2 1000 ) )
(assert (<= almacVeg_5_0 1000 ) )
(assert (<= almacVeg_5_1 1000 ) )
(assert (<= almacNoVeg_5_0 1000 ) )
(assert (<= almacNoVeg_5_1 1000 ) )
(assert (<= almacNoVeg_5_2 1000 ) )
(assert (= benef_0 (- (* (+ refinNoVeg_0_2 (+ refinNoVeg_0_1 (+ refinNoVeg_0_0 (+ refinVeg_0_1 refinVeg_0_0 ) ) ) ) 150 ) (+ (* (+ almacNoVeg_0_2 (+ almacNoVeg_0_1 (+ almacNoVeg_0_0 (+ almacVeg_0_1 almacVeg_0_0 ) ) ) ) 5 ) (+ compNoVeg_0_2 (+ compNoVeg_0_1 (+ compNoVeg_0_0 (+ compVeg_0_1 compVeg_0_0 ) ) ) ) ) ) ) )
(assert (= benef_1 (- (* (+ refinNoVeg_1_2 (+ refinNoVeg_1_1 (+ refinNoVeg_1_0 (+ refinVeg_1_1 refinVeg_1_0 ) ) ) ) 150 ) (+ (* (+ almacNoVeg_1_2 (+ almacNoVeg_1_1 (+ almacNoVeg_1_0 (+ almacVeg_1_1 almacVeg_1_0 ) ) ) ) 5 ) (+ compNoVeg_1_2 (+ compNoVeg_1_1 (+ compNoVeg_1_0 (+ compVeg_1_1 compVeg_1_0 ) ) ) ) ) ) ) )
(assert (= benef_2 (- (* (+ refinNoVeg_2_2 (+ refinNoVeg_2_1 (+ refinNoVeg_2_0 (+ refinVeg_2_1 refinVeg_2_0 ) ) ) ) 150 ) (+ (* (+ almacNoVeg_2_2 (+ almacNoVeg_2_1 (+ almacNoVeg_2_0 (+ almacVeg_2_1 almacVeg_2_0 ) ) ) ) 5 ) (+ compNoVeg_2_2 (+ compNoVeg_2_1 (+ compNoVeg_2_0 (+ compVeg_2_1 compVeg_2_0 ) ) ) ) ) ) ) )
(assert (= benef_3 (- (* (+ refinNoVeg_3_2 (+ refinNoVeg_3_1 (+ refinNoVeg_3_0 (+ refinVeg_3_1 refinVeg_3_0 ) ) ) ) 150 ) (+ (* (+ almacNoVeg_3_2 (+ almacNoVeg_3_1 (+ almacNoVeg_3_0 (+ almacVeg_3_1 almacVeg_3_0 ) ) ) ) 5 ) (+ compNoVeg_3_2 (+ compNoVeg_3_1 (+ compNoVeg_3_0 (+ compVeg_3_1 compVeg_3_0 ) ) ) ) ) ) ) )
(assert (= benef_4 (- (* (+ refinNoVeg_4_2 (+ refinNoVeg_4_1 (+ refinNoVeg_4_0 (+ refinVeg_4_1 refinVeg_4_0 ) ) ) ) 150 ) (+ (* (+ almacNoVeg_4_2 (+ almacNoVeg_4_1 (+ almacNoVeg_4_0 (+ almacVeg_4_1 almacVeg_4_0 ) ) ) ) 5 ) (+ compNoVeg_4_2 (+ compNoVeg_4_1 (+ compNoVeg_4_0 (+ compVeg_4_1 compVeg_4_0 ) ) ) ) ) ) ) )
(assert (= benef_5 (- (* (+ refinNoVeg_5_2 (+ refinNoVeg_5_1 (+ refinNoVeg_5_0 (+ refinVeg_5_1 refinVeg_5_0 ) ) ) ) 150 ) (+ (* (+ almacNoVeg_5_2 (+ almacNoVeg_5_1 (+ almacNoVeg_5_0 (+ almacVeg_5_1 almacVeg_5_0 ) ) ) ) 5 ) (+ compNoVeg_5_2 (+ compNoVeg_5_1 (+ compNoVeg_5_0 (+ compVeg_5_1 compVeg_5_0 ) ) ) ) ) ) ) )
(assert (>= (+ benef_5 (+ benef_4 (+ benef_3 (+ benef_2 (+ benef_1 benef_0 ) ) ) ) ) 100000 ) )
(assert-soft (< (+ (ite (not (= refinNoVeg_0_2 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_0_1 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_0_0 0 ) ) 1 0 ) (+ (ite (not (= refinVeg_0_1 0 ) ) 1 0 ) (ite (not (= refinVeg_0_0 0 ) ) 1 0 ) ) ) ) ) 3 ) :weight 0.2)
(assert-soft (< (+ (ite (not (= refinNoVeg_1_2 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_1_1 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_1_0 0 ) ) 1 0 ) (+ (ite (not (= refinVeg_1_1 0 ) ) 1 0 ) (ite (not (= refinVeg_1_0 0 ) ) 1 0 ) ) ) ) ) 3 ) :weight 0.2)
(assert-soft (< (+ (ite (not (= refinNoVeg_2_2 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_2_1 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_2_0 0 ) ) 1 0 ) (+ (ite (not (= refinVeg_2_1 0 ) ) 1 0 ) (ite (not (= refinVeg_2_0 0 ) ) 1 0 ) ) ) ) ) 3 ) :weight 0.2)
(assert-soft (< (+ (ite (not (= refinNoVeg_3_2 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_3_1 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_3_0 0 ) ) 1 0 ) (+ (ite (not (= refinVeg_3_1 0 ) ) 1 0 ) (ite (not (= refinVeg_3_0 0 ) ) 1 0 ) ) ) ) ) 3 ) :weight 0.2)
(assert-soft (< (+ (ite (not (= refinNoVeg_4_2 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_4_1 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_4_0 0 ) ) 1 0 ) (+ (ite (not (= refinVeg_4_1 0 ) ) 1 0 ) (ite (not (= refinVeg_4_0 0 ) ) 1 0 ) ) ) ) ) 3 ) :weight 0.2)
(assert-soft (< (+ (ite (not (= refinNoVeg_5_2 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_5_1 0 ) ) 1 0 ) (+ (ite (not (= refinNoVeg_5_0 0 ) ) 1 0 ) (+ (ite (not (= refinVeg_5_1 0 ) ) 1 0 ) (ite (not (= refinVeg_5_0 0 ) ) 1 0 ) ) ) ) ) 3 ) :weight 0.2)
(assert (=> (not (= refinVeg_0_0 0 ) ) (> refinVeg_0_0 200 ) ) )
(assert (=> (not (= refinVeg_0_1 0 ) ) (> refinVeg_0_1 200 ) ) )
(assert (=> (not (= refinNoVeg_0_0 0 ) ) (> refinNoVeg_0_0 200 ) ) )
(assert (=> (not (= refinNoVeg_0_1 0 ) ) (> refinNoVeg_0_1 200 ) ) )
(assert (=> (not (= refinNoVeg_0_2 0 ) ) (> refinNoVeg_0_2 200 ) ) )
(assert (=> (not (= refinVeg_1_0 0 ) ) (> refinVeg_1_0 200 ) ) )
(assert (=> (not (= refinVeg_1_1 0 ) ) (> refinVeg_1_1 200 ) ) )
(assert (=> (not (= refinNoVeg_1_0 0 ) ) (> refinNoVeg_1_0 200 ) ) )
(assert (=> (not (= refinNoVeg_1_1 0 ) ) (> refinNoVeg_1_1 200 ) ) )
(assert (=> (not (= refinNoVeg_1_2 0 ) ) (> refinNoVeg_1_2 200 ) ) )
(assert (=> (not (= refinVeg_2_0 0 ) ) (> refinVeg_2_0 200 ) ) )
(assert (=> (not (= refinVeg_2_1 0 ) ) (> refinVeg_2_1 200 ) ) )
(assert (=> (not (= refinNoVeg_2_0 0 ) ) (> refinNoVeg_2_0 200 ) ) )
(assert (=> (not (= refinNoVeg_2_1 0 ) ) (> refinNoVeg_2_1 200 ) ) )
(assert (=> (not (= refinNoVeg_2_2 0 ) ) (> refinNoVeg_2_2 200 ) ) )
(assert (=> (not (= refinVeg_3_0 0 ) ) (> refinVeg_3_0 200 ) ) )
(assert (=> (not (= refinVeg_3_1 0 ) ) (> refinVeg_3_1 200 ) ) )
(assert (=> (not (= refinNoVeg_3_0 0 ) ) (> refinNoVeg_3_0 200 ) ) )
(assert (=> (not (= refinNoVeg_3_1 0 ) ) (> refinNoVeg_3_1 200 ) ) )
(assert (=> (not (= refinNoVeg_3_2 0 ) ) (> refinNoVeg_3_2 200 ) ) )
(assert (=> (not (= refinVeg_4_0 0 ) ) (> refinVeg_4_0 200 ) ) )
(assert (=> (not (= refinVeg_4_1 0 ) ) (> refinVeg_4_1 200 ) ) )
(assert (=> (not (= refinNoVeg_4_0 0 ) ) (> refinNoVeg_4_0 200 ) ) )
(assert (=> (not (= refinNoVeg_4_1 0 ) ) (> refinNoVeg_4_1 200 ) ) )
(assert (=> (not (= refinNoVeg_4_2 0 ) ) (> refinNoVeg_4_2 200 ) ) )
(assert (=> (not (= refinVeg_5_0 0 ) ) (> refinVeg_5_0 200 ) ) )
(assert (=> (not (= refinVeg_5_1 0 ) ) (> refinVeg_5_1 200 ) ) )
(assert (=> (not (= refinNoVeg_5_0 0 ) ) (> refinNoVeg_5_0 200 ) ) )
(assert (=> (not (= refinNoVeg_5_1 0 ) ) (> refinNoVeg_5_1 200 ) ) )
(assert (=> (not (= refinNoVeg_5_2 0 ) ) (> refinNoVeg_5_2 200 ) ) )
(assert (=> (or (> refinVeg_0_0 0 ) (> refinVeg_0_1 0 ) ) (> refinNoVeg_0_2 0 ) ) )
(assert (=> (or (> refinVeg_1_0 0 ) (> refinVeg_1_1 0 ) ) (> refinNoVeg_1_2 0 ) ) )
(assert (=> (or (> refinVeg_2_0 0 ) (> refinVeg_2_1 0 ) ) (> refinNoVeg_2_2 0 ) ) )
(assert (=> (or (> refinVeg_3_0 0 ) (> refinVeg_3_1 0 ) ) (> refinNoVeg_3_2 0 ) ) )
(assert (=> (or (> refinVeg_4_0 0 ) (> refinVeg_4_1 0 ) ) (> refinNoVeg_4_2 0 ) ) )
(assert (=> (or (> refinVeg_5_0 0 ) (> refinVeg_5_1 0 ) ) (> refinNoVeg_5_2 0 ) ) )
(maximize (+ benef_5 (+ benef_4 (+ benef_3 (+ benef_2 (+ benef_1 benef_0 ) ) ) ) ) )
(check-sat)
(get-objectives)