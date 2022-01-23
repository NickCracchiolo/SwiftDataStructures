//
//  ArrayExtension.swift
//  
//
//  Created by Nick Cracchiolo on 1/21/22.
//

import Foundation

extension Array where Element: Comparable {
    mutating func bubbleSort(ascending: Bool = true) {
        var i = 0
        while i < self.count {
            for j in 0..<(self.count - 1) {
                if ascending {
                    if self[j] > self[j + 1] {
                        let temp = self[j]
                        self[j] = self[j + 1]
                        self[j + 1] = temp
                    }
                } else {
                    if self[j] < self[j + 1] {
                        let temp = self[j]
                        self[j] = self[j + 1]
                        self[j + 1] = temp
                    }
                }
            }
            i += 1
        }
    }
    
    mutating func quickSort() {
        self._quickSort(start: 0, end: self.count - 1)
    }
    
    private mutating func _quickSort(start: Int, end: Int) {
        guard start < end else { return }
        let pivot = self.myPartition(start: start, end: end)
        print("Pivot: \(pivot)")
        self._quickSort(start: start, end: pivot - 1)
        self._quickSort(start: pivot + 1, end: end)
    }
    
    private mutating func myPartition(start: Int, end:Int) -> Int {
        print("Quick Sorting from \(start) to \(end)")
        let pivot = self[end]
        print("pivoting around \(pivot)")
        var i = start

        // traverse through all elements
        // compare each element with pivot
        for j in start..<end {
           if self[j] <= pivot {
               // if element smaller than pivot is found
               // swap it with the greatr element pointed by i
               // swapping element at i with element at j
               print("\(self[j]) <= \(pivot), Swapping")
               self.swapAt(i, j)
               i += 1
           }
        }

        // swapt the pivot element with the greater element specified by i
        print("Swapping \(self[i]) and \(self[end])")
        self.swapAt(i, end)

        // return the position from where partition is done
        print("After QuickSort from \(start) to \(end) = \(self)")
        return i
    }
}
