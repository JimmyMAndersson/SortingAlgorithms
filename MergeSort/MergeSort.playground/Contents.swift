extension Array where Element: Comparable {
  public mutating func mergeSort() {
    let startSlice = self[0..<self.count]
    let slice = mergeSort(startSlice)
    let array = Array(slice)
    self = array
  }
  
  public func mergeSorted() -> Array<Element> {
    let startSlice = self[0..<self.count]
    let slice = mergeSort(startSlice)
    let array = Array(slice)
    return array
  }
  
  private func mergeSort(_ array: ArraySlice<Element>) -> ArraySlice<Element> {
    if array.count < 2 {
      return array
    } else {
      let midIndex = (array.endIndex + array.startIndex) / 2
      let slice1 = mergeSort(array[array.startIndex..<midIndex])
      let slice2 = mergeSort(array[midIndex..<array.endIndex])
      return merge(slice1, slice2)
    }
  }
  
  private func merge(_ firstArray: ArraySlice<Element>, _ secondArray: ArraySlice<Element>) -> ArraySlice<Element> {
    var newArray = ArraySlice<Element>()
    newArray.reserveCapacity(firstArray.count + secondArray.count)
    var index1 = firstArray.startIndex
    var index2 = secondArray.startIndex
    
    while index1 < firstArray.endIndex && index2 < secondArray.endIndex {
      if firstArray[index1] < secondArray[index2] {
        newArray.append(firstArray[index1])
        index1 += 1
      } else {
        newArray.append(secondArray[index2])
        index2 += 1
      }
    }
    
    if index1 < firstArray.endIndex {
      let range = index1..<firstArray.endIndex
      let remainingElements = firstArray[range]
      newArray.append(contentsOf: remainingElements)
    }
    if index2 < secondArray.endIndex {
      let range = index2..<secondArray.endIndex
      let remainingElements = secondArray[range]
      newArray.append(contentsOf: remainingElements)
    }
    
    return newArray
  }
}

var l = Array<Int>(stride(from: 8, to: 0, by: -1))
print(l)
// Return a sorted copy, but don't change the underlying storage
print(l.mergeSorted())
print(l)
// Replace the underlying storage with sorted array
l.mergeSort()
print(l)
