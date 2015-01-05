subsequence :: (Eq a) => [a] -> [a] -> Bool
subsequence [] _ = True
subsequence _ [] = False
subsequence (x:xs) list = (elem x list) && (subsequence xs (dropWhile (/= x) list))

increasing :: (Int -> Int) -> Int -> Int -> Bool
increasing f a b
    | a + 1 < b = (f a < f(a + 1)) && (increasing f (a + 1) b)
    | otherwise = True

numberLength :: Int -> Int
numberLength x
    | x < 10 = 1
    | otherwise = 1 + numberLength (div x 10)

listToNumber :: [Int] -> Int
listToNumber list = listToNumberHelper $ reverse list

listToNumberHelper :: [Int] -> Int
listToNumberHelper [] = 0
listToNumberHelper (x:xs) = x + 10 * (listToNumberHelper xs)

numberToList :: Int -> [Int]
numberToList x = reverse $ numberToListHelper x

numberToListHelper :: Int -> [Int]
numberToListHelper x
    | x < 10 = [x]
    | otherwise = [rem x 10] ++ numberToListHelper(div x 10)

zeroInsert :: Int -> Int
zeroInsert x = listToNumber $ zeroInsertHelper $ numberToList x

zeroInsertHelper :: [Int] -> [Int]
zeroInsertHelper [] = []
zeroInsertHelper [x] = [x]
zeroInsertHelper (x:y:xs)
    | (x == y) || ((rem (x + y) 10) == 0) = [x,0] ++ zeroInsertHelper(y:xs)
    | otherwise = [x] ++ zeroInsertHelper(y:xs)

isPrime :: Int -> Bool
isPrime x = [x] == [ y | y <- [2..x], rem x y == 0]

primeFactorization :: Int -> [(Int, Int)]
primeFactorization x = [ (y, times x y) | y <- [2..x], isPrime y, rem x y == 0]

times :: Int -> Int -> Int
times x y
    | rem x y == 0 = 1 + times (div x y) y
    | otherwise = 0

find :: (a->Bool) -> [a] -> a
find _ [] = error "No such element"
find pred (x:xs)
    | pred x = x
    | otherwise = find pred xs

replace :: Int -> [(Int, Int)] -> Int
replace x dictionary = listToNumber $ map (\digit -> convert digit dictionary) (numberToList x)

convert :: Int -> [(Int, Int)] -> Int
convert x [] = x
convert x ((y,z):xs)
    | x == y = z
    | otherwise = convert x xs

intersection :: (Eq a) => [a] -> [a] -> [a]
intersection _ [] = []
intersection [] _ = []
intersection (x:xs) list
    | elem x list = x:(intersection xs list)
    | otherwise = intersection xs list

union :: (Eq a) => [a] -> [a] -> [a]
union x [] = x
union [] x = x
union (x:xs) list
    | elem x list = union xs list
    | otherwise = x:(union xs list)

difference :: (Eq a) => [a] -> [a] -> [a]
difference x [] = x
difference [] x = []
difference (x:xs) list
    | elem x list = difference xs list
    | otherwise = x:(difference xs list)

uniq :: (Eq a) => [a] -> [a]
uniq [] = []
uniq (x:xs)
    | elem x xs = uniq xs
    | otherwise = x:(uniq xs)

longestSubsequence :: [Int] -> Int
longestSubsequence [] = 0
longestSubsequence (x:xs) = maximum $ longestSubsequenceHelper xs x [1]

longestSubsequenceHelper :: [Int] -> Int -> [Int] -> [Int]
longestSubsequenceHelper [] _ result = result
longestSubsequenceHelper (x:xs) prev result
    | x > prev = longestSubsequenceHelper xs x (result ++ [last result + 1])
    | otherwise = longestSubsequenceHelper xs x (result ++ [1])
