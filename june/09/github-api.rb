require 'httparty'

class GithubAPI
  include HTTParty
  base_uri 'https://api.github.com'

  def class_org
    "TIY-DC-RoR-2015-May"
  end

  def org_members org_name=nil
    # unless org_name
    #   org_name = class_org
    # end
    org_name ||= class_org
    GithubAPI.get("/orgs/#{org_name}/members")
  end
end

require "pry"
binding.pry