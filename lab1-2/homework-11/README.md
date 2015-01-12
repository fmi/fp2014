Домашна работа 11
=========

Решенията на задачите се предават по e-mail на адрес:

>fp2014.fmi@gmail.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.hs*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като *attachment-и* в *mail-a*. Освен решения на задачите самият *mail* трябва да съдържа име, група и факултен номер. Успех!

###Задача 1 - Path
Да се напише функция, която по зададени елемент и двоично дърво за търсене намира пътя от корена на дървото до съответния елемент. Ако такъв елемент не се съдържа в дървото да се хвърли изключение (с помощта на функцията [error](http://hackage.haskell.org/package/base-4.7.0.2/docs/Prelude.html#v:error)). Пътят да се върне като списък със стойностите на всички елементи по него.

**Сигнатура:**

```haskell
pathTo :: (Ord a) => a -> Tree a -> [a]
```

**Примери:**

```haskell
testTree :: Tree Int
testTree = Node 11
                (Node 7
                    (Node 4 Empty Empty)
                    (Node 9 Empty Empty))
                (Node 21 Empty Empty)
pathTo 9 testTree -> [11,7,9]
pathTo 21 testTree -> [11,21]
pathTo 14 testTree -> exception, no path
```

###Задача 2 - LCA
Да се напише функция `lca :: a -> a -> Tree a -> a`, която намира [Lowest Common Ancestor](http://en.wikipedia.org/wiki/Lowest_common_ancestor) на 2 върха в двоично дърво за търсене (т.е. първият връх в дървото, за който е изпълнено, че единият връх е неговото ляво поддърво, а другият е в неговото дясно поддърво.

**Сигнатура:**

```haskell
lca :: (Ord a) => a -> a -> Tree a -> a
```

**Примери:**

```haskell
testTree :: Tree Int
testTree = Node 11
                (Node 7
                    (Node 4 Empty Empty)
                    (Node 9 Empty Empty))
                (Node 21 Empty Empty)
lca 4 9 testTree -> 7
lca 4 21 testTree -> 11
```

###Задача 3 - Level
Да се напише функция `level :: Int -> Tree a -> [a]`, която връща списък с всички елементи, които се намират на дадено ниво в двоично дърво.

**Сигнатура:**

```haskell
level :: Int -> Tree a -> [a]
```

**Примери:**

```haskell
testTree :: Tree Int
testTree = Node 11
                (Node 7
                    (Node 4 Empty Empty)
                    (Node 9 Empty Empty))
                (Node 21 Empty Empty)
level 1 testTree = [11]
level 2 testTree = [7, 21]
level 3 testTree [4 , 9]
level 4 testTree = []
```
