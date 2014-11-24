fib n = if n == 0 || n == 1
        then 1
        else fib(n-1) + fib(n-2)

fibGuards n
    | n == 0 = 1
    | n == 1 = 1
    | otherwise = fibGuards(n-1) + fibGuards(n-2)

fibPatternMatching 0 = 1
fibPatternMatching 1 = 1
fibPatternMatching n = fibPatternMatching(n-1) + fibPatternMatching(n-2)

abs' x = if x >= 0
        then x
        else -x
abs'' x
    | x <= 0 = -x
    | otherwise = x

sumDigits x
    | x < 10 = x
    | otherwise = x `rem` 10 + sumDigits(div x 10)

isPrime :: Int -> Bool
isPrime x = isPrimeHelper x 2

isPrimeHelper :: Int -> Int -> Bool
isPrimeHelper x current
    | current == x = True
    | x `rem` current == 0 = False
    | otherwise = isPrimeHelper x (current + 1)

product' :: (Num a) => a -> a -> a -> a
product' a b c = a * b * c

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

length'' :: (Eq a) => [a] -> Int
length'' list
    | list == [] = 0
    | otherwise = 1 + length''(tail list)

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

reverse'' :: (Eq a) => [a] -> [a]
reverse'' list
    | list == [] = []
    | otherwise = reverse''(tail list) ++ [head list]

nth :: [a] -> Int -> a
nth (x:xs) 0 = x
nth (x:xs) n = nth xs (n - 1)

minList :: (Ord a) => [a] -> a
minList list = minListHelper list (head list)

minListHelper :: (Ord a) => [a] -> a -> a
minListHelper [] currentMin = currentMin
minListHelper (x:xs) currentMin
    | currentMin > x = minListHelper xs x
    | otherwise = minListHelper xs currentMin

minList' :: (Ord a) => [a] -> a
minList' [x] = x
minList' list = min (head list) (minList'(tail list))

take' :: [a] -> Int -> [a]
take' [] _ = []
take' _ 0 = []
take' (x:xs) n = x:(take' xs (n-1))

takeWhile' :: [a] -> (a -> Bool) -> [a]
takeWhile' [] _ = []
takeWhile' (x:xs) pred
    | pred x = x:(takeWhile' xs pred)
    | otherwise = []

