class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :title, type: String
  slug :title, history: true
  field :body, type: String
  field :date, type: Date

  index({ date: 1 })

  def day
    Day.find_or_create_by(date: date)
  end
end
