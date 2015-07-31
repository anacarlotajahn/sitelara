class Contact
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :email, :message

  validates :name, :email, :message, presence: true

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
                      message: I18n.t('errors.messages.invalid')

  validates :name, length: { maximum: 70 }
  validates :email, length: { maximum: 40 }
  validates :message, length: { maximum: 1000 }

   def self.attributes
     @attributes
   end

   def initialize(attributes={})
     attributes && attributes.each do |name, value|
       send("#{name}=", value) if respond_to? name.to_sym
     end
   end

  def persisted?
    false
  end

  def self.inspect
    "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
  end
end