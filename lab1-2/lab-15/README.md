Упражнение 15
=========

###Разгледани теми
- алгебрични типове данни, type синоними

###Препоръчани материали
- [Declaring Types and Classes - TU-Delft, Part 1](http://delftxdownloads.tudelft.nl/FP101x-FunctionalProgramming/Week5/FP101x-chapter9-part1-video.720.mp4)
- [Declaring Types and Classes - TU-Delft, Part 2](http://delftxdownloads.tudelft.nl/FP101x-FunctionalProgramming/Week5/FP101x-chapter9-part2-video.720.mp4)
- [Declaring Types and Classes - TU-Delft, Part 3](http://delftxdownloads.tudelft.nl/FP101x-FunctionalProgramming/Week5/FP101x-chapter9-part3-video.720.mp4)
- [Functional Programming - 101, TU-Delft](https://github.com/fptudelft/FP101x-Content)

###Задачи
- да се дефинира функция `member :: a -> Tree a -> Bool`, която проверява дали даден елемент се съдържа в двоично дърво
- да се дефинира функция `member' :: a -> Tree a -> Bool`, която проверява дали даден елемент се съдържа в двоично дърво за търсене
- да се дефинира функция `inOrder :: Tree a -> [a]`, която записва в списък стойностите на елементите на дърво, обходени в реда ляво-корен-дясно
- да се дефинира функция `preOrder :: Tree a -> [a]`, която записва в списък стойностите на елементите на дърво, обходени в реда корен-ляво-дясно
- да се дефинира функция `postOrder :: Tree a -> [a]`, която записва в списък стойностите на елементите на дърво, обходени в реда ляво-дясно-корен
- да се дефинира функция `insert :: (Ord a) => a -> Tree a -> Tree a`, която вмъква елемент в двоично дърво за търсене
- да се дефинира функция `sumTree :: Tree Int -> Int`, която сумира стойностите на всички елементи на двоично дърво от цели числа
- да се дефинира функция `minTree :: (Ord a) => Tree a -> a`, която намира минималният елемент в двоично дърво
- да се направи `Tree` инстанция на `Show` и `Eq`
- да се дефинира тип `Expression`, който моделира целочислен аритметичен израз и има `3` `value` конструктора - `I Int`, `Add Expression Expression`, `Mult Expression Expression`.
- да се дефинира функция `eval :: Expr -> Int`, която оценява стойността на даден израз.
- да се дефинира тип `Order`, който моделира поръчка на продукт. Типът да има `2` `value` констуктора - `Online Float Int Int` (цена на стоката, номер на поръчката и брой часове до доставка) и `Offline Float` (цена на стоката)
- да се дефинира функция `isOnline :: Order -> Bool`, която връща дали дадена поръчка е направена онлайн.
- да се дефинира функция `timeUntilReceiving :: Order -> Int`, която връща след колко часа поръчката ще бъде получена
- да се дефинира функция `totalPrice :: [Order] -> Float`, която връща общата цена на списък от поръчки
- да се дефинира функция `onlineOrders :: [Order] -> Int`, която връща броят на онлайн поръчки в даден списък.
- да се дефинира функция `isExpensive :: Order -> Bool`, която проверява дали цената на поръчаната стока надвишава 100.
- да се направи `Order` инстанция на `Show` и `Eq`.
- да се дефинира тип `Employee`, който моделира служител в компания. Типът да има `1` `value` конструктор `Employee String Int String Int` (име, години, име на длъжността, заплата)
- да се дефинира типов синоним `Department`, който представлява списък от служители.
- да се дефинира функция `expenses :: Department -> Int`, която връща разходите, които компанията има за един отдел (сума от заплати).
- да се дефинира функция `hasManager :: Department -> Bool`, която проверява дали отделът има ръководител (име на длъжност "manager").
- последната задача от двата варианта от миналогодишното второ контролно - https://github.com/IvanIvanov/fp2013/tree/master/exams/exam2
