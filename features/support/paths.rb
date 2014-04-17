# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /^the homepage/ then front_page_path
    when /^the login page/ then login_page_path
    when /^the users index page/ then users_index_path
    when /^the create new user page/ then new_user_path
    when /^the edit user page for "(.*)"/
      begin
        id = User.find_by_name($1).id
        edit_user_path(id)
      end
    when /^the user page for "(.*)"/
      begin
        id = User.find_by_name($1).id
        user_path(id)
      end
    when /^the change password page for "(.*)"/
      begin
        id = User.find_by_name($1).id
        change_password_path(id)
      end
    when /^the dashboard page for "(.*)"$/
      begin
        id = User.find_by_name($1).id
        show_dashboard_path(id)
      end
    when /^the Available Videos View for "(.*)"$/
	begin
	id = User.find_by_name($1).id
	show_dashboard_path(id)
      end

     when /^the Translation Videos View for "(.*)"$/
	begin
	id = User.find_by_name($1).id
	"/users/#{id}/videos/translate"
	end

     when /^the Digitize Videos View for "(.*)"$/
     begin
	id = User.find_by_name($1).id
	"/users/#{id}/videos/digitize"
	end

     when /^the QA Videos View for "(.*)"$/
    begin
	id = User.find_by_name($1).id
	"/users/#{id}/videos/qa"
    end

     when /^the Completed Videos View for "(.*)"$/
    begin
	id = User.find_by_name($1).id
	"/users/#{id}/videos/completed"
    end
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
