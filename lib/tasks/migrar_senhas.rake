#enconding: utf-8
namespace :app do
	desc "Encripta as senhas que ainda nao foram processadas no banco de dados"
	task migrar_senhas: :environment do
		unless User.attribute_names.include? "password"
			puts "As senhas ja foram migradas"
			return
		end

		User.find_each do |user|
			puts "migrando usuario ##{user.id} #{user.full_name}"
			if !user.valid? || user.attributes["password"].blank?
				puts "usuario id #{user.id} invalido"
				puts "corrijir manualmente\n"
				next
			end

			unencripted_password = user.attributes["password"]

			user.password = unencripted_password
			user.password_confirmation = unencripted_password
			user.save!
		end
	end
end
