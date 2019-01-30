class Machine < ApplicationRecord
  has_paper_trail #バージョン管理
  validates :name, presence: true, uniqueness: true, length: { maximum: 75 }
  validates :kana, presence: true, uniqueness: true, length: { maximum: 75 }
  validates :manufacturer, presence: true
  validates :archetype, presence: true
  validates :spec, presence: true
end
