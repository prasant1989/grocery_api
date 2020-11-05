class ApplicationRecord < ActiveRecord::Base
  UNIT_TYPES = ['KG', 'LTR', 'UNIT','ML', 'GM']
  self.abstract_class = true
end
