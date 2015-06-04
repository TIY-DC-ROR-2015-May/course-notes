class GifTag < ActiveRecord::Base
  belongs_to :gifs
  belongs_to :tags
end