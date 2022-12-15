module CalcHelper
	def validate_input
		flash[:warning] = 'Заполните поле ввода' if params[:num] == ''
    	user_input = params[:num].to_i
    	flash[:notice] = 'Введите число от 1 до 1.000.000' if user_input.to_i < 1 || user_input.to_i > 1_000_000
	end

	def does_exist(value)
		obj = Palindrome.find_by(num: value)
		norm_num = obj[:result].split.map(&:to_i)
		binary = obj[:binaries].split.map(&:to_i)
		Hash[norm_num.zip binary]
	end
end
