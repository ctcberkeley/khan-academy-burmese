# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:name => 'User1 Lastname', :email => 'user1@example.com', :password => 'password'},
         {:name => 'User2', :email => 'user2@example.com', :password => 'password'},
         {:name => 'User3', :email => 'user3@example.com', :password => 'password'},
         {:name => 'User4', :email => 'user4@example.com', :password => 'password'},
         {:name => 'User5', :email => 'user5@example.com', :password => 'password'},
         {:name => 'User6', :email => 'user6@example.com', :password => 'password'},
         {:name => 'User7', :email => 'user7@example.com', :password => 'password'},
         {:name => 'User8', :email => 'user8@example.com', :password => 'password'},
         {:name => 'User9', :email => 'user9@example.com', :password => 'password'},
         {:name => 'User10', :email => 'user10@example.com', :password => 'password'},
         {:name => 'User11', :email => 'user11@example.com', :password => 'password'},
         {:name => 'User12', :email => 'user12@example.com', :password => 'password'},
         {:name => 'User13', :email => 'user13@example.com', :password => 'password'},
         {:name => 'User14', :email => 'user14@example.com', :password => 'password'},
         {:name => 'User15', :email => 'user15@example.com', :password => 'password'},
         {:name => 'User16', :email => 'user16@example.com', :password => 'password'},
         {:name => 'User17', :email => 'user17@example.com', :password => 'password'},
         {:name => 'User18', :email => 'user18@example.com', :password => 'password'},
         {:name => 'User19', :email => 'user19@example.com', :password => 'password'},
         {:name => 'User20', :email => 'user20@example.com', :password => 'password'},
     ]

videos = [{:video_id => 'JT5D9T2hA4rf', :subject => 'Math', :course => 'Algebra', :title => 'Origins of Algebra', :translator_id => nil,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'false', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'KoqllJtEzvFV', :subject => 'Math', :course => 'Geometry', :title => 'The Golden Ratio', :translator_id => 1,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'MRXmJSNXLSnq', :subject => 'Math', :course => 'Calculus', :title => 'Introduction to Limits', :translator_id => 1,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => '0eUGziFaWJSY', :subject => 'Math', :course => 'Linear Algebra', :title => 'Adding Vectors', :translator_id => 1,
            :typer_id => 1, :qa_id => 1, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'sikgboC16ZKp', :subject => 'Math', :course => 'Applied Math', :title => 'The One-time Pad', :translator_id => nil,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'false', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'lB8U9ejUvqL0', :subject => 'Science', :course => 'Biology', :title => 'Parts of a Cell', :translator_id => nil,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'false', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => '5diEIkOYPHbg', :subject => 'Science', :course => 'Biology', :title => 'Cancer', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'XmwtdQvslLyq', :subject => 'Science', :course => 'Biology', :title => 'Species', :translator_id => 1,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => '2QSXpBUexZPR', :subject => 'Science', :course => 'Biology', :title => 'Bacteria', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'pZaR4ZvNYN8A', :subject => 'Science', :course => 'Biology', :title => 'Viruses', :translator_id => 1,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'gUn6pHteKmoY', :subject => 'Humanities', :course => 'World History', :title => 'The Great War Begins', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'I4WMBu2FB2Cn', :subject => 'Humanities', :course => 'World History', :title => 'Japan in World War I', :translator_id => 1,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => '4GveyXUOyRFU', :subject => 'Humanities', :course => 'World History', :title => 'Deaths in World War I', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'INV2vf7a412Q', :subject => 'Humanities', :course => 'Art History', :title => 'The Skill of Describing', :translator_id => 1,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => '5qsr3LDgCNvP', :subject => 'Humanities', :course => 'Art History', :title => 'The Classical Orders', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'BCHbGJTDnHll', :subject => 'Humanities', :course => 'Art History', :title => 'Tempera Paint', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'SxmKGu7r6pbV', :subject => 'Humanities', :course => 'Art History', :title => 'Oil Paint', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'QLMNSVCD5Wws', :subject => 'Economics and Finance', :course => 'Microeconomics', :title => 'Elasticity of Supply', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'zVrZtCq91WJG', :subject => 'Economics and Finance', :course => 'Microeconomics', :title => 'Constant Unit Elasticity', :translator_id => 1,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'xT80hv9GCqVH', :subject => 'Economics and Finance', :course => 'Microeconomics', :title => 'Law of Demand', :translator_id => nil,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'false', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'UH8bNG8YuSYM', :subject => 'Economics and Finance', :course => 'Microeconomics', :title => 'Law of Supply', :translator_id => nil,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'false', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'KMXcopzsnYVA', :subject => 'Economics and Finance', :course => 'Microeconomics', :title => 'Market Equilibrium', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'uMKy5LkqWYWD', :subject => 'Math', :course => 'Calculus', :title => 'Derivative as Slop of a Tangent Line', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'uuxCF1e6NUcO', :subject => 'Math', :course => 'Calculus', :title => 'Slope of a Line Secant to a Curve', :translator_id => 1,
            :typer_id => 1, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'true', :type_complete => 'true', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => 'HiQvk0sgz7tu', :subject => 'Math', :course => 'Calculus', :title => 'Minima, Maxima, and Crucial Points', :translator_id => nil,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'false', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"},
          {:video_id => '7IBy3alnIAYn', :subject => 'Math', :course => 'Differential Equations', :title => 'Undetermined Coefficients 1', :translator_id => nil,
            :typer_id => nil, :qa_id => nil, :translate_progress => false, :type_progress => false, :qa_progress => false, :translate_complete => 'false', :type_complete => 'false', :qa_complete => 'false', :due_date => "Jan 29 2014"}

     ]

users.each do |user|
  User.create(user)
end

admin = User.create({:name => 'admin', :email => 'admin@example.com', :password => 'password'})
admin.toggle!(:admin)

videos.each do |video|
  Video.create(video)
end
