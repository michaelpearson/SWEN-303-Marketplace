class Photo < ApplicationRecord
  has_attached_file :image, 
    styles: { medium:  { geometry: "300x300>"} , thumb: { geometry: "100x100>"} }, 
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :stock
end
