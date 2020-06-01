# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @title = 'ジムの口コミ'
    @description = 'ジムの口コミを調べることができるサイトです'
    @keywords = 'ジム' 'パーソナルトレーニング' '筋トレ'
  end

  def help
    @title = '問い合わせ'
  end

  def about; end
end
