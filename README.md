# NikeTakeHome
Nike take home project

iOS Code Sample:

Create a sample iPhone app that displays the top 100 albums across all genres using Apple’s RSS generator found here: https://rss.itunes.apple.com/en-us .

The app should: use Auto Layout NOT use storyboards or nibs NOT use any third party libraries NOT use force unwrapping in your code or show signs of forced unwrapping your code. Any sign of force unwrapping may automatically disqualify you for consideration.

Expected behavior: On launch, the user should see a UITableView showing one album per cell. Each cell should display the name of the album, the artist, and the album art (thumbnail image). Tapping on a cell should push another view controller onto the navigation stack where we see a larger image at the top of the screen and the same information that was shown on the cell, plus genre, release date, and copyright info below the image. A button should also be included on this second view that when tapped fast app switches to the album page in the iTunes store. The button should be centered horizontally and pinned 20 points from the bottom of the view and 20 points from the leading and trailing edges of the view. Unlike the first one, this “detail” view controller should NOT use a UITableView for layout.

Provide your application via a link to a public Git repo (GitHub, Gitorious, etc). and send the project and send back to be reviewed by engineers and may be used for discussion topics in future interviews. Thank you for taking the time to do this.

Manager’s Notes: “In general, we look for solid Swift fundamentals, like no force unwrapped or implicitly unwrapped optionals (using exclamation points), proper threading use, good architecture around parsing the API response into model objects to populate the UI and using modern Swift patterns vs. old objective-c patterns converted to Swift.”

Frequently Asked Questions and Answers:

What should be the results limit on the RSS Feed generator? 10, 100, or somewhere in between? Up to you. 100 is fine.
The button on the detail view controller should be "horizontally centered". Given that the button also must be 20 points from the bottom, do you mean that it should be vertically centered? No. It should be horizontally centered between the left and right edges. 20 points from the bottom specifies its vertical positioning.
Can the app stay in portrait mode or should it also rotate to landscape mode? This doesn't matter for the table view controller, but it may matter for the detail view controller. Up to you. Landscape is not required.
