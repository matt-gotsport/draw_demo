class DrawHistory < ApplicationRecord
  belongs_to :draw
  belongs_to :group_team 
end
