require 'httparty'

class GithubAPI
  Token = File.read "./token"

  include HTTParty
  base_uri 'https://api.github.com'

  default_options[:headers] = {
    "Authorization" => "token #{Token}",
    "User-Agent"    => "Wandows Explrer"
  }

  def initialize
    #@headers = { "Authorization" => "token #{Token}", "User-Agent" => "Wandows Explorer" }
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
    GithubAPI.get("/orgs/#{org_name}/members")
  end

  def repos page=nil, user=nil
    page ||= 1
    user ||= "jamesdabbs"
    # GET /users/jamesdabbs/repos
    GithubAPI.get("/users/#{user}/repos", query: { page: page, per_page: 50 })
  end

  def me
    GithubAPI.get("/user")
  end
end

require "pry"
binding.pry