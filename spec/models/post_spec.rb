require 'spec_helper'

describe Post do
  describe "#regenerate_permalink" do
    it "generates the permalink based on the post title" do
      subject.title = 'A big long post title'
      subject.regenerate_permalink
      subject.permalink.should == 'a-big-long-post-title'
    end
  end

  describe "#allowed_to_update_permalink?" do
    context "post is published" do
      before do
        subject.published = true
      end

      it "returns false" do
        subject.allowed_to_update_permalink?.should be_false
      end
    end

    context "post is not published" do
      before do
        subject.published = false
      end

      it "returns true" do
        subject.allowed_to_update_permalink?.should be_true
      end
    end
  end
end
