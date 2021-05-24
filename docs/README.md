## The Challenge

The challenge is to create a "high-score feature"This feature should contain the result data of Players within the data of Competition Cats, as well as the results of 10 "computer" opponents that have gone through the Competition Cats games by way of automation Creating this data could be a challenge considering the restrictions of this system - particularly the way data persists. 

Here is a brief overview of how data is stored...

## Description of Save

Current instances of user is created through User initialize, expecting strings named email, password. 
Password is run through the encryption module method encrypt.
The user data is persisted by User class method save, writing "@email, @encryped_password" each separated by line.

Class Player initializes with the expectation of User object, pawz=400, tokens=5, wins=0, losses=0, competition_wins=0, cat=nil.
Cats are critical Class Cat objects expected to be Player.cat values.
While Cats can be instantiated through objects, there is persisted 'template' data by means of Cat.load method.
Player.select_cat method calls Cat self.load, which instantiates several cats into a class variable @cats.
Player.select_cat method requires parameter 'email'. This email value is checked to see if file exists (File.file?("./data/#{email}_cat")).
If file can be found, file's line is read into an instantiation of Cat with according parsed data.
If file cannot be found, player is given the option to select an instantiated Cat object from the array @cats.

After the process of Player.select_cat finishes, Player.save is expected to run. Player.save expects player instance as parameter. The expected output is two one-line files in data dir: one file named with "player.user.email" containing Player object data as string, the other "player.user.email_cat" contains Cat object data.

## Potential Solution

- Restructuring the files, placing player data files into one folder
- Iteration of dummy (perhaps a multidimensional list) for the parameters of email and password for n-number of users initialized through User.new to replace Line 58 of app.rb: @session['login'] = User.login(email, password). 
- 10 users split and grouped into pairs, 5 pairs returned into a new array - through means of something like .map
- select_cat called on each session hash, select_cat re-written to create assignment of new Cat object to player.
- Resulting users array groups set in iterative process between @session['profile'], and @session['profile2'] hash within app.rb
- Paw fight game ran with dummy profiles.. several times. Player info is saved as games play.
- Iterative process changes @session['profile'] @session['profile2'] with pairs, until 5 pairs have been completed.
- Now that player data is stored in a separate folder (i.e. ./data/players/emailfile) we will iterate over _all_ persisted data set through Dir[./data/players/emailfile].each method.
- Data is parsed so that wins and losses, other critical information is extracted and returned as an array for each player/emailfiles.
- Returned arrays of players should have information parsed at particular indexes. The collection of arrays can be organized and processed, at index numbers of value, by a [yet to be determined method](https://mixandgo.com/learn/ruby-sort-and-sort-by) and returned.
