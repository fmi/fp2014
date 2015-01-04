Домашна работа 9
=========

Решенията на задачите се предават по e-mail на адрес:

>fp2014.fmi@gmail.com

Решението на всяка задача трябва да бъде под формата на файл с окончание *.hs*, който да съдържа дефиницията на функцията (със точната сигнатура дефинирана в условието на задачата) и евентуално други помощни дефиниции, необходими за реализацията. Файловете се изпращат като *attachment-и* в *mail-a*. Освен решения на задачите самият *mail* трябва да съдържа име, група и факултен номер. Успех!

###Задача 1 - merge
Да се напише функция `merge :: [a] -> [a] -> [a]`, която получава като аргументи два списъка и връща като резултат списък, в който елементите от двата входни списъка се редуват алтернативно.


**Сигнатура:**

```haskell
merge :: [a] -> [a] -> [a]
```

**Примери:**

```haskell
merge [1, 2, 3] [4, 5, 6] -> [1, 4, 2, 5, 3, 6]
merge [] [1, 2, 3] -> [1, 2, 3]
merge [1, 2] [3, 4] -> [1, 3, 2, 4]
```

Решението да използва `list comprehension`

###Задача 2 - hamming distance
Да се напише функция `hammingDistance :: String -> String -> Int`, която пресмята [разстоянието по Хеминг](http://en.wikipedia.org/wiki/Hamming_distance) (брой различни символи) между 2 низа.


**Сигнатура:**

```haskell
hammingDistance :: String -> String -> Int
```

**Примери:**

```haskell
hammingDistance "orange" "apples" -> 6
hammingDistance "karolin" "kathrin" -> 3
```

Може да се счита, че входът ще бъде коректен и ще се подават само низове с равна дължина.

###Задача 3 - dictionary
Да се напише функция `dictionary :: String -> [(String, Int)]`, която приема като аргумент низ и връща списък от наредени двойки, в който първи елемент на всяка двойка е дума във входния низ, а втори елемент на двойката е броят на срещанията на тази дума. За `parse`-ване на думите от входния низ да се използва вградената функция `words`. Да не се отчита разлика между малки и големи букви. 


**Сигнатура:**

```haskell
dictionary :: String -> [(String, Int)]
```

**Примери:**

```haskell
dictionary "The quick brown fox jumps over the lazy dog" -> [("the", 2), ("quick", 1), ("brown", 1), ("fox", 1), ("jumps", 1), ("over", 1), ("lazy", 1), ("dog", 1)]
```

###Задача 4 - tfidf
[TF-IDF](http://en.wikipedia.org/wiki/Tf%E2%80%93idf) е метрика, която се ползва за ranking на документи при търсене, която отчита до каква степен дадена дума е определяща за един документ(текст). Да се напише функция `tfidf :: String -> String -> [String] -> Float`, която приема като аргументи 2 низа - дума и изречение (документ) и списък от низове (изречения / документи) и пресмята метриката по описаната в линка формула.

**Сигнатура:**

```haskell
tfidf :: String -> String -> [String] -> Float
```

**Примери:**

```haskell
tfidf "the" "the quick brown fox jumps over the lazy dog" ["the quick brown fox jumps over the lazy dog", "the house is painted in white", "This project is falling behind schedule"] -> 1.168
```
Първият *документ* е 

`the quick brown fox jumps over the lazy dog.`

Думата *the* се среща `2` пъти в него, т.е.

`tf("the", "the quick brown fox jumps over the lazy dog") = 2`

Думата *the* се среща в `2` от `3`-те документа, които са подадени

`["**the** quick brown fox jumps over **the** lazy dog", "**the** house is painted in white", "This project is falling behind schedule"]`

![Latex](http://latex.codecogs.com/gif.latex?idf%28%22the%22%2C%20D%29%20%3D%20log_2%20%5Cfrac%7B3%7D%7B2%7D%20%3D%200.584)


![Latex](http://latex.codecogs.com/gif.latex?tfidf%28t%2C%20d%2C%20D%29%20%3D%202%20*%200.584%20%3D%201.168)

**Hint:**
Използвайте предната задача и вградената функция `logBase`, за да пресметнете логаритъм при основа `2`
