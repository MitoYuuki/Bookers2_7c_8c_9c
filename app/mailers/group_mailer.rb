class GroupMailer < ApplicationMailer
  def notify_members(event, group)
    @event = event
    @group = group
    mail to: group.members.pluck(:email), subject: "新しいイベント: #{@event.title}"
  end
end
