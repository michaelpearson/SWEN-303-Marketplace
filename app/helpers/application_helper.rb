module ApplicationHelper
  WORDS =
  ["Pop-up","keytar","freegan","photo","booth","wolf","ennui","hoodie","flannel","Wolf","vinegar","messenger","bag","master","cleanse","sartorial","tumblr","man","bun","austin","8-bit","Quinoa","microdosing","biodiesel","cronut","iPhone","skateboard","Godard","DIY","cronut","banjo","pop-up","ennui","shabby","Freegan","PBR&B","YOLO","you","juice","Distillery","tofu","hashtag","meditation","cronut","banjo","etsy","tilde","toast","paleo","taxidermy","pork","belly","helvetica","roof","party","brunch","DIY Hoodie","master","kitsch","chambray","cornhole","Flexitarian","pork","belly","poutine","quinoa","fashion","axe","bottle","Kitsch","keytar","tofu","food","truck","microdosing","cronut","bottle","8-bit","Swag","church-key","pug","batch","meditation","VHS","mixtape","cred","gochujang","mumblecore","Irony","humblebrag","plaid","Bicycle","rights","pitchfork","flannel","vice","jean","shorts","tofu","cray","deep v","craft","beer","pitchfork","bushwick","shoreditch","Cred","polaroid","affogato","Blog","salvia","mlkshk","jean shorts","offal","Swag","tacos","selfies","cardigan","dreamcatcher","selfies","chillwave","etsy","church-key","craft","beer","kale","chips","pitchfork","retro artisan fashion","axe","Single-origin coffee","thundercats","squid","man bun","Blog","VHS","quinoa","mlkshk","Thundercats","kombucha","hashtag","vegan","farm-to-table iPhone","bicycle","rights","etsy","Meggings","keytar","tacos","church-key","retro","Messenger","bag","trust","bitters","Offal","health","goth","VHS","listicle"]
  RAFFLER_DELAY = 1000
  def logged_in?
    session[:user_id] != nil
  end

  def require_logged_in
    redirect_to login_path(next_url: url_for(action: params[:action], controller: params[:controller])) unless logged_in?
  end

  def options_for_stock_category(selected = "All")
    Stock.categories.inject("<option>All</option>") do |options, category|
      selected_html = selected == category ? " selected=\"#{category}\"" : ""
      "#{options} <option#{selected_html}>#{category}</option>"
    end.html_safe
  end
end
