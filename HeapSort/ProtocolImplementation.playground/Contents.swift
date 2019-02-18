public extension Array where Element: Comparable {
  public mutating func heapSort() {
    buildHeap()
    shrinkHeap()
  }
  
  private mutating func buildHeap() {
    for index in 1..<self.count {
      var child = index
      var parent = child.parent
      while child > 0 && self[child] > self[parent] {
        swapAt(child, parent)
        child = parent
        parent = child.parent
      }
    }
  }
  
  private mutating func shrinkHeap() {
    for index in stride(from: self.count - 1, to: 0, by: -1) {
      swapAt(0, index)
      var parent = 0
      var leftChild = parent.leftChild
      var rightChild = parent.rightChild
      while parent < index {
        var maxChild = -1
        if leftChild < index {
          maxChild = leftChild
        } else {
          break
        }
        if rightChild < index && self[rightChild] > self[maxChild] {
          maxChild = rightChild
        }
        guard self[maxChild] > self[parent] else { break }
        
        swapAt(parent, maxChild)
        parent = maxChild
        leftChild = parent.leftChild
        rightChild = parent.rightChild
      }
    }
  }
}

private extension Int {
  var parent: Int {
    return (self - 1) / 2
  }
  
  var leftChild: Int {
    return (self * 2) + 1
  }
  
  var rightChild: Int {
    return (self * 2) + 2
  }
}
