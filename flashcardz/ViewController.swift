//
//  ViewController.swift
//  flashcardz
//
//  Created by iD Student on 8/2/17.
//  Copyright © 2017 iD Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var answerPickerView: UIPickerView!

    @IBOutlet weak var questionTextView: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        answerPickerView.dataSource = self
        answerPickerView.delegate = self
        setupCardUI()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupCardUI(){
        questionTextView.text = CardCollection.instance.currentCard.question
        questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
    }
    // Pickerview Data Source
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CardCollection.instance.currentCard.options.count
    }
    
    // Pickerview delegates
    // returns text of option at a given row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CardCollection.instance.currentCard.options[row]
        
    }
    @IBAction func submitButtonPress(_ sender: Any) {
        var alert : UIAlertController
        if CardCollection.instance.checkAnswer(answerPickerView.selectedRow(inComponent : 0)) {
            alert = UIAlertController(title : "Good", message: "Correct", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Correct", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated:true)
        } else {
            alert = UIAlertController(title : "Bad", message: "incorrect", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Not Correct", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated:true)
            
        }
    }
    

}

