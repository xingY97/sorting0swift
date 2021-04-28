import UIKit

/*
selection sort
divide an array into two sub array, one sorted, one unsorted. first find the smallest in unsorted array, move it to the leftmost position, everything else will move to the right, repeat until array ends.
 O(n^2)
 */
var dataArray = [6, 1, 5, 2, 3, 9]
var minIndex = 0
var minNumber = dataArray[minIndex]
print("Array before sorting:", dataArray)

for i in 0..<dataArray.count {
    minIndex = i
    for j in (i+1)..<dataArray.count {
        if dataArray[j] < dataArray[minIndex] {
            minIndex = j
        }
        dataArray.swapAt(i, minIndex)
    }
}
print("after sorting:", dataArray)
