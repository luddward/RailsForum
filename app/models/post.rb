class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments

  #
  def self.get_total_number_of_posts (category_id)
    i = 0
    @posts = Post.all.where('category_id' => category_id)

    @posts.each do |post|
      i += 1

      post.comments.each do
        i += 1
      end
    end
    return i
  end

end
