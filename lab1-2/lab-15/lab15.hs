data Tree a = Empty | Node a (Tree a) (Tree a)

testTree :: Tree Int
testTree = Node 5
            (Node 4 Empty Empty)
            (Node 7 Empty Empty)

member :: (Eq a) => a -> Tree a -> Bool
member _ Empty = False
member x (Node value left right)
    | x == value = True
    | otherwise = (member x left) || (member x right)

member' :: (Ord a) => a -> Tree a -> Bool
member' _ Empty = False
member' x (Node value left right)
    | x == value = True
    | x < value = member' x left
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

insert :: (Ord a) => a -> Tree a -> Tree a
insert x Empty = Node x Empty Empty
insert x (Node value left right)
    | x == value = Node value left right
    | x < value = Node value (insert x left) right
    | otherwise = Node value left (insert x right)

instance (Show a) => Show (Tree a) where
    show tree = show $ inOrder tree

sumTree :: Tree Int -> Int
sumTree tree = sum $ inOrder tree

minTree :: Tree Int -> Int
minTree tree = minimum $ inOrder tree

instance (Eq a) => Eq (Tree a) where
    (==) Empty Empty = True
    (==) (Node x left1 right1) (Node y left2 right2) = (x == y) && (left1 == left2) && (right1 == right2)
    (==) _ _ = False

data Expr = I Int | Add Expr Expr | Mult Expr Expr

eval :: Expr -> Int
eval (I x) = x
eval (Add x y) = eval x + eval y
eval (Mult x y) = eval x * eval y

data Order = Online Float Int Int | Offline Float

isOnline :: Order -> Bool
isOnline (Online _ _ _) = True
isOnline _ = False

timeUntilReceiving :: Order -> Int
timeUntilReceiving (Online price id time) = time
timeUntilReceiving (Offline _) = 0

totalPrice :: [Order] -> Float
totalPrice [] = 0
totalPrice ((Online price id time):xs) = price + totalPrice xs
totalPrice ((Offline price):xs) = price + totalPrice xs

onlineOrders :: [Order] -> Int
onlineOrders [] = 0
onlineOrders ((Online _ _ _):xs) = 1 + onlineOrders xs
onlineOrders ((Offline _):xs) = onlineOrders xs

isExpensive :: Order -> Bool
isExpensive (Online price id time) = price > 100

instance Show Order where
    show (Online price id time) = "online with " ++ show(price,id,time)
    show (Offline price) = "offline with " ++ show price

instance Eq Order where
    (==) (Online price1 id1 time1) (Online price2 id2 time2) = price1 == price2 && id1 == id2 && time1 == time2
    (==) (Offline price1) (Offline price2) = price1 == price2
    (==) _ _ = False

data Employee = Employee String Int String Int
type Department = [Employee]

expenses :: Department -> Int
expenses [] = 0
expenses ((Employee name age role salary):xs) = salary + expenses xs

hasManager :: Department -> Bool
hasManager [] = False
hasManager ((Employee name age role salary):xs) = (role == "manager") || hasManager xs
