import UIKit

/* Merge sort
 the list will be divided until every item is on its own array, and then new lists will be created with list of two items, repeat the step until the whole list is sorted in one list.
 all time = O(n log(n))
 */

func mergeSort(array: [Int]) -> [Int] {
    //check if the array has more than one element
    guard array.count > 1 else {
        return array
    }
    // split the array
    let leftArray = Array(array[0..<array.count/2]) //indexies up tp middle index
    let rightArray = Array(array[array.count/2..<array.count])
    
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

//Merge Array
func merge(left: [Int], right: [Int]) -> [Int] {
    //create an array to append elements
    var mergeArray: [Int] = []
    var left = left
    var right = right // to make array mutable
    
    //compare the first element of the array, whichever one is smaller, append it to new list.
    while left.count > 0 && right.count > 0 {
        
        if left.first! < right.first! {
            mergeArray.append(left.removeFirst())
        } else {
            mergeArray.append(right.removeFirst())
        }
    }
    
    return mergeArray + left + right
    
}

var numbers: [Int] = []

for _ in 0..<10 {
    let randomInt = Int(arc4random_uniform(UInt32(100)))
    numbers.append(randomInt)
}
print(numbers)
print()
print(mergeSort(array: numbers))
