# Pre-work - *Tipperwu*

**Tipperwu** is a tip calculator application for iOS.

Submitted by: **Judy Wu**

Time spent: **14** hours spent in total

## User Stories

The following **required** functionality is complete:

* [Y] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [Y] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [Y] UI animations - total and tip values flash if the values change
* [Y] Remembering the bill amount across app restarts (if <10mins)
* [Y] Using locale-specific currency and currency thousands separators.
* [Y] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [Y] List anything else that you can get done to improve the app functionality!
1. Theme changes colors based on settings
2. Tip values can be rounded up to the nearest integer and total recalculated
3. Total values can be rounded up to the nearest integer and tip recalculated

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/jpie0510/Tipperwu/blob/master/Tipperwu%20Part%201.gif' title='Video Walkthrough part 1' width='' alt='Video Walkthrough' />

<img src='https://github.com/jpie0510/Tipperwu/blob/master/Tipperwu%20Part%202.gif' title='Video Walkthrough part 1' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** [Enter your answer here in a paragraph or two].

Coming from a product manager who's a little rusty on coding, the iOS app development platform's UI first approach makes testing UI layouts and creating new features relatively quick. There are some parts that reduce the code down to 1 or 2 lines. Although half the time, it turned out that when something wasn't working, it was because of an errant click that enabled/disabled something random. 

Outlets are a way to send information or make changes to or from an object with the application. Actions are a way to notify the application that some event has happend to the object and the application may need to do something.


Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** [Enter your answer here in a paragraph or two].

Swift keeps an instance of a class in memory only so long as no strong references exist to it. In Swift, every instance of a class, let's call it Thing 1, may have some aspect that has a relationship with some aspect (property, variable, or constant) of another instance of a class, let's call it Thing 2, - whether the same class or different class. Thing 1 may consider that the relationship between it and Thing 2 is strong, which is referred to as a strong reference. Since Thing 2 has a strong reference to it from Thing 1, Swift thinks it's still needed and doesn't free up the memory. If Thing 2 also considers that relationship between it and Thing 1 is strong, then Thing 1 also has a strong reference to it and so Swift thinks it should also stay around. This circular reference can only be broken if one of the Things changes the type of the reference to be not strong.



## License

    Copyright [2017] [Judy Wu]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
