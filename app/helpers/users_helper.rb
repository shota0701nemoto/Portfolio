# frozen_string_literal: true

module UsersHelper
  # 渡されたユーザーのGravatar画像を返す
  def gravatar_for(user, options = { size: 80 })
    size         = options[:size]
    gravatar_id  = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def sign_in_as(user)
    post login_path, params: { session: { email: user.email, password: user.password } }
  end
end
