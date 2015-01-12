data Vector2d = Vector2d Float Float

vectorLength :: Vector2d -> Float
vectorLength (Vector2d x y) = sqrt(x*x + y*y)

addVectors :: Vector2d -> Vector2d -> Vector2d
addVectors (Vector2d x1 y1) (Vector2d x2 y2) = Vector2d (x1+y1) (x2+y2)

dotProduct :: Vector2d -> Vector2d -> Float
dotProduct (Vector2d x1 y1) (Vector2d x2 y2) = x1*x2 + y1*y2

instance Show Vector2d where
    show (Vector2d x y) = "Vector2d: " ++ (show [x,y])

instance Eq Vector2d where
    (==) (Vector2d x1 y1) (Vector2d x2 y2) = (x1 == x2) && (y1 == y2)

data Shape = Circle Float | Rect Float Float

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect a b) = a * b

isRect :: Shape -> Bool
isRect (Rect _ _) = True
isRect _ = False

instance Show Shape where
    show (Circle r) = "Circle with radius " ++ (show r)
    show (Rect a b) = "Rectangle with side " ++ (show a) ++ " and other side " ++ (show b)

instance Eq Shape where
    (==) (Circle r1) (Circle r2) = r1 == r2
    (==) (Rect a1 b1) (Rect a2 b2) = a1 == a2 && b1 == b2
    (==) _ _ = False

data Tree a = Empty | Node a (Tree a) (Tree a)

treeHeight :: Tree a -> Int
treeHeight Empty = 0
treeHeight (Node a left right) = 1 + max (treeHeight left) (treeHeight right)

testTree :: Tree Int
testTree = (Node 11
                (Node 7
                    (Node 4 Empty Empty)
                    (Node 9 Empty Empty))
                (Node 21 Empty Empty))
