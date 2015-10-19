class User < ActiveRecord::Base
  has_many :topics
  has_many :posts
  has_many :comments

  has_attached_file :avatar,
                    :storage => :s3,
                    :styles => {
                      medium: "300x300>",
                      thumb: "100x100>"
                    },
                    #default_url: "/images/:style/missing.png",
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attr_reader :avatar_remote_url

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  #has_attached_file :avatar, styles: {
    #medium: "300x300>",
    #thumb: "100x100>"
  #}, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar_from_url(auth.info.image)
      #user.image = auth.info.image # assuming the user model has an image
    end
  end

  def avatar_from_url(url_value)
    self.avatar = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @avatar_remote_url = url_value
  end

  def s3_credentials
    {
      :bucket => ENV["S3_BUCKET_NAME"],
      :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
      :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
    }
  end
end
