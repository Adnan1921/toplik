class ReservationConfirmationMailer < ApplicationMailer
  default from: 'Adnan.biber2@gmail.com'

  def reservation_confirmation_email
    @reservation = params[:reservation]
    @room = params[:room]

    mail(to: @reservation.email, subject: "You made a resrevation")

  end
end
