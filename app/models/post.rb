class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)  }
    validate :validator?
    # include ActiveModel::Validations
    # validates_with TitleValidator

    def validator?
        unless !title.nil? && title.match?(/Won't Believe/ || /Secret/ || /Top \d+/ || /Guess/)
            errors[:title] << "Need clickbait"
        end
end

end
