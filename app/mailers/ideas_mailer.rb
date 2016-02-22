class IdeasMailer < ApplicationMailer
  def notify_idea_owner(idea)
    @likes = like
    @idea = like.idea
    @owner = @idea.user
    mail(to: @owner.email, subject: "You got an answer!")
  end
end
