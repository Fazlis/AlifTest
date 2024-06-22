

/*
 Задача #1: Замена отрицательных чисел в массиве на нули
 */

import Foundation


/*
 Решение этой задачи может иметь несколько подходов:
 - Использование циклов
 - Использование мапперов
 - В случае когда нужен и исходный массив и тот что изменен можно даже просто создать новый массив
 */


// Первое решение использовать циклы
//<T: Numeric & SignedNumeric> используется для решения не только целочисленных форматов данных но так и для дробных данных таких как float, double и т.д.
func replaceNegativeWithZeroUsingLoops<T: Numeric & SignedNumeric & Comparable>(array: inout [T]) {
    guard array.count > 1 else { return }
    
    for itemIndex in 0 ..< array.count {
        if array[itemIndex] < 0 {
            array[itemIndex] = 0
        }
    }
}

//Второе решение использовать мапперы
func replaceNegativeWithZeroUsingMappers<T: Numeric & SignedNumeric & Comparable>(array: inout [T]) {
    //В данном решении можно использовать два типа мапперов compactMap и просто map
    //Я буду использовать compactMap для того что сразу убрать nil значение
    guard array.count > 1 else { return }
    
    array.compactMap { $0 < 0 ? 0 : $0 }
}

//Решение третье когда нужен исходный массив
func replaceNegativeWithZeroUsingNewArray<T: Numeric & SignedNumeric & Comparable>(array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    var newReplacedArray: [T] = []
    
    array.forEach { item in
        newReplacedArray.append(item < 0 ? 0 : item)
    }
    
    return newReplacedArray
}
