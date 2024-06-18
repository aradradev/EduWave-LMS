class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stripe_key

  def create
    course = Course.find(params[:course_id])

    session = Stripe::Checkout::Session.create(
      mode: 'payment',
      line_items: [{
        price: course.stripe_id,
        quantity: 1
      }],
      success_url: request.base_url + "/courses/#{course.id}",
      cancel_url: request.base_url + "/courses/#{course.id}",
      automatic_tax: { enabled: false },
      customer_email: current_user.email,
      metadata: { course_id: course.id }
    )

    redirect_to session.url, allow_other_host: true
  end

  private

  def set_stripe_key
    stripe_secret_key = Rails.application.credentials.dig(:stripe, :secret_key)
    Stripe.api_key = stripe_secret_key
  end




  # Create with Paydunya
  # def create
  #   course = Course.find(params[:course_id])

  #   paydunya_invoice = Paydunya::Checkout::Invoice.new

  #   paydunya_invoice.add_item(
  #     name: course.title,
  #     quantity: 1,
  #     unit_price: course.price,
  #     total_price: course.price,
  #     description: course.description
  #   )

  #   paydunya_invoice.description = "Payment for the course #{course.title}"
  #   paydunya_invoice.total_amount = course.price

  #   if paydunya_invoice.create
  #     redirect_to paydunya_invoice.url
  #   else
  #     flash[:alert] = "There was an error creating the payment request: #{paydunya_invoice.response_text}"
  #     redirect_to course_path(course)
  #   end

  # end

  # def callback
  #   paydunya_invoice = Paydunya::Checkout::Invoice.new

  #   if paydunya_invoice.confirm(params[:token])
  #     flash[:alert] = "Payment successful! You've unclocked the full course."
  #     redirect_to course_path(params[:course_id])
  #   else
  #     flash[:alert] = "Payment failed: #{paydunya_invoice.response_text}"
  #     redirect_to course_path(params[:course_id])
  #   end

  # end
end
