//
//  ViewController.swift
//  StoryTime
//
//  Created by Tammy Coron on 11/17/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

/*  LAB WORK
        1) Add a new IBOutlet named numberLabel.
        2) Connect numberLabel to the "number label" on the storyboard.
        3) Modify the sliderMoved method so that it displays (in the newly created outlet) the currently selected number: "Number (x)".
        4) Add validation so users can't create a bogus story.
            a. Add an alert view that appears when the user taps the generate story button. Only show this if the two text fields are empty.
            b. Disable the "generate story" button until the two text fields have been populated.
               Note: the textfield delegates have already been connected within the storyboard.

    CHALLENGE
        1) Add another poster (image asset) for the Alien story.
        2) Modify the segmented control to allow for a third selection (Aliens).
        3) Modify the segmentedControllerChanged method to populate the necessary values: backgroundImage, monsters, and storyType.
        4) Use NSLocalization.
*/

import UIKit

class ViewController: UIViewController {

    var currentNumber = 50
    var currentSwitchValue = true
    var storyType = 0
    var monsters = "zombies"
    
    @IBOutlet weak var backgroundImage: UIImageView! // background image
    @IBOutlet weak var segmentedControl: UISegmentedControl! // story selection
    @IBOutlet weak var textField1: UITextField! // name
    @IBOutlet weak var textField2: UITextField! // verb
    @IBOutlet weak var sliderControl: UISlider! // number
    @IBOutlet weak var switchControl: UISwitch! // win or lose
    @IBOutlet weak var textview: UITextView! // generated story
    @IBOutlet weak var button: UIButton! // generate story
    
    /* needed for lab */
    @IBOutlet weak var numberLabel: UILabel! // label for number
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textview.layer.borderColor = UIColor.darkGrayColor().CGColor
        textview.layer.borderWidth = 1.0
        
        /* needed for lab */
        numberLabel.text = "Number (\(currentNumber))"
        
        /* needed for lab : validation b */
        checkValidationStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func hideKeyboard(sender: UIButton) {
        textField1.resignFirstResponder()
        textField2.resignFirstResponder()
    }
    
    @IBAction func segmentedControllerChanged(sender: UISegmentedControl) {
        storyType = sender.selectedSegmentIndex
        
        var image : UIImage!
        
        switch storyType {
        case 0: // zombies
            image = UIImage(named:"zombies")
            monsters = "zombies"
        case 1: // vampires
            image = UIImage(named:"vampires")
            monsters = "vampires"
        /* needed for challenge */
        case 2: // aliens
            image = UIImage(named:"aliens")
            monsters = "aliens"
        default:
            sender.tag = 0
        }
        
        resetStory()
        backgroundImage.image = image
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
        currentNumber = lroundf(sender.value)
        
        /* needed for lab */
        numberLabel.text = "Number (\(currentNumber))"
    }
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        if (sender.on) {
            currentSwitchValue = true
        } else {
            currentSwitchValue = false
        }
    }
    
    @IBAction func generateStory(sender: UIButton) {
        
        /* needed for lab : validation a */
        if (textField1.text.isEmpty || textField2.text.isEmpty) {
            showAlert()
            return
        }
        
        switch sender.tag {
        case 1:
            sender.tag = 2
            sender.setTitle("Start Over", forState: UIControlState.Normal)
            populateStory()
        case 2:
            sender.tag = 1
            sender.setTitle("Generate Story", forState: UIControlState.Normal)
            resetStory()
        default:
            sender.tag = 0
        }
    }
    
    func populateStory() {
        println("populateStory = \(currentSwitchValue)")
        
        if (currentSwitchValue) {
            textview.text = "\(textField1.text) entered the room and saw \(currentNumber) \(monsters)! \(textField1.text) \(textField2.text) down the hall. Sadly, \(textField1.text) was killed by all of the \(monsters)! \n\nPoor \(textField1.text). \n\nBetter luck next time!"
        } else {
            textview.text = "\(textField1.text) entered the room and saw \(currentNumber) \(monsters)! \(textField1.text) \(textField2.text) down the hall. Without missing a beat, \(textField1.text) killed all of the \(monsters)! \n\nFantastic! \n\nOur hero will live to fight another day."
        }
    }
    
    func resetStory() {
        textField1.text = ""
        textField2.text = ""
        sliderControl.value = 50
        switchControl.on = true
        textview.text = "your generated story will appear here"
        
        currentNumber = 50
        currentSwitchValue = true
        
        button.setTitle("Generate Story", forState: UIControlState.Normal)
        button.tag = 1
        checkValidationStatus()
        
        /* needed for lab */
        numberLabel.text = "Number (\(currentNumber))"
    }
    
    /* needed for lab : validation a */
    func showAlert() {
        let alertController = UIAlertController(title: "Missing Data!", message: "Hey, you're missing something!", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func checkValidationStatus() {
        if (textField1.text.isEmpty || textField2.text.isEmpty) {
            button.enabled = false
            button.alpha = 0.50
        } else {
            button.enabled = true
            button.alpha = 1.0
        }
    }
    
    /* needed for lab : validation b
       note: not all delegates are required for this to work */
    func textFieldShouldBeginEditing(textField: UITextField!) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField!) {
        checkValidationStatus()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        checkValidationStatus()
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldClear(textField: UITextField!) -> Bool {
        
        return true
    }
}

