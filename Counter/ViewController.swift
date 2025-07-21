//
//  ViewController.swift
//  Counter
//
//  Created by Igor on 20.07.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var actionLogLabel: UITextView!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    private var counter: Int = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCounterLabel()
        
        actionLogLabel.text = "История изменений:"
        actionLogLabel.isEditable = false
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func updateActionLogLabel(_ action: Int) {
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let currentDateString = dateFormatter.string(from: Date())
        
        switch action {
        case 1:
            actionLogLabel.text += "\n\(currentDateString): значение изменено на +1"
        case -1:
            actionLogLabel.text += "\n\(currentDateString): значение изменено на -1"
        case -2:
            actionLogLabel.text += "\n\(currentDateString): попытка уменьшить значение счётчика ниже 0"
        case 0:
            actionLogLabel.text += "\n\(currentDateString): значение сброшено"
        default:
            break
        }
    }
    
    @IBAction private func incrementButtonTap(_ sender: Any) {
        counter += 1
        updateActionLogLabel(1)
    }
    
    @IBAction private func decrementButtonTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            updateActionLogLabel(-1)
        } else {
            updateActionLogLabel(-2)
        }
    }
    
    @IBAction private func resetButtonTap(_ sender: Any) {
        counter = 0
        updateActionLogLabel(0)
    }
}

