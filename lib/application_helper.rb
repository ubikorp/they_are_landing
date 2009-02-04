module ApplicationHelper  
  def activate_links(text)
    text.gsub(/((https?:\/\/|www\.)([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?)/, '<a href="\1" target="_blank">\1</a>'). \
      gsub(/@(\w+)/, '<a href="http://twitter.com/\1" target="_blank">@\1</a>')
  end

  def profile_link(user_name)
    "<a href=\"http://twitter.com/#{user_name}\" target=\"_blank\">#{user_name}</a>"
  end

  def time_ago_in_words(from)
    distance_of_time_in_words(Time.now, from.to_time)
  end

  def distance_of_time_in_words(to, from)
    seconds_ago = to - from
    minutes_ago = (seconds_ago / 60.to_f).floor
    hours_ago = (minutes_ago / 60.to_f).round
    days_ago = (minutes_ago / 1440.to_f).round
    months_ago = (minutes_ago / 43200.to_f).round
    years_ago = (minutes_ago / 525960.to_f).round

    if minutes_ago <= 0
      "less than a minute"
    elsif minutes_ago == 1
      "roughly a minute"
    elsif minutes_ago < 60
      "#{minutes_ago} minutes"
    elsif minutes_ago < 90
      "roughly an hour"
    elsif minutes_ago < 1440
      "#{hours_ago} hours"
    elsif minutes_ago < 2880
      "roughly a day"
    elsif minutes_ago < 43200
      "#{days_ago} days"
    elsif minutes_ago < 86400
      "roughly a month"
    elsif minutes_ago < 525960
      "#{months_ago} months"
    elsif minutes_ago < 1051920
      "roughly a year"
    else
      "over #{years_ago} years"
    end
  end
end
