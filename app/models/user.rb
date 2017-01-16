class User < ActiveRecord::Base
  has_secure_password

  def initialize(params={})
    file = params.delete(:file)
    super
    if file
      self.filename = sanitize_filename(file.original_filename)
      #self.contenttype = file.contenttype
      self.filecontents = file.read
    end
  end

  def admin?
    self.role == 'admin'
  end

  private

    def sanitize_filename(filename)
      return File.basename(filename)
    end
end
