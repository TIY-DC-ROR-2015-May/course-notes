class GifTag < ActiveRecord::Base
  belong_to :gifs
  belong_to :tags
end