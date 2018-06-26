import UIKit
enum Calculations: Int {
    case add = 1, sub = 2, mul = 3, div = 4, none = 0
}

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    var operation: Calculations = .none
    var onOperation: Bool = false
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var result: Double = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.layer.cornerRadius = 10
        resultLabel.clipsToBounds = true
        
        for i in 0...15 {
            let button = self.view.viewWithTag(i) as? UIButton
            button?.layer.cornerRadius = (button?.frame.width)! / 2
            button?.clipsToBounds = true
        }
        
        resultLabel.clipsToBounds = true
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        onOperation = false
        if operation == .none {
            firstNumber = firstNumber * 10 + Double(sender.tag)
            resultLabel.text = "\(firstNumber)"
        } else {
            secondNumber = secondNumber * 10 + Double(sender.tag)
            resultLabel.text = "\(secondNumber)"
        }
    }

    @IBAction func additionButtonPressed(_ sender: UIButton) {
        guard !onOperation else {
            operation = .add
            return
        }
        switch operation {
        case .add:firstNumber = calc(firstNumber, secondNumber, opetationType: +)
        secondNumber = 0
        case .sub:firstNumber = calc(firstNumber, secondNumber, opetationType: -)
        secondNumber = 0
        case .mul:firstNumber = calc(firstNumber, secondNumber, opetationType: *)
        secondNumber = 0
        case .div:firstNumber = calc(firstNumber, secondNumber, opetationType: /)
        secondNumber = 0
        default:break
        }
        resultLabel.text = "\(firstNumber)"
        operation = .add
        onOperation = true
    }
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        guard !onOperation else {
            operation = .sub
            return
        }
        switch operation {
        case .add:firstNumber = calc(firstNumber, secondNumber, opetationType: +)
        secondNumber = 0
        case .sub:firstNumber = calc(firstNumber, secondNumber, opetationType: -)
        secondNumber = 0
        case .mul:firstNumber = calc(firstNumber, secondNumber, opetationType: *)
        secondNumber = 0
        case .div:firstNumber = calc(firstNumber, secondNumber, opetationType: /)
        secondNumber = 0
        default:break
        }
        resultLabel.text = "\(firstNumber)"
        operation = .sub
        onOperation = true
    }
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        guard !onOperation else {
            operation = .mul
            return
        }
        switch operation {
        case .add:firstNumber = calc(firstNumber, secondNumber, opetationType: +)
        secondNumber = 0
        case .sub:firstNumber = calc(firstNumber, secondNumber, opetationType: -)
        secondNumber = 0
        case .mul:firstNumber = calc(firstNumber, secondNumber, opetationType: *)
        secondNumber = 0
        case .div:firstNumber = calc(firstNumber, secondNumber, opetationType: /)
        secondNumber = 0
        default:break
        }
        resultLabel.text = "\(firstNumber)"
        operation = .mul
        onOperation = true
    }
    @IBAction func divideButtonPressed(_ sender: UIButton) {
        guard !onOperation else {
            operation = .div
            return
        }
        switch operation {
        case .add:firstNumber = calc(firstNumber, secondNumber, opetationType: +)
        secondNumber = 0
        case .sub:firstNumber = calc(firstNumber, secondNumber, opetationType: -)
        secondNumber = 0
        case .mul:firstNumber = calc(firstNumber, secondNumber, opetationType: *)
        secondNumber = 0
        case .div:firstNumber = calc(firstNumber, secondNumber, opetationType: /)
        secondNumber = 0
        default:break
        }
        resultLabel.text = "\(firstNumber)"
        operation = .div
        onOperation = true
    }
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        switch operation {
        case .add:result = calc(firstNumber, secondNumber, opetationType: +)
        case .sub:result = calc(firstNumber, secondNumber, opetationType: -)
        case .mul:result = calc(firstNumber, secondNumber, opetationType: *)
        case .div:result = calc(firstNumber, secondNumber, opetationType: /)
        default:break
        }
        onOperation = false
        resultLabel.text = "\(result)"
    }
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        operation = .none
        result = 0
        resultLabel.text = "0.0"
        onOperation = false
    }
    
    func calc(_ num1: Double, _ num2: Double, opetationType: (Double, Double) -> Double) -> Double {
        return opetationType(num1, num2)
    }
}

