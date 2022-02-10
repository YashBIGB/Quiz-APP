// App by Yash Saxena 2022.
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [
      Question(answer: "True", text: "Three + Two is always equal to 5 "),
      Question(answer: "False", text: "20 * 20 is equal to 300"),
      Question(answer: "True", text: "Am I a good candidate to work in Ibrat Company?")
    ]
    
    var questionNumber = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func nextQuestion(_ sender: UIButton) {
        updateUI()
        
        if questionNumber + 1 < quiz.count{
        questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle //True, False
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        
        } else {
            sender.backgroundColor = UIColor.red
        }
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float (questionNumber) / Float(quiz.count)
        
    }
    
}

