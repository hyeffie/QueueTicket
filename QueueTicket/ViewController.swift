//
//  ViewController.swift
//  QueueTicket
//
//  Created by Hyejeong Park on 2022/11/17.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var queue = Queue<Int>(capacity: 20)
  
  @IBOutlet weak var countLabel: UILabel!
  
  @IBOutlet weak var gaugeView: UIProgressView!
  
  @IBOutlet weak var addAwaiterButton: UIButton!
  
  @IBOutlet weak var confirmEntranceButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.queue = Queue(capacity: 20)
    updateStatus()
  }
  
  @IBAction func addAwaiter(_ sender: Any) {
    queue.enqueue(1)
    updateStatus()
  }
  
  @IBAction func confirmEntrance(_ sender: Any) {
    if queue.dequeue() != nil { updateStatus() }
  }
  
  func updateStatus() {
    countLabel.text = "\(queue.count) 명"
    gaugeView.progress = queue.ratio
    addAwaiterButton.isEnabled = queue.canEnqueue
    confirmEntranceButton.isEnabled = queue.canDequeue
    countLabel.textColor = queue.canEnqueue ? .black : .red
  }
  
}
