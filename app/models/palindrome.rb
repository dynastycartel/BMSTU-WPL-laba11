class Palindrome < ApplicationRecord
	include ActiveModel::Serializers::Xml
	include CalcHelper

	attr_accessor :check_num

	validates :num, presence: { message: 'cannot be empty' }
	validates_numericality_of :num, only_integer: true, greater_than_or_equal_to: 1
	before_save :result_into_bd
	self.primary_key = :num

	def result_into_bd
		number = num.to_i
		arr = (1..number).select do |i|
			i.to_s == i.to_s.reverse && i.to_s(2) == i.to_s(2).reverse
		end
		self.result = Array(arr).join(' ')
		self.binaries = Array(arr).map { |elem| elem.to_s(2) }
	end

	def check_existing
		check_val = check_num
		if Palindrome.find_by(num: check_val).nil?
			nil
		else
			does_exist(check_val)
		end
	end
end
