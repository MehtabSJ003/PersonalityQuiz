//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Mehtab Singh on 2024-06-28.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    // Custom initializer with responses parameter
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    // Required initializer for UIViewController subclass
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true // Hide the back button
        calculatePersonalityResult() // Calculate and display the personality result
    }
    
    // Function to calculate the personality result based on responses
    func calculatePersonalityResult() {
        // Count the frequency of each answer type
        let frequencyOfAnswers = responses.reduce(into: [:]) { (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        
        // Sort the answer types by frequency
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        // Get the most common answer type
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        // Display the result
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}

