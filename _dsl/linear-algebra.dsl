tconstructor Scalar : type
tconstructor VectorSpace : type
tconstructor Vector : type
tconstructor LinearMap : type

operator Neg (v : Vector) : Vector
operator Scale (c : Scalar, v : Vector) : Vector
operator AddV (v1 : Vector, v2 : Vector) : Vector
operator AddS(s1 : Scalar, s2 : Scalar) : Scalar
operator Norm (v1 : Vector) : Scalar
operator InnerProd (v1 : Vector, v2 : Vector) : Scalar
operator Determinant (v1 : Vector, v2 : Vector) : Scalar
operator Apply (f : LinearMap, v : Vector) : Vector

predicate In (v : Vector, V : VectorSpace) : Prop
predicate From (f : LinearMap, V : VectorSpace, W : VectorSpace) : Prop
predicate Not (p1 : Prop) : Prop

-- Prelude Example

-- Examples for prelude, just for reproducing
value T : VectorSpace
value T1 : VectorSpace
