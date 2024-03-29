## Git Hidden Folder

There is a hidden folder called `.git` which tells us that the project is a git repo.

If we wanted to create a git repo in a  new project we would create the folder and initialize that repo using `git init`

```sh
mkdir /workspaces/temp/new-project

cd /workspaces/temp/new-project
git init
touch Readme.md
code Readme.md
# make changes to Readme.md
git status
git add .
git commit -a -m "add readme file"
```

## Cloning

Clone a repo in 3 ways: HTTPS, SSH, Github CLI

Since we are using GitHub Codespaces we will create a temporary directory in our workspace

```sh
mkdir /workspaces/temp
cd /workspaces/temp
```

### HTTPS

```sh
git clone https://github.com/SpringerAlac/gitpractice.git
cd gitpractice/
```
If you just clone your repo in the terminal, you will not be able to push to even regular public repos with just username and password (support removed back in 2021). This also assumes that you have implimented no external GitHub support and the ONLY thing you did was https clone a repo.

> You will need to generate a Personal Access Token (PAT) on your setting account

Use PAT as your password
- Set permissions to access commits

The PAT is created on the GitHub website! Go to Developer Settings on your profile.

Then copy it into your environment using 

```sh
export GH_TOKEN="YOUR PAT"
# Use this to confirm your key was copied
env | grep GH_
```

### SSH

```sh
git clone git@github.com:SpringerAlac/gitpractice.git
cd gitpractice/
```
You will need to use git bash to generate a SSH key and save it to your GitHub account!

```sh
ls -al ~/.ssh
```

This command will let you see all ssh keys in your ssh file. This file is used for default SSH key checks.

```sh
ssh-keygen -t rsa -b 4096 -C "sprin023@csusm.edu"
```
Create a key using git-bash and just save it to your ssh folder and you can also set a custom passphrase for it. (just hit enter a bunch of times)

Copy paste the PUBLIC KEY into GitHub in your settings and you are done.

```sh
ssh -T git@github.com
git remote -v
```
Verify the connection is complete using these commands and you should get message that your connection is good but that GitHub does not have shell support (that is fine). 

### GitHub Cli

Need to download the GitHub Cli, just google it and find the repo on GitHub.

```sh
winget install --id GitHub.cli
```
Then we can use the new gh commands in our regular terminals. (this edits your PATH so you need to restart your terminal window)

```sh
gh auth login
gh repo clone SpringerAlac/gitpractice
```

You will go throw a whole prompt that will connect your local repo to the remote repo securely with a couple of options. All work so do whatever.

And that it! Just have to download it an you are good to go. Definitely the easiest of the bunch.

## Commits

When we want to commit our changed code, git commit will open up our changed code and wait for us to add a message.

```sh
git commit
```
Set the global editor
```sh
git config --global core.editor emacs
```

Make a commit and message without using an editor.

```sh
git commit -m "added another exclamation"
```

## Branches
 
List of Branches 
```sh
git branch
```

Create a new branch
```sh
git branch [branch-name]
```

Checkout (Switch between) to a different branch
```sh
git checkout [branch-name]
```

## Remotes

We can add remotes but often the remotes are added via upstream when adding a branch

```sh
git remote add [name]
git branch -u origin new-feature
```

## Stashing

If you have files you are still working on but do not want to push them yet... you can Stash them!

First add the files you want to stash to the staging area.
-> Then you can commit the files you do want to push!

```sh
git add .
git stash
```

You can see how many stashes you have on a stack data structure using
```sh
git stash list
```

It is a stack so you can get the last one you pushed using
```sh
git stash pop
```

or you can use
```sh
git stash apply
```
if you want to use the last one and not pop it off the stash area

You can give that stash a name if you have some sort of ordering that you want
```sh
git stash save [name]
git stash apply
```

Again this will let you keep your files without having to push them and also not wanting to effect those same files on the repo or pushing undone ones.

## Merging

```sh
git checkout dev
git merge main
```

## Add

Add lets you add all changed files to Staging, from there the changes can be committed.

```sh
git add Readme.md
git add .
```

## Status

Git status shows you what files will or will not be committed.

```sh
git status
```

## Reset

Reset allows you to remove staged changes from Staging.
This is nice when you want to correct what files are to be committed.

```sh
git add .
git reset
```

## Gitconfig File

The gitconfig file is that stores your global configurations for git such as email, name, editor, and more.

Showing contents of our .gitconfig file
```sh
git config --list
```
When you first install Git on a machine, you are supposed to set up your name and email
```sh
git config --global user.name "Name"
git config --global user.email "Email"
```

## Log 

Will show recent commits to the git tree, all commits 

## Push 

When we want to push a repo to our remote origin

```sh
git push
```
