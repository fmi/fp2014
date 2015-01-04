import Data.Char
import Data.List

ones :: [Int]
ones = [1, 1..]

naturals :: [Int]
naturals = [1..]

evens :: [Int]
evens = filter even naturals

fib :: Int -> Int -> [Int]
fib a b = a:(fib b (a+b))

isPrime :: Int -> Bool
isPrime 1 = False
isPrime x = sum [ 1 | y <- [2..x-1], x `rem` y == 0] == 0

primes :: [Int]
primes = primesHelper 2

primesHelper :: Int -> [Int]
primesHelper current
    | isPrime current = current : (primesHelper $ current + 1)
    | otherwise = primesHelper $ current + 1

combineStreams :: (a->a->a) -> [a] -> [a] -> [a]
combineStreams op (x:xs) (y:ys) = (op x y): (combineStreams op xs ys)

generateStream :: (Ord a) => (a -> a) -> a -> a -> [a]
generateStream  next from to = generateStreamHelper next from from to

generateStreamHelper :: (Ord a) => (a->a) -> a -> a -> a -> [a]
generateStreamHelper next start from to
    | from <= to = from : (generateStreamHelper next start (next from) to)
    | otherwise = generateStreamHelper next start start to

integers :: Int -> Int -> [Int]
integers from to = generateStream (+1) from to

nextLetter :: Char -> Char
nextLetter 'z' = 'a'
nextLetter a = chr $ ord a + 1

letters :: [Char]
letters = generateStream nextLetter 'a' 'z'

listToStream :: [a] -> [a]
listToStream list = listToStreamHelper list list

listToStreamHelper :: [a] -> [a] -> [a]
listToStreamHelper original [] = listToStreamHelper original original
listToStreamHelper original (x:xs) = x:(listToStreamHelper original xs)

duplicatePrimes :: [Int]
duplicatePrimes = foldr duplicate [] naturals
    where
        duplicate x acc
            | isPrime x = [x, x] ++ acc
            | otherwise = x:acc
