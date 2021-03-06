Упражнение 13
=========

###Разгледани теми
- foldl vs foldr revised
- recap - lists, tuples, pattern matching, guards, types, typeclasses, higher-order functions, function sections, matrix operations

###Задачи
- да се дефинира функция `subsequence :: (Eq a) => [a] -> [a] -> Bool`, която приема като аргументи два списъка и връща дали първият списък е подпоследователност на втория (т.е. дали вторият съдържа всички елементи на първия в същия ред + евентуално други елементи между тях)
```haskell
subsequence [] [] -> True
subsequence [] [1, 2, 3] -> True
subsequence [1, 2, 3] [] -> False
subsequence [5, 1, 7] [3, 4, 5, 6, 0, 1, 7, 8, 9] -> True
subsequence [5, 1, 7] [3,4,5,7,0,1,8,9] -> False
```
- казваме, че една функция `f` е строго монотонно растяща в целочисления интервал [a, b], ако за всеки две целочислени стойности `x` и `y` в `[a,b]`, за които `x < y` е в сила, че `f(x) < f(y)`. Да се дефинира функция `increasing :: (Int -> Int) -> Int -> Int -> Bool`, която получава като аргументи функция `f` и числата `a` и `b` и връща истина, ако функцията `f` е строго монотонно растяща в интервала `[a,b]` и лъжа иначе. Може да се счита, че `a <= b`.
```haskell
increasing (\x -> x + 1) 1 100 -> True
increasing (\x -> 1 - x) 1 100 -> False
increasing (\x -> 1 - x) 100 100 -> True
increasing (\x -> 42) 1 100 -> False
```
- да се дефинира функция `numberToList :: Int -> [Int]`, която получава като аргумент цяло число и връща като резултат списък от цифрите на това число
- да се дефинира функция `listToNumber :: [Int] -> Int`, която получава като аргумент списък от цифри и връща числото получено от тези цифри
- да се дефинира функция `zeroInsert :: Int -> Int`, която получава като аргумент цяло число и връща ново число получено по следния начин:
    = ако две съседни цифри във входното число са еднакви, то да се запишат на съответните позиции в изходното с `0` между тях
    = ако сумата на две съседни цифри дава остатък `0` при деление на `10`, то да се запишат в изходното число с `0` между тях
    = във всички останали случаи цифрите от входното число да се записват в изходното непроменени
```haskell
zeroInsert 116457 -> 10160457
zeroInsert 777777 -> 70707070707
zeroInsert 6446 -> 6040406
zeroInsert 1234 -> 1234
```
- да се дефинира функция `primeFactorization :: Int -> [(Int, Int)]`, която получава като аргумент цяло число и връща списък от наредени двойки, първият елемент на които е просто число, а вторият степента, на която то участва в разбиването на аргумента на прости делители.
```haskell
primeFactorization 25 = [(5,2)]
primeFactorization 1000 = [(2, 3), (5, 3)]
primeFactorization 1001 = [(7, 1), (11, 1), (13, 1)]
```
- да се напише функция `find :: (a->Bool) -> [a] -> a`, която получава като аргументи предикат и списък от елементи и връща първият елемент, за който предиката е в сила или хвърля грешка (с помощта на `error`), ако такъв елемент не съществува.
```haskell
find (==5) [1,2,3,4,5,6,7] -> 5
find (>5) [1,2,3,4,5,6,7,8] -> 6
```
- да се напише функция `replace :: Int -> [(Int, Int)] -> Int`, която приема като първи аргумент цяло число, а като втори списък от наредени двойки от цифри и връща числото, подадено като първи аргумент след като всяко срещане на цифра, която е на първо място в наредена двойка е било заменено от цифрата, която е на втора позиция в наредената двойка.
```haskell
replace 1278235341 [(1, 3), (7, 4), (5, 2)] -> 3248232343
```
- да се напише функция `intersection :: (Eq a) => [a] -> [a] -> [a]`, която получава като аргументи два списъка и връща списък, който представлява тяхното сечение.
- да се напише функция `union :: (Eq a) => [a] -> [a] -> [a]`, която получава като аргументи два списъка и връща списък, който представлява тяхното обединение. В резултата да не се допускат повторения на елементи.
- да се напише функция `difference :: (Eq a) => [a] -> [a] -> [a]`, която получава като аргументи два списъка и връща списък, който представлява тяхната разлика.
- да се напише функция `uniq :: (Eq a) => [a] -> [a]`, която приема списък и връща като резултат входния списък след като от него са премахнати всички повторения.
- да се напише функция `longestSubsequence :: [Int] -> Int`, която получава като аргумент списък от числа и връща като резултат дължината на най-дългия непрекъснат подсписък, в който всички елементи са в нарастващ ред
