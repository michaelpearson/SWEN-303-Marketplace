module ApplicationHelper
  WORDS =
  ["Pop-up","keytar","freegan,","photo","booth","twee","wolf","ennui","hoodie","flannel.","Wolf","drinking","vinegar","messenger","bag,","master","cleanse","sartorial","tumblr","fap","man","bun","austin","8-bit.","Quinoa","lumbersexual","microdosing","biodiesel,","cronut","iPhone","skateboard.","Godard","DIY","yr","cronut","banjo","authentic,","franzen","williamsburg","pop-up","ennui","shabby","chic.","Freegan","PBR&B","YOLO","you","probably","haven\'t","heard","of","them","green","juice.","Distillery","tofu","hashtag","meditation","cronut","you","probably","haven\'t","heard","of","them","banjo","everyday","carry","etsy","tilde.","Four","dollar","toast","paleo","trust","fund,","taxidermy","pork","belly","helvetica","roof","party","brunch","DIY.\n\nHoodie","master","cleanse","try-hard,","kitsch","chambray","cornhole","fap","godard.","Flexitarian","pork","belly","poutine","quinoa","fashion","axe","blue","bottle.","Kitsch","helvetica","keytar,","tofu","food","truck","microdosing","cronut","blue","bottle","8-bit.","Swag","austin","fixie,","church-key","pug","small","batch","meditation","ugh","VHS","neutra","venmo","chillwave","put","a","bird","on","it.","Kinfolk","before","they","sold","out","slow-carb","mixtape","cred","gochujang.","Four","loko","ugh","cliche","mumblecore","knausgaard.","Irony","sartorial","flexitarian,","gentrify","shoreditch","fixie","DIY.\n\nYr","freegan","humblebrag","plaid","3","wolf","moon.","Bicycle","rights","pitchfork","flannel","vice","jean","shorts","tofu,","cray","small","batch","artisan.","Ennui","offal","deep","v","craft","beer,","pitchfork","bushwick","shoreditch.","Cred","twee","polaroid","williamsburg","affogato","fap.","Blog","salvia","mlkshk","post-ironic","semiotics","helvetica","hella","austin,","jean","shorts","offal","banh","mi","franzen.","Swag","tacos","everyday","carry","before","they","sold","out","selfies,","hella","pabst","cardigan.","DIY","dreamcatcher","selfies","chillwave","mixtape.\n\nDreamcatcher","ethical","semiotics,","kombucha","etsy","lumbersexual","church-key","craft","beer","kale","chips","master","cleanse","tattooed","pitchfork","retro","artisan","fashion","axe.","Single-origin","coffee","thundercats","hella","chicharrones,","put","a","bird","on","it","pop-up","gentrify","squid","DIY","man","bun","forage","fap","kitsch","tilde.","Blog","chillwave","90\'s,","gentrify","VHS","intelligentsia","quinoa","mlkshk.","Thundercats","kombucha","hashtag,","vegan","farm-to-table","iPhone","irony","bicycle","rights","etsy","forage","fixie.","Meggings","keytar","tacos","church-key","retro.","Messenger","bag","disrupt","trust","fund","readymade","bitters.","Offal","health","goth","umami,","VHS","listicle","venmo","twee.\n"]
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
