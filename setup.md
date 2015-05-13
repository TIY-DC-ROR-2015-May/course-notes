Because of scheduling conflicts, we won't be having the somewhat traditional first-day-eve install party. I am expecting everyone to show up on Monday with their machines ready to go, though, so here are some notes on getting that set up.

Each section details a specific tool or setting you'll need to configure on your machine. Complete each one in turn, and feel free to reach out (to james@theironyard.com or on Slack) if you have any questions. You will see several snippets like

```
$ echo "Hello, terminal"
```

These indicate command to be typed in to your terminal (whether that be the default Terminal app or iTerm2 or whatever). The `$` signifies a prompt, and should not be typed; your prompt likely looks different.


# OSX Version 10.10

You should be running the most recent version of OSX. It shouldn't be a show-stopper if you're on a slightly older version, but be aware that some things might be slightly different for you if so; if you can upgrade, you should do so.

Click the Apple in the left of the top menu bar, and click "About this Mac". If it says "OSX Yosemite", you're good to go. If not, click on "Software Update..." and follow the instructions.


# Slack

We'll be using [Slack](https://slack.com/) to communicate in class, and you can go ahead and start now. Su should be sending out login information; [contact her](mailto:su@theironyard.com) if you need any help logging in. Once you're on Slack, we'll have a channel set up for our class; feel free to ask for help there.

You should also consider signing up for the [DC Tech Slack team](http://dctechslack.herokuapp.com/) and [Ruby Newbies](http://rubynewbies.org/). If you find other helpful channels, please share!


# iTerm2

This is optional, but most developers seem to prefer iTerm2 over the default provided Terminal application. Install it from [here](https://www.iterm2.com/downloads.html), and open it. I would also recommend pinning it to your toolbar for quick and easy access.


# A Text Editor

[The prework](https://github.com/TIY-DC-ROR-2015-May/course-notes/blob/master/prework.md#install-a-text-editor) has notes about picking an editor. Whichever you choose, be sure you have it installed and that you're comfortable opening and editing files in it.

I'll be presenting with Sublime in class, so would recommend that if you don't have a strong preference. It will be convenient to be able to launch your editor from the terminal; see e.g. [this blog post](http://olivierlacan.com/posts/launch-sublime-text-3-from-the-command-line/) for instructions on setting that up with Sublime.


# Developer Tools / Xcode

We'll need several developer related tools to build various gems. Try

```
$ xcode-select --install
```

You may get a message to the effect of "command line tools are already installed". If not, you should see a popup box with instructions about installing them.


# Brew

Brew is a package manager for OSX that you may use to install other pieces of software on your machine. Install it following the instructions [here](http://brew.sh/).

Once it's installed, you can try it out with

```
$ brew install tree
```

to install the `tree` command.


# Git

Install a recent version of git by typing

```
$ brew install git
```

After it's installed

```
$ git --version
```

should show something like `git version 2.2.1`. Anything above `2.0` is fine.


# Git Configuration

## User Information

Since you'll be using Git to save and share code with others, you'll want to configure git with your contact information

```
$ git config --global user.name 'Your Name'
$ git config --global user.email 'youremail@whatever.com'
```

You can test these by running e.g.

```
$ git config --global user.name
```

to view the configured name or by opening `~/.gitconfig` in your text editor.

## Editor

When you commit a change to git, it will prompt you for a commit message with the default configured editor. This may be something strange and confusing like `nano` or `vi`. You'll want to instead configure git to open files the same way you usually do, using something like

```
$ git config --global core.editor subl
```

provided you are using Sublime and have set up the `subl` command as recommended above.

## SSH Keys

You should already be signed up for [github](https://github.com/) (though do so now if you haven't), so we'll want to identify this machine to Github to make it easier to upload changes in the future.

Follow [Github's instructions on creating and adding an SSH key](https://help.github.com/articles/generating-ssh-keys/). I typically leave the passphrase empty, but you can add one for increased security.


# Rbenv & a Ruby Version

Your system already has a version of Ruby on it, but you can avoid a bunch of headaches in the future by setting up a Ruby version manager now, and using it to run a more recent version. I'll be using [rbenv](http://rbenv.org/) in class. Install it using [this set of instructions](https://github.com/sstephenson/rbenv#basic-github-checkout), and be sure to follow the optional step 5 to install the `ruby-build` plugin.

Once `rbenv` and `ruby-build` are installed, run

```
$ rbenv install 2.2.2
```

to install the most recent (as of this writing) version of Ruby. Once it's done run

```
$ rbenv global 2.2.2
```

to set that version as the global default.


# Gems

You'll need to install several Ruby packages, called gems. Run the following

```
$ gem install bundler
$ gem install pry
```

and then (for reasons that will be explained later), run

```
$ rbenv rehash
```

You can try everything out by running

```
$ pry
```

to start a `pry` session. This is a loop where you can type Ruby code, and it will be evaluated and the result printed out. Try it out for a bit, and then type `exit` (or CTRL+D) when you're done.


# Wrapping Up

If you read this far, you should be all set! Please send me a picture of M&Ms so that I know you read this.
