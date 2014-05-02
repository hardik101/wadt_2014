require 'test_helper'

class MemberTest < ActiveSupport::TestCase

fixtures :members

	test "member attributes must not be empty" do

		member = Member.new
		assert member.invalid? ,"member_invalid assertion failed"
		assert member.errors[:email].any? ,"email assertion failed"
		
    end

    test "member is not valid without a unique email address" do
        member = Member.new(:email => members(:dummy_member).email,
        	:firstname => "test",
        	:lastname => "test")
        assert !member.save
		assert_equal I18n.translate('activerecord.errors.messages.taken'),
                          member.errors[:email].join('; ')

		
	end 


end
