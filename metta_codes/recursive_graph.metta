(Parent Tom Bob)
(Parent Pam Bob)
(Parent Tom Liz)
(Parent Bob Ann)
(Parent Bob Pat)
(Parent Pat Jim)
(Parent Jim Lil)

(= (parent $x $y) (match &self (Parent $x $y) $x))
; defined what a parent means
(= (predecessor $x $z) (parent $x $z))
; if x is parent of z, then z is predecessor of z
(= (predecessor $x $z) (predecessor $x (parent $y $z)))
; recursive predecessor rule: if $x is predecessor of $y and $y is parent of $z, 
; then $x is predecessor of $z

! (predecessor $x Lil)