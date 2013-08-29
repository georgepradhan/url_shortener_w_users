class Url < ActiveRecord::Base
  before_validation :normalize!
  before_save :generate_short
  validates :original, format: { with: /(http:\/\/)[a-zA-Z0-9\-\.]+\.(com|org|net|mil|edu|COM|ORG|NET|MIL|EDU)/ , message: "is not a good url" }

  belongs_to :user

  def generate_short
    length = 10
    self.shortened = rand(36**length).to_s(36)
  end

  def normalize!
    unless self.original.start_with?('http://')
      self.original.prepend('http://')
    end
  end

end

