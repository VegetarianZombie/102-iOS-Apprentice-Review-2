#iOS Apprentice Review 2 Part 4: Challenge Instructions#
##Viva la Challenge!##So you actually thought you were done with the StoryTime app, eh? The following document contains not one, but three challenges! 
Chances are, you will not be able to finish before the closing bell, but that doesn’t mean you have to actually stop working on the challenge. Bring it home with you, find a quiet corner, and keep hammering away.
If you are still catching up from the demo or lab, then by all means, keep working on it and return to the challenge when you are all caught up
###Challenge 1: Bring Back the Aliens!###If you’ve been following along since the first session, you’ll remember that there were Aliens and now there is not. Update the app so that there is now alien stories to choose from. Make sure to include your own alien story.
To make this possible, you will have to update your model and your view controllers, as well as all your views. This may take a little bit of time and you will notice yourself repeating things which takes us to the next challenge.
###Challenge 2: Refactor, Refactor, Refactor!###Currently, the app is using individual arrays for each type of story. Your challenge is to refactor the app to use one array. This array will contain three arrays: one for the zombies, one for the vampires, and one for the aliens.
You can define the array like so:    stories = [Array<Story>]()You will still need create arrays to store the zombie, vampire, and alien stories, but instead of storing them in instance variables, you will store them in the stories array.This means that the array is holding an array of arrys. When accessing the array in the tableView, you can use the following code:
    stories[indexPath.section][indexPath.row]
You should be able to access the individual stories by using sections and rows.To make things easier, you should change the StoryType enum to hold a value. Here’s the code:    enum StoryType: Int {        case zombies = 0, vampires, aliens    }
By having the StoryType hold a value, you can access parts of the array by the raw value of the StoryType like so:
    stories[story.type.rawValue]
Good luck!
###Challenge 3: Never Stop Learning###
The final challenge is a life long one. Never be content with your skillset. Keep pushing yourself to learn and understand. Technology moves fast and you want to keep moving with it. By keeping your tools sharp and well maintained, you’ll be well prepared to capitalize on any whatever new tech the future brings. 