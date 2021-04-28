import UIKit

//Given an array a of n numbers and a count k find the k largest values in the array a.
//Example: a=[5, 1, 3, 6, 8, 2, 4, 7], k=3 ⇒ [6, 8, 7]

func findLargest(_ n: Int, from nums: [Int]) -> [Int]{
    let results = [Int]()
    return baseFinder(n: n, from: nums, results: results)
}

func baseFinder(n: Int, from nums: [Int], results: [Int]) -> [Int] {
    if n == 0 {
        return results
    }
    
    else {
        var editableSource = nums
        var editableResults = results

        let result = findLargestNum(from: nums)

        let index = result.index
        let largest = result.largestNum

        editableResults.append(largest)
        editableSource.remove(at: index)

        return baseFinder(n: n-1, from: editableSource, results: editableResults)
    }
}

func findLargestNum(from nums: [Int]) -> (largestNum: Int, index: Int) {
    var largestNum = 0
    var largestNumIndex = 0
    //enumerated iterates through the list
    for (index, num) in nums.enumerated() {
        if num > largestNum {
            largestNum = num
            largestNumIndex = index
        }
    }
    return (largestNum, largestNumIndex)
}


let source = [5, 1, 3, 6, 8, 2, 4, 7,]
let n = 3

print(findLargest(n, from: source))
