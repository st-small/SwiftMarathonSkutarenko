import UIKit

/*
 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
 
 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
 
 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
 
 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
 
 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
 
 6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
 
 007. Уровень супермен
 
 Выполните задание шахмат из урока по энумам используя структуры либо классы
 */





var dictUsers = ["ivan" : ["12:00": 123, "15:00": 24, "16:00" :27], "stepan" : ["10:00": 12, "11:00":14, "12:00":17]]

for i in dictUsers {
    print(i)
    if i.key == "ivan" {
        print(i.value)
        dictUsers[i.key]?.updateValue(100, forKey: "77:77")
        
    }
}

print(dictUsers["ivan"] ?? 0)


