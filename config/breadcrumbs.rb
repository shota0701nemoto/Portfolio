crumb :root do
  link "ホーム", root_path
end

# gym一覧ページヘのパンくずリスト
crumb :gyms do
  link "ジム一覧", gyms_path
  parent :root
end

crumb :gym do |gym|
  link gym.name, gym_path(gym)
  parent :gyms
end

#gymの新規作成ページのパンくずリスト
crumb :new_gym do
  link "新規作成", new_gym_path
  parent :gyms
end


# blog一覧ページヘのパンくずリスト
crumb :blogs do
  link "投稿一覧", blogs_path
  parent :root
end

crumb :blog do |blog|
  link blog.title, blog_path(blog)
  parent :blogs
end

#問い合わせページのパンくずリスト
crumb :static_pages do
  link "問い合わせ", help_path
  parent :root
end

#userの編集ページのパンくずリスト
crumb :edit_user do
  link "プロフィールの編集", edit_user_path
  parent :root
end

#blogの新規作成ページのパンくずリスト
crumb :new_blog do
  link "新規作成", new_blog_path
  parent :blogs
end

#blogのeditページのパンくずリスト
crumb :edit_blog do
  link "コラムの編集", edit_blog_path
  parent :blogs
end

