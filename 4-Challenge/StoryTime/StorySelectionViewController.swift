//
//  StorySelectionViewController.swift
//  StoryTime
//
//  Created by Brian Moakley on 11/25/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

import UIKit

class StorySelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var zombieStories: [Story]!
    var vampireStories: [Story]!
  
    @IBAction func close(segue: UIStoryboardSegue) {
        let newStoryViewController = segue.sourceViewController as NewStoryViewController
        if let story = newStoryViewController.newStory {
            if newStoryViewController.isEditing == false {
                if story.type == .zombies {
                    zombieStories.append(story)
                } else {
                    vampireStories.append(story)
                }
            }
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            if indexPath.section == 0 {
                zombieStories.removeAtIndex(indexPath.row)
            } else {
                vampireStories.removeAtIndex(indexPath.row)
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        var story: Story!
        if indexPath.section == 0 {
            story = zombieStories[indexPath.row]
        } else {
            story = vampireStories[indexPath.row]
        }
        
        performSegueWithIdentifier("NewStory", sender: story)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      zombieStories = []
      vampireStories = []
      title = "Story Time!"
      
      var winStory = "%@ entered the room and saw %d %@! %@ ran down the hall. Sadly, %@ was %@ by all the %@! \n\nPoor %@. Better luck next time!"
      var loseStory = "%@ entered the room and saw %d %@! Without missing a beat, %@ %@ all of the %@! \n\nPoor %@. Fantastic! \n\n%@ will live to fight another day."
      let story = Story(title: "Attack of the Zombies", winStory: winStory, loseStory: loseStory, type: .zombies)
      zombieStories.append(story)
      
      winStory = "%@ entered the room and saw %d %@! %@ ran down the hall. Sadly, %@ was %@ by all the %@! \n\nPoor %@. Better luck next time!"
      loseStory = "%@ entered the room and saw %d %@! Without missing a beat, %@ %@ all of the %@! \n\nPoor %@. Fantastic! \n\n%@ will live to fight another day."
      let anotherStory = Story(title: "Attack of the Vampires", winStory: winStory, loseStory: loseStory, type: .vampires)
      vampireStories.append(anotherStory)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillAppear(animated: Bool) {
    if let indexPath = tableView.indexPathForSelectedRow() {
      tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch(section)
    {
      case 0:
        return zombieStories.count
      case 1:
        return vampireStories.count
      default:
        return 0
    }
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
    var story = zombieStories[indexPath.row]
    if indexPath.section == 1 {
      story = vampireStories[indexPath.row]
    }
    cell.textLabel.text = story.title
    
    return cell
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "Zombie Stories"
    }
    return "Vampire Stories"
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "GenerateStory" {
      if let indexPath = tableView.indexPathForSelectedRow() {
        let storyViewController = segue.destinationViewController as ViewController
        if indexPath.section == 0 {
          storyViewController.currentStory = zombieStories[indexPath.row]
        } else {
          storyViewController.currentStory = vampireStories[indexPath.row]
        }
      }
    }
    if segue.identifier == "NewStory" {
        let newStoryViewController = segue.destinationViewController as NewStoryViewController
        if let story = sender as? Story {
            newStoryViewController.newStory = story
            newStoryViewController.isEditing = true
        }
    }
  }
  

}
