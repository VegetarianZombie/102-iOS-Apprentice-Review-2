//
//  NewStoryViewController.swift
//  StoryTime
//
//  Created by Brian Moakley on 11/26/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

import UIKit

class NewStoryViewController: UIViewController {
    
    @IBOutlet weak var storyTitle: UITextField!
    @IBOutlet weak var monsterType: UISegmentedControl!
    @IBOutlet weak var winningStory: UITextView!
    @IBOutlet weak var losingStory: UITextView!
    var newStory: Story?
    
    @IBAction func save(sender: AnyObject) {
        if storyTitle.text != "" && winningStory.text != "" && losingStory != "" {
            var storyType: StoryType!
            if monsterType.selectedSegmentIndex == 0 {
                storyType = StoryType.zombies
            } else {
                storyType = StoryType.vampires
            }

            newStory = Story(title: storyTitle.text, winStory: winningStory.text, loseStory: losingStory.text, type: storyType)


            performSegueWithIdentifier("SaveStory", sender: nil)
        } else {
            UIAlertView(title: "Validation Error", message: "Please fill out all of the fields.", delegate: nil, cancelButtonTitle: "OK").show()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
