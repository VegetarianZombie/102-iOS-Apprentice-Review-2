//
//  Story.swift
//  StoryTime
//
//  Created by Brian Moakley on 11/25/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

import Foundation

enum StoryType {
  case zombies, vampires
}

class Story
{
  var title : String
  var name : String?
  var verb : String?
  var number : Int?
  var winStory: String
  var loseStory: String
  var type: StoryType
  
  init(title: String, winStory:String, loseStory: String, type: StoryType) {
    self.title = title
    self.winStory = winStory
    self.loseStory = loseStory
    self.type = type
  }
  
  func generateStory(monstersWin: Bool) -> String {
    var storyText = loseStory
    if monstersWin {
      storyText = winStory
    }
    var monsters = "zombies"
    if type == .vampires {
      monsters = "vampires"
    }
    return String(format: storyText, arguments: [name!, number!, monsters, name!, name!, verb!, monsters, name!])
  }
  
  
}
