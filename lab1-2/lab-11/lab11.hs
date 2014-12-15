range :: Int -> Int -> [Int]
range a b = [a..b]

squares :: Int -> Int -> [Int]
squares a b = [x ^ 2 | x <- [a..b]]

sumSquares :: Int -> Int -> Int
sumSquares a b = sum $ squares a b

sumSquares' :: Int -> Int -> Int
sumSquares' a b = foldl (+) 0 $ squares a b

evenCubes :: Int -> Int -> [Int]
evenCubes a b = [x ^ 3 | x <- [a..b], even x]

productEvenCubes :: Int -> Int -> Int
productEvenCubes a b = foldl (*) 1 $ evenCubes a b

productEvenCubes' :: Int -> Int -> Int
productEvenCubes' a b = product $ evenCubes a b

factors :: Int -> [Int]
factors x = [ y | y <- [1..x], x `rem` y == 0 ]

isPrime :: Int -> Bool
isPrime x = factors x == [1,x]

primes :: Int -> Int -> [Int]
primes a b = [ x | x <- [a..b], isPrime x]

concat' :: [[a]] -> [a]
concat' xss = [ x | xs <- xss, x <- xs]

tuples :: Int -> Int -> [(Int, Int)]
tuples a b = [(x, y) | x <- [a..b], y <- [x..b]]

pythagoreanTriples :: Int -> [(Int, Int, Int)]
pythagoreanTriples a = [(x, y, z) | x <- [1..a], y <- [1..a], z <- [1..a], x + y > z, x + z > y, y + z > x, x^2 + y^2 == z ^2 ]

isPerfect :: Int -> Bool
isPerfect x = (sum $ factors x) == 2 * x

perfects :: Int -> [Int]
perfects n = [ x | x <- [1..n], isPerfect x ]

scalarProduct :: [Int] -> [Int] -> Int
scalarProduct xs ys = sum [x * y | (x,y) <- zip xs ys]

replicate' :: Int -> a -> [a]
replicate' n elem = [elem | x <- [1..n]]

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort [y | y <- xs, y <= x] ++ [x] ++ qsort [z | z <- xs, z > x]
