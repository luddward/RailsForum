class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :title, length: {minimum: 5,
            message: 'Title needs to be longer than 5 characters' }

  validates :content, length: {minimum: 10 ,
            message: 'You need more than 10 characters in the content'}

  validates :category, presence: true

  # validates_associated :comments

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
