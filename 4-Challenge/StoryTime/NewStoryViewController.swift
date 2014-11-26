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
    var isEditing = false
    
    @IBAction func save(sender: AnyObject) {
        if storyTitle.text != "" && winningStory.text != "" && losingStory != "" {
            var storyType: StoryType!
            if monsterType.selectedSegmentIndex == 0 {
                storyType = StoryType.zombies
            } else {
                storyType = StoryType.vampires
            }
            if isEditing {
                newStory?.title = storyTitle.text
                newStory?.winStory = winningStory.text
                newStory?.loseStory = losingStory.text
                newStory?.type = storyType
            } else {
                newStory = Story(title: storyTitle.text, winStory: winningStory.text, loseStory: losingStory.text, type: storyType)
            }

            performSegueWithIdentifier("SaveStory", sender: nil)
        } else {
            UIAlertView(title: "Validation Error", message: "Please fill out all of the fields.", delegate: nil, cancelButtonTitle: "OK").show()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEditing {
            storyTitle.text = newStory?.title
            winningStory.text = newStory?.winStory
            losingStory.text = newStory?.loseStory
            if newStory?.type == StoryType.zombies {
                monsterType.selectedSegmentIndex = 0
            } else {
                monsterType.selectedSegmentIndex = 1
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
