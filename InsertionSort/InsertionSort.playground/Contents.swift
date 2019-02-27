extension Array where Element: Comparable {
  
  public mutating func insertionSort() {
    for iterationIndex in 0 ..< self.count {
      
      var swapIndex = iterationIndex
      
      while swapIndex > 0 {
        
        if self[swapIndex] < self[swapIndex - 1] {
          swapAt(swapIndex, swapIndex - 1)
          swapIndex -= 1
        } else {
          break
        }
        
      } // end while
      
    } // end for
    
  } // end func
}
