# Provides navigation helpers for cucumber scenarios
module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    else
      page_name_path(page_name)
    end
  end

  private

  def page_name_path(page_name)
    page_name =~ /the (.*) page/
    path_components = Regexp.last_match(1).split(/\s+/)
    send(path_components.push('path').join('_').to_sym)
  rescue
    raise "Can't find mapping from \"#{page_name}\" to a path.\n" \
      "Now, go and add a mapping in #{__FILE__}"
  end
end

World(NavigationHelpers)
