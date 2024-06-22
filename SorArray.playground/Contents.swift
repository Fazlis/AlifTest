

/*
 Задача #2: Сортировка массива по убыванию(возрастанию)
 */

import Foundation


/*
 Решение этой задачи может иметь несколько подходов:
 - Использование нативного метода sort
 - Использование создание кастомного метода
 */

//Решение №1 использование нативного метода sort

var stringArray = ["abc", "cba", "bac", "cab", "bca", "acb"]
var numericArray = [-0, 0, 1, 1.2, 1.01, -1, -3, 3, -0.1, 0.1, 4]

//Использование нативного метода sort еще надо учесть что сортировку может использовать не только для цифр но и для букв и символов

var upSortedArray = stringArray.sorted(by: < )

var downSortedArray = stringArray.sorted(by: > )


//Решение №2 Написание кастомного метода
//Тут можно написать какую-то отдельную функцию или еще лучше можно расширить Array
//Плюсы написания своего метода в том что можно выбирать какой метод сортировки использовать
extension Array {
    
    typealias SortCondition = (Element, Element) -> Bool
    
    enum SortAlgorithmType {
        case bubbleSort(SortCondition)
        case insertionSort(SortCondition)
        case quickSort(SortCondition)
    }
    
    //В данном примере можно использовать разные подходы сортировки я буду использовать метод пузыря, сортировку вставками и быструю сортировку
    //MARK: - Основная функция сортировки
    mutating func customSort(withAlgorithmType: SortAlgorithmType) -> [Element] {
        switch withAlgorithmType {
        case .bubbleSort(let sortMethod): return bubbleSort(by: sortMethod)
        case .insertionSort(let sortMethod): return insertionSort(by: sortMethod)
        case .quickSort(let sortMethod): return quickSort(by: sortMethod)
        }
    }
    
    
    //MARK: - Метод сортировки вставками
    mutating  private func insertionSort(by areInIncreasingOrder: SortCondition) -> [Element] {
        //Проверка на пустой массив или массив сожержащий только один элемент
        guard count > 1 else { return self }
        
        // Создаем копию исходного массива, с которой будем работать
        var sortedArray = self
        
        
        for i in 1 ..< sortedArray.count {
            
            var j = i
            
            let temp = sortedArray[j]
            
            while j > 0 && areInIncreasingOrder(temp, sortedArray[j - 1]) {
                sortedArray[j] = sortedArray[j - 1]
                j -= 1
            }
            
            sortedArray[j] = temp
        }
        
        return sortedArray
    }
    
    //MARK: - Метод сортировки пузырьком
    mutating  private func bubbleSort(by areInIncreasingOrder: SortCondition) -> [Element] {
        //Проверка на пустой массив или массив сожержащий только один элемент
        guard count > 1 else { return self }
        
        var sortedArray = self
        
        for i in 0 ..< sortedArray.count {
            
            var swapped = false
            
            for j in 0 ..< (sortedArray.count - 1 - i) {
                if areInIncreasingOrder(sortedArray[j + 1], sortedArray[j]) {
                    sortedArray.swapAt(j, j + 1)
                    swapped = true
                }
            }
            
            // Если на текущей итерации внутреннего цикла не было обменов, значит массив уже отсортирован
            if !swapped { break }
        }
        
        return sortedArray
    }
    
    //MARK: - Метод сортировки "Быстрой сортировки"
    
    mutating func quickSort(by condition: SortCondition) -> [Element] {
        //Проверка на пустой массив или массив сожержащий только один элемент
        guard self.count > 1 else { return self }
        
        quickSortHelper(start: 0, end: self.count - 1, by: condition)
        
        return self
    }
    
    private mutating func quickSortHelper(start: Int, end: Int, by condition: SortCondition) {
        if start < end {
            let pivotIndex = partition(start: start, end: end, by: condition)
            
            quickSortHelper(start: start, end: pivotIndex - 1, by: condition)
            quickSortHelper(start: pivotIndex + 1, end: end, by: condition)
        }
    }
    
    private mutating func partition(start: Int, end: Int, by condition: SortCondition) -> Int {
        let pivot = self[end]
        var i = start
        
        for j in start ..< end {
            if condition(self[j], pivot) {
                self.swapAt(i, j)
                i += 1
            }
        }
        
        self.swapAt(i, end)
        return i
    }
}
