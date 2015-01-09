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
    var zombieStories: NSMutableArray!
    var vampireStories: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      zombieStories = NSMutableArray()
      vampireStories = NSMutableArray()
      title = "Story Time!"
      
      var winStory = "<name> entered the room and saw <number> <monsters>! <name> ran down the hall. Sadly, <name> was <verb> by all the <monsters>! \n\nPoor <name>. Better luck next time!"
      var loseStory = "<name> entered the room and saw <number> <monsters>! Without missing a beat, <name> <verb> all of the <monsters>! \n\nPoor <monsters>. Fantastic! \n\n<name> will live to fight another day."
      let story = Story(title: "Attack of the Zombies", winStory: winStory, loseStory: loseStory, type: .zombies)
      zombieStories.addObject(story)
      
        winStory = "<name> entered the room and saw <number> <monsters>! <name> ran down the hall. Sadly, <name> was <verb> by all the <monsters>! \n\nPoor <name>. Better luck next time!"
        loseStory = "<name> entered the room and saw <number> <monsters>! Without missing a beat, <name> <verb> all of the <monsters>! \n\nPoor <monsters>. Fantastic! \n\n<name> will live to fight another day."
      let anotherStory = Story(title: "Attack of the Vampires", winStory: winStory, loseStory: loseStory, type: .vampires)
      vampireStories.addObject(anotherStory)
      
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
    let cell = tableView.dequeueReusableCellWithIdentifier("StoryTimeCell", forIndexPath: indexPath) as UITableViewCell
    var story: Story!
    if indexPath.section == 0 {
        story = zombieStories[indexPath.row] as Story
    } else {
        story = vampireStories[indexPath.row] as Story
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
          storyViewController.currentStory = zombieStories[indexPath.row] as? Story
        } else {
          storyViewController.currentStory = vampireStories[indexPath.row] as? Story
        }
      }
    }
  }
  

}
