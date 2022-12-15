class CalcController < ApplicationController
  include CalcHelper
  before_action :validate_input, only: :output

  def input
  end

  def output
    redirect_to home_path unless flash.empty?
    return unless flash.empty?

    @flag = false
    @user_input = params.permit(:num)
    @palindrome = Palindrome.find_by(num: params[:num])
    return @hash = Hash[@palindrome.result.split.zip @palindrome.binaries.split] unless @palindrome.nil?

    @palindrome = Palindrome.new(num: params[:num])
    return unless @palindrome.valid?

    @palindrome.save
    @flag = true
    @hash = Hash[@palindrome.result.split.zip @palindrome.binaries.split]
  end

  def db_check_input
  end

  def db_check_output
    @check_par = params.permit(:check_num)
    @check_palindrome = Palindrome.new(@check_par)
    @check_res = @check_palindrome.check_existing
  end

  def check_data_xml
    render xml: Palindrome.all
  end
end
