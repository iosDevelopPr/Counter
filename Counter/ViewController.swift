//
//  ViewController.swift
//  Counter
//
//  Created by Igor on 20.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!

    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var actionLog: UITextView!
    
    @IBOutlet weak var buttonZero: UIButton!
    
    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateCounterLabel()
        
        actionLog.text = "История изменений:"
        actionLog.isEditable = false
    }

    private func updateCounterLabel() {
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    private func updateActionLog(_ action: Int) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let currentDateString = dateFormatter.string(from: Date())
        
        switch action {
        case 1:
            actionLog.text += "\n\(currentDateString): значение изменено на +1"
        case -1:
            actionLog.text += "\n\(currentDateString): значение изменено на -1"
        case -2:
            actionLog.text += "\n\(currentDateString): попытка уменьшить значение счетчика ниже 0"
        case 0:
            actionLog.text += "\n\(currentDateString): значение сброшено"
        default:
            break
        }
    }
    
    @IBAction func buttonPlusTap(_ sender: Any) {
        counter += 1
        updateActionLog(1)
    }
    
    @IBAction func buttonMinusTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateActionLog(-1)
        }
        else {
            updateActionLog(-2)
        }
        
    }
    
    @IBAction func buttonZeroTap(_ sender: Any) {
        counter = 0
        updateActionLog(0)
    }
}

