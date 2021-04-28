import UIKit

/*
 Binary search -> only works on sorted array
 take an array, and keep chop it in half, until you find the key.
 1. find the value at mid point array
 if the key is greater than the mid point, we can get rid of entire leftside of array. repeat to end
 */

let numbers = [1, 4, 6, 7, 10, 12, 18]

func binarySearch(array: [Int], key: Int) -> Bool {
    
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex / 2
    let midValue = array[midIndex]
    
    //check if the key is within the array
    if key < array[minIndex] || key > array[maxIndex] {
        print("\(key) is not in the array")
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    if key < midValue {
        let slice = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }
    return false
}

binarySearch(array: numbers, key: 10)
