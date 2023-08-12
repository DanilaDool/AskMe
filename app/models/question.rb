class Question < ActiveRecord::Base

  belongs_to :user

  validates :text, :user, presence: true

  ['validation', 'save', 'create', 'update', 'destroy'].each do |action|
    ['before', 'after'].each do |time|
      define_method("#{time}_#{action}") do
        puts "****>#{time} #{action}"
    end
  end
end

end
