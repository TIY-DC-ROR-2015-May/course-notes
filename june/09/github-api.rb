require 'httparty'

class GithubAPI
  Token = File.read "./token"

  include HTTParty
  base_uri 'https://api.github.com'

  def initialize
    @headers = { "Authorization" => "token #{Token}", "User-Agent" => "Wandows Explorer" }
  end

  def class_org
    "TIY-DC-RoR-2015-May"
  end

  def org_members org_name=nil
    # unless org_name
    #   org_name = class_org
    # end
    org_name ||= class_org
    # self.class.get ...
    GithubAPI.get("/orgs/#{org_name}/members", headers: @headers)
  end

  def repos user=nil
    user ||= "jamesdabbs"
    # GET /users/jamesdabbs/repos
    GithubAPI.get("/users/#{user}/repos", headers: @headers)
  end
end

require "pry"
binding.pry