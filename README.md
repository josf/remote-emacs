# What this is

More and more often, I seem to need to setup  Emacs environments on remote servers. The reasons vary, but Clojure is often the reason, because I need a REPL on a remote box, and I just want to have all my stuff: paredit, ivy/swiper, magit... things like that.

This is also simpler than my primary Emacs install because there are lots of things I don't need on a remote box, like email and org-mode.

This setup requires Cask, which makes the initial setup a little more involved. I think it is worth it.

# Install

## Dependencies

`magit` and `clj-refactor` require Emacs version 24.4 or later. These are now commented out of the `Cask` file. If you have 24.4 or later, you can uncomment and use.

## The files

Clone this repo into ~/.emacs.d. 

This means you need to specify the target directory in the call to `git clone`, like this:

    git clone https://github.com/josf/remote-emacs.git ~/.emacs.d
	
Note that for this to work, `~/.emacs.d` must be empty or not exist.	

## Cask

Create `~/.cask` directory

Clone the Cask repo into `~/.cask`

    ~$ git clone  https://github.com/cask/cask.git .cask

Add .cask/bin to $PATH in .bash_profile

    export PATH="$HOME/.cask/bin:$PATH" 

Bootstrap: `cask upgrade-cask`

Run `cask`: 

    cd ~/.emacs.d 
	cask
	
Everything should work.	

