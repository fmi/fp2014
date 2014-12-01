import Data.Char

last' :: [a] -> a
last' [x] = x
last' (x:xs) = last' xs

last'' :: [a] -> Maybe a
last'' [x] = Just x
last'' (x:xs) = last'' xs

member :: (Eq a) => a -> [a] -> Bool
member _ [] = False
member x (y:ys)
    | x == y = True
    | otherwise = member x ys

range :: Int -> Int -> [Int]
range a b
    | a > b = []
    | otherwise = a:(range (a+1) b)

range' :: Int -> [Int]
range' a = a:(range' (a+1))

compress :: (Eq a) => [a] -> [a]
compress [x] = [x]
compress (x:y:xs)
    | x == y = compress(y:xs)
    | otherwise = x:(compress (y:xs))

all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' pred (x:xs)
    | pred x = all' pred xs
    | otherwise = False

any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = False
any' pred (x:xs)
    | pred x = True
    | otherwise = any' pred xs

map' :: (a->b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = (f x):(map' f xs)

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' pred (x:xs)
    | pred x = x:(filter' pred xs)
    | otherwise = filter' pred xs

foldl' :: (a->b->a) -> a -> [b] -> a
foldl' _ acc [] = acc
foldl' func acc (x:xs) = foldl' func (func acc x) xs

foldr' :: (a->b->b) -> b -> [a] -> b
foldr' _ acc [] = acc
foldr' func acc list = foldr' func (func (last' list) acc) (init list)

reverse' :: [Char] -> [Char]
reverse' str = reverse str

palindrome :: [Char] -> Bool
palindrome x = x == (reverse' x)

palindrome' :: [Char] -> Bool
palindrome' x = input == (reverse input)
                where input = filter (\x -> x `elem` ['a'..'z']) x

uppercase :: [Char] -> [Char]
uppercase str = map toUpper str

lowercase :: [Char] -> [Char]
lowercase str = map toLower str

reverseSentence :: [Char] -> [Char]
reverseSentence sentence = unwords(reverse(words sentence))
