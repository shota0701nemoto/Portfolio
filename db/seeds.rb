# メインのサンプルユーザーを1人作成する
User.create!(name:  "AdminUser",
             email: "Admin@Admin.com",
    password:              "Admin",
    password_confirmation: "Admin",
    admin: true)

