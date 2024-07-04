(Female Pam)
(Male Tom)
(Male Bob)
(Female Liz)
(Female Pat)
(Female Ann)
(Male Jim)
(Parent Tom Bob)
(Parent Pam Bob)
(Parent Tom Liz)
(Parent Bob Ann)
(Parent Bob Pat)
(Parent Pat Jim)
; Uncle is a brother of a parent

( = (get_brother $x)
    (match &self (, (Parent $y $x) (Parent $y $z) (Male $z)) $z)
)

! (get_brother Liz)

( = (get_uncle $x)
    (match &self (Parent $y $x) (get_brother $y))
)

! (get_uncle Bob)