extension Array where Element: Comparable {
  
  public mutating func quickSort() {
    quickSort(&self[...])
  }
  
  private func quickSort(_ array: inout ArraySlice<Element>) {
    if array.count < 2 {
      return
    }
    
    sortPivot(in: &array)
    let pivot = partition(&array)
    
    quickSort(&array[array.startIndex..<pivot])
    quickSort(&array[pivot + 1..<array.endIndex])
  }
  
  private func partition(_ array: inout ArraySlice<Element>) -> ArraySlice<Element>.Index {
    let midPoint = (array.startIndex + array.endIndex) / 2
    array.swapAt(midPoint, array.startIndex)
    let pivot = array[array.startIndex]
    
    var lower = array.startIndex
    var upper = array.endIndex - 1
    
    repeat {
      while lower < array.endIndex - 1 && array[lower] <= pivot {
        lower += 1
      }
      while array[upper] > pivot {
        upper -= 1
      }
      
      if lower < upper {
        array.swapAt(lower, upper)
      }
    } while lower < upper
    
    array.swapAt(array.startIndex, upper)
    return upper
  }
  
  private func sortPivot(in array: inout ArraySlice<Element>) {
    let startPoint = array.startIndex
    let midPoint = (array.startIndex + array.endIndex) / 2
    let endPoint = array.endIndex - 1
    
    if array[startPoint] > array[midPoint] {
      array.swapAt(startPoint, midPoint)
    }
    if array[midPoint] > array[endPoint] {
      array.swapAt(midPoint, endPoint)
    }
    if array[startPoint] > array[midPoint] {
      array.swapAt(startPoint, midPoint)
    }
  }
}


var arr = [1,4,2,5,3,4]
arr.quickSort()
print(arr)
