extension Array where Element: Comparable {
  
  public mutating func selectionSort() {
    for iterationIndex in 0 ..< self.count - 1 {
      
      var minIndex = iterationIndex
      
      for compareIndex in iterationIndex + 1 ..< self.count {
        if self[compareIndex] < self[minIndex] {
          minIndex = compareIndex
        }
      }
      
      swapAt(iterationIndex, minIndex)
    }
  }
}
