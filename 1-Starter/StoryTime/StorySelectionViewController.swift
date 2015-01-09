//
//  StorySelectionViewController.swift
//  StoryTime
//
//  Created by Brian Moakley on 12/10/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

import UIKit

class StorySelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var zombieStories: NSMutableArray!
    var vampireStories: NSMutableArray!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        zombieStories = NSMutableArray()
        vampireStories = NSMutableArray()
        
        var zombieWinStory = "<name> entered the room and saw <number> <monsters>! <name> ran down the hall. Sadly, <name> was <verb> by all the <monsters>! \n\nPoor <name>. Better luck next time!"
        var zombieLoseStory = "<name> entered the room and saw <number> <monsters>! Without missing a beat, <name> <verb> all of the <monsters>! \n\nPoor <monsters>. Fantastic! \n\n<name> will live to fight another day."
        var vampireWinStory = "<name> entered the room and saw <number> <monsters>! <name> ran down the hall. Sadly, <name> was <verb> by all the <monsters>! \n\nPoor <name>. Better luck next time!"
        var vampireLoseStory = "<name> entered the room and saw <number> <monsters>! Without missing a beat, <name> <verb> all of the <monsters>! \n\nPoor <monsters>. Fantastic! \n\n<name> will live to fight another day."
        
        let zombieStory = Story(title: "Attack of the Zombies", winStory: zombieWinStory, loseStory: zombieLoseStory, type: StoryType.zombies)
        let vampireStory = Story(title: "Attack of the Vampires!", winStory: vampireWinStory, loseStory: vampireLoseStory, type: StoryType.vampires)
        
        zombieStories.addObject(zombieStory)
        vampireStories.addObject(vampireStory)
        
        title = "Story Time!"
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
        case 0:
            return zombieStories.count
        case 1:
            return vampireStories.count
        default:
            return 0;
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Zombie Stories"
        } else {
            return "Vampire Stories"
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
