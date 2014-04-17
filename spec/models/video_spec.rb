require 'spec_helper'

describe Video do

	before(:each) { @video = Video.new(:video_id => "123", :subject => "Math", :course => "Algebra 1",
	 :title => "Dividing both sides by x", :translator_id => 1, :typer_id => 2,
	 :qa_id => nil, :translate_complete => true, :type_complete => true,
	 :qa_complete => false) }

	describe "video should respond to all field getters/setters" do
		subject { @video }
		it { should respond_to(:video_id) }
		it { should respond_to(:subject) }
		it { should respond_to(:course) }
		it { should respond_to(:title) }
		it { should respond_to(:translator_id) }
		it { should respond_to(:typer_id) }
		it { should respond_to(:qa_id) }
		it { should respond_to(:translate_progress) }
		it { should respond_to(:type_progress) }
		it { should respond_to(:qa_progress) }
		it { should respond_to(:translate_complete) }
		it { should respond_to(:type_complete) }
		it { should respond_to(:qa_complete) }
	end

	describe "existing video should be valid" do
		subject { @video }
		it { should be_valid }
	end

	describe "when video_id is not present" do
		before { @video.video_id = " " }
	  	it { should_not be_valid }
	end
	  
	describe "cvideo reated with all fields correctly set" do
		subject { @video }
		its(:video_id) { should == "123" }
		its(:subject) { should == "Math" }
		its(:course) { should == "Algebra 1" }
		its(:title) { should == "Dividing both sides by x" }
		its(:translator_id) { should == 1 }
		its(:typer_id) { should == 2 }
		its(:qa_id) { should == nil }
		it { should_not be_translate_progress }
		it { should_not be_type_progress }
		it { should_not be_qa_progress }
		it { should be_translate_complete }
		it { should be_type_complete }
		it { should_not be_qa_complete }
	end
  
end
