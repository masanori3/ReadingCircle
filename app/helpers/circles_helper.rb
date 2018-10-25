module CirclesHelper
  
=begin
  def attend_number(circle)
    a_n = ["オンライン", "オフライン", "どちらも可"]
    attend_circle = a_n[circle.attend.to_i]
    p attend_circle
  end  
=end

  def online_number(circle)
    o_n = ["Skype", "Zoom", "apper.in"]
    online_circle = o_n[circle.online.to_i]
    p online_circle
  end
  
  
  def entry_count(circle)
    e_c = circle.entries.count(:user_id)
    p e_c.to_i
  end
  
  def circle_number(circle)
    c_m = ["30分", "60分", "90分", "120分"]
    circle_minutes = c_m[circle.minutes.to_i]
    p circle_minutes
  end
end
