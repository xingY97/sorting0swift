import UIKit

// Given an array of n numbers and a target vaule, find two numbers whose sum is 10
//Example: a=[5, 3, 6, 8, 2, 4, 7], t=10 ⇒ [3, 7] or [6, 4] or [8, 2]

var inputArray = [5, 3, 6, 8, 2, 4, 7]
var sum = 10

func findTwoSumHash(inputArray: [Int], sum: Int) {
    var dictionary: [Int: Int] = [:]
    
    for element in inputArray {
        let difference = sum - element
        
        if let _ = dictionary[difference] {
            print("(\(element), \(difference))")
        }
        
        dictionary[element] = element
    }
}

findTwoSumHash(inputArray: inputArray, sum: sum)
