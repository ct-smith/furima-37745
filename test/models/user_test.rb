require 'test_helper'

class UserTest < ActiveSupport::TestCase

  validates :nick_name, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true

end
