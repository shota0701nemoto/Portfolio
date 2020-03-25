class StaticPagesController < ApplicationController

  def home
    @title = "ジムの口コミ"
    @description = "ジムの口コミを調べることができるサイトです"
    @keywords = "ジム" "パーソナルトレーニング" "筋トレ"
  end

  def help
  end

  def about
  end

  def contact
      @title = "問い合わせ"
  end
end
