namespace :context do
  Dir["#{Rails.root}/config/initializers/**/{object}.rb"].each{ |file| require file }

  desc <<-DESC
Установка окружения проекта
  DESC
  task :setup do
    root = Rails.root
    unless File.exists? "#{root}/config/database.yml"
      app_log 'Установка конфигурации базы данных'
      dbconfig = YAML.load_file("#{root}/config/database.yml.sample")

      # print 'Введите имя пользователя базы данных (<Enter>, если оно root): '
      # username = STDIN.gets.chop
      # print 'Введите имя базы данных: '
      # database = STDIN.gets.chop
      # print "Введите пароль базы данных: "
      # password = STDIN.gets.chop

      # dbconfig['default']['username'] = username unless username.empty?
      # dbconfig['default']['password'] = password

      %w/development test production/.each do |env|
        dbconfig[env].update dbconfig['default']
        dbconfig[env]['database'] = "db/#{env}.sqlite3"
      end
      dbconfig.delete 'default'

      File.open("#{root}/config/database.yml", 'w'){ |f| f.write dbconfig.to_yaml }
    end

    app_log 'Создание базы данных'
    sh 'bundle exec rake db:create'
    app_log 'Создание схемы базы данных'
    sh 'bundle exec rake db:migrate'
    app_log 'Заполнение базы исходными данными'
    sh 'bundle exec rake db:seed'
    app_log 'Установка окружения проекта завершена'
  end

  namespace :setup do
    task :pages do
    end
  end

end