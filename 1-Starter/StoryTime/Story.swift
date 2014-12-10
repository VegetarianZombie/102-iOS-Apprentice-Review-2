//
//  Story.swift
//  StoryTime
//
//  Created by Brian Moakley on 12/10/14.
//  Copyright (c) 2014 Tammy Coron. All rights reserved.
//

import Foundation
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
        
        if verb != nil {
            storyText = replaceText("<verb>", withText: verb!, inString: storyText)
        }
        if number != nil {
            storyText = replaceText("<number>", withText: String(number!), inString: storyText)
        }
        if name != nil {
            storyText = replaceText("<name>", withText: name!, inString: storyText)
        }
        storyText = replaceText("<monsters>", withText: monsters, inString: storyText)
        
        return storyText
    }
    
    private func replaceText(text: String, withText: String, inString: String) -> String {
        return inString.stringByReplacingOccurrencesOfString(text, withString: withText, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    
}
