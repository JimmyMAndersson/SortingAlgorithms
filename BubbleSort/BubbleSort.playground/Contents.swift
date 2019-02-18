extension Array where Element: Comparable {
  public mutating func bubbleSort() {
    for alreadySorted in 1 ... self.count {
      var sorted = true
      for walkerIndex in 0 ..< self.count - alreadySorted {
        if self[walkerIndex] > self[walkerIndex + 1] {
          swapAt(walkerIndex, walkerIndex + 1)
          sorted = false
        }
      }
      if sorted {
        break
      }
    }
  }
}
