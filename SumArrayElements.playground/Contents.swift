
/*
 Задача #4 Найти сумму элементов массива
 */

import Foundation


/*
 Решение этой задачи может иметь несколько подходов:
 - Использование нативного метода reduce
 - Cоздание кастомного метода
 */


var numericArray = [-0, 0, 1, 1.2, 1.01, -1, -3, 3, -0.1, 0.1, 4]

//MARK: - Использование нативного метода

var summNumericArray = numericArray.reduce(0, +)

//MARK: - Написание кастомного метода
extension Array {
    
    func findSum() -> Element? where Element: Numeric & SignedNumeric & Comparable {
        guard !self.isEmpty else { return nil }
        
        var finderValue = self[0]
        
        self.forEach { finderValue += $0 }
        
        return finderValue
    }
}
