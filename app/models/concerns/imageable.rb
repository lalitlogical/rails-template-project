module Imageable
  extend ActiveSupport::Concern

  included do
    has_attached_file :icon,
      styles:          { thumb:  '120x120>',            medium: '300x300>'           },
      convert_options: { thumb:  '-quality 75 -strip',  medium: '-quality 90 -strip' }

    validates_attachment_presence     :icon
    validates_attachment_size         :icon, less_than: 4.megabytes, :message => 'must be less than 4 MB.'
    validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  end

  def icons
    { original: icon, medium: icon(:medium), thumb: icon(:thumb) }
  end
end
