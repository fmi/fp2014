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

isBalanced :: Tree a -> Bool
isBalanced Empty = True
isBalanced (Node a left right) = abs(treeHeight left - treeHeight right) <= 1

member :: (Eq a) => a -> Tree a -> Bool
member _ Empty = False
member x (Node y left right)
    | x == y = True
    | otherwise = (member x left) || (member x right)

member' :: (Ord a) => a -> Tree a -> Bool
member' _ Empty = False
member' x (Node y left right)
    | x == y = True
    | x < y = member' x left
    | otherwise = member' x right

inOrder :: Tree a -> [a]
inOrder Empty = []
inOrder (Node x left right) = (inOrder left) ++ [x] ++ (inOrder right)

preOrder :: Tree a -> [a]
preOrder Empty = []
preOrder (Node x left right) = [x] ++ (preOrder left) ++ (preOrder right)

postOrder :: Tree a -> [a]
postOrder Empty = []
postOrder (Node x left right) = (postOrder left) ++ (postOrder right) ++ [x]

insert :: (Ord a) => a -> (Tree a) -> Tree a
insert x Empty = Node x Empty Empty
insert x (Node y left right)
    | x == y = Node y left right
    | x < y = Node y (insert x left) right
    | otherwise = Node y left (insert x right)

level :: Int -> Tree a -> [a]
level _ Empty = []
level 0 (Node x left right) = [x]
level k (Node x left right) = (level (k - 1) left) ++ (level (k-1) right)

instance Show a => Show (Tree a) where
    show x = show $ inOrder x

testTree :: Tree Int
testTree = (Node 11
                (Node 7
                    (Node 4 Empty Empty)
                    (Node 9 Empty Empty))
                (Node 21 Empty Empty))
