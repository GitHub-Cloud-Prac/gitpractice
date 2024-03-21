## List of Features
https://github.com/devcontainers/features


https://github.com/octokit?language=ruby#org-profile-repositories

Using these links we can first find the devcontainer code for adding Terraform or any language we want in CodeSpaces. 

Then we find the corresponding SDK that is maintained by GitHub using the 2nd link. 

### Terraform

```sh
terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.2.0"
    }
  }
}

provider "github" {
  # Configuration options
}

resource "github_branch" "development" {
  repository = "gitpractice"
  branch     = "sdks"
}
```
Copy this code into a main.tf and it will let you create branches! 

https://registry.terraform.io/providers/integrations/github/6.2.0

This goes to Hashicorp's registry for GitHub and from there you can find all the code for all the different GitHub features that you can use in Terraform. Our example creates a branch for the gitpractice repo.

```sh
terraform init
terraform plan
terraform apply
```

This should be all that is needed for terraform in codespaces. 

For other places you will probably need to authenticate with an access token for other environments or find a way for it to allow you to use terraform. There is help on the same link from earlier. (Everything for GitHub with Terraform is there)

(This will also create alot of terraform files so you might wanna .gitignore them and you can find the .gitignore code online)

```sh
terraform destroy 
```

Then you can destroy anything you terraformed with this command. 

### Ruby

To get started with Ruby you need to create a Gem File.

```sh
bundle init
```

```sh
# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"

gem 'octokit'
gem 'faraday-retry'
```
Add the octokit and faraday-retry gems (no idea what gems are right now but the names are cool)

Then install the gems.

```sh
bundle install
```

Oh my gosh it was kind of a pain to get Ruby going. 

https://github.com/octokit

Here is the link to the Ruby SDK.

These SDKs use APIs to set up/modify your GitHub Repo in this case. 

APIs are like bridges between applications where one request info and the other gives you that info. Big focus on the communication between Applications using HTTP methods.

SDKs are like toolboxes where the tools are made of APIs. The APIs and all their methods and HTTP requests are abstracted away to these nice small line of code that do everything you need. 

So here we want to create a branch for our GitHub repo from the Ruby SDK instead of the GitHub website.

```sh
require 'octokit'
client = Octokit::Client.new(access_token: ENV['GH_TOKEN'])

client.create_ref(
    "repo", 
    "heads/newbranchname", 
    "lastest commit sha"
)
```
You will have to create a personal access token (PAT) again and put it where you see GH_TOKEN.

Ways to authenticate Ruby are on the octokit link at the top.

After putting this code into a .rb file (you can call it whatever you want, here we used main). Then we can execute it.

```sh
bundle exec ruby main.rb
```

Everything should be good after that, finding I needed that was the worst part.

Ruby doesn't make a lot of files so you don't need to make a .gitignore but if you want to you can.