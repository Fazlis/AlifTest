



/*
 Задача #3: Найти max(min) элемент в массиве
 */

import Foundation


/*
 Решение этой задачи может иметь несколько подходов:
 - Использование нативного метода min, max
 - Использование создание кастомного метода
 */

//MARK: - Нативный метод

var numericArray = [-3,4,5,6,12,3,5,1,-10,-45, -0.01, 46.7]

//Нахождение минимального числа из массива
var minNumericElementInArray = numericArray.min()

//Нахождение максимального числа из массива
var maxNumericElementInArray = numericArray.max()

//MARK: - Создание кастомного метода

extension Array {
    
    func findMax() -> Element? where Element: Numeric & SignedNumeric & Comparable {
        guard !self.isEmpty else { return nil }
        
        var maxValue = self[0]
        
        self.forEach { item in
            if item > maxValue {
                maxValue = item
            }
        }
        
        return maxValue
    }
    
    func findMin() -> Element? where Element: Numeric & SignedNumeric & Comparable {
        guard !self.isEmpty else { return nil }
        
        var minValue = self[0]
        
        self.forEach { item in
            if item < minValue {
                minValue = item
            }
        }
        
        return minValue
    }
}


