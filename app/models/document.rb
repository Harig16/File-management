class Document < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  validates_presence_of :title, :description
end
