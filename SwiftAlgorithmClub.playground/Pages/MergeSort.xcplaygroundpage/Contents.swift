//: [Previous](@previous)
//: 归并排序



let array = [7, 2, 6, 3, 9, 17, 89, 20, 30]
let arrayB = ["ass", "dfhss", "basasdfdf", "azsdfsdfas", "sfsdft", "gdfas", "fsadfac"]
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2
    
    let leftArray =  mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
    
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [T] = []
    while leftIndex < left.count && rightIndex < right.count {
        let leftElem = left[leftIndex]
        let rightElem = right[rightIndex]
        if leftElem < rightElem {
            orderedArray.append(leftElem)
            leftIndex += 1
        } else if leftElem > rightElem {
            orderedArray.append(rightElem)
            rightIndex += 1
        } else {
            orderedArray.append(leftElem)
            leftIndex += 1
            orderedArray.append(rightElem)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

mergeSort(array)
mergeSort(arrayB)

