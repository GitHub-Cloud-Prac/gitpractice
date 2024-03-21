require 'octokit'
client = Octokit::Client.new(access_token: ENV['GH_TOKEN'])

client.create_ref(
    "SpringerAlac/gitpractice", 
    "heads/sdks", 
    "d57ca68bab6be98491c254308cd1e2834faa8adf"
)