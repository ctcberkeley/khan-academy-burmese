FactoryGirl.define do 
  factory :video do
    sequence(:video_id) { |n| "Video #{n}" }
    subject 'Science'
    course 'Python Programming'
    title 'Fun with strings'
    translator_id 1
    typer_id 1
    qa_id nil
    translate_complete true
    type_complete true
    qa_complete false
  end
end