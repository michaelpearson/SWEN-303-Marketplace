class SendPush

  GOOGLE_GMS_LINK = 'https://android.googleapis.com/gcm/send'

  def initialize(member_id)
    @user = User.find_by(id: member_id)
  end

  def call
    return if @user.notification_settings.empty?
    @url = @user.notification_settings.last.url

    authentication = @url.sub("#{GOOGLE_GMS_LINK}/", '');
    post_data = {
        :registration_ids => [authentication]
    }

    key = ENV['API_KEY']
    if key.nil?
      key = File.read("#{Rails.root.to_s}/config/apikey");
    end

    http = Curl.post(GOOGLE_GMS_LINK, post_data.to_json) do |http|

      http.headers['authorization'] = "key=#{key}"
      http.headers['Content-Type'] = 'Application/json'
    end
    puts("Endpoint: #{GOOGLE_GMS_LINK}")
    puts("Response code #{http.response_code}")
    puts("Data: #{post_data.to_json}")
    puts("Response: #{http.body_str}")

  end
end