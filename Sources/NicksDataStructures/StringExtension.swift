//
//  StringExtension.swift
//  
//
//  Created by Nick Cracchiolo on 1/21/22.
//

import Foundation

extension String {
    mutating func reverseWords() {
        String.reverse(string: &self, from: self.startIndex, to: self.index(before: self.endIndex))
        
        var start = self.startIndex
        var end = self.index(after: start)
        
        while end < self.endIndex {
            while end < self.endIndex {
                if self[end].isWhitespace {  break }
                end = self.index(after: end)
            }
            String.reverse(string: &self, from: start, to: self.index(before: end))
            if end >= self.index(before: self.endIndex) { return }
            start = self.index(after: end)
            end = self.index(after: start)
        }
    }
    
    private static func reverse(string: inout String, from i: Index, to j: Index) {
        var start = i, end = j
        
        while start < end {
            string.swapCharacters(at: start, j: end)
            start = string.index(after: start)
            end = string.index(before: end)
        }
    }
    
    private mutating func swapCharacters(at i: String.Index, j: String.Index) {
        let temp = self[i]
        self.replaceSubrange(i...i, with: [self[j]])
        self.replaceSubrange(j...j, with: [temp])
    }
    
    func numberOfPalindrones() -> Int {
        var count = 0
        var i = self.startIndex
        while i < self.endIndex {
            if i > self.startIndex && i < self.endIndex {
                count += checkForPalindrone(from: self.index(before: i), to: self.index(after: i))
            }
            if i < self.endIndex {
                count += checkForPalindrone(from: i, to: self.index(after: i))
            }
            i = self.index(after: i)
        }
        return count
    }
    
    private func checkForPalindrone(from i: String.Index, to j: String.Index) -> Int {
        guard i >= self.startIndex && j < self.endIndex else { return 0 }
        var count = 0
        var start = i, end = j
        let endIndexMinusOne = self.index(before: self.endIndex)
        while true {
            if self[start] != self[end] { break }
            count += 1
            if start > self.startIndex && end < endIndexMinusOne {
                start = self.index(before: start)
                end = self.index(after: end)
            } else {
                break
            }
        }
        return count
    }
}
