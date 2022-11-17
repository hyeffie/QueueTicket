//
//  Queue.swift
//  QueueTicket
//
//  Created by Hyejeong Park on 2022/11/17.
//

import Foundation

struct Queue<T> {
  
  private let capacity: Int?
  
  private var queue: [T]
  
  public var count: Int { queue.count }
  
  public var ratio: Float {
    if let capacity = capacity { return Float(queue.count) / Float(capacity) }
    return 1
  }
  
  public var canEnqueue: Bool {
    if let capacity = capacity { return count < capacity }
    return true
  }
  
  public var canDequeue: Bool { !queue.isEmpty }
  
  init(capacity: Int?) {
    self.capacity = capacity
    self.queue = []
  }
  
  public mutating func enqueue(_ element: T) {
    if canEnqueue { queue.append(element) }
  }
  
  public mutating func dequeue() -> T? {
    canDequeue ? queue.removeFirst() : nil
  }
  
}
