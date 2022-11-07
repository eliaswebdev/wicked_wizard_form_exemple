class Partner < ApplicationRecord
  ## VALIDATIONS
  validates :name, presence: true, if: -> { required_for_step?('set_basic') }
  validates :city, presence: true, if: -> { form_step == 'set_address' }
  validates :state, presence: true, if: -> { required_for_step?('set_address') }
  validates :cpf, presence: true, if: -> { required_for_step?('complement') }
  validates :cnpj, presence: true, if: -> { required_for_step?('complement') }


  # Class level accessor
  #This method defines the step names. You still need to call `step` in the controller.
  # cattr_accessor :form_steps do 
  #   %w[set_basic set_city set_state complement finish]
  # end

  # Instance level accessor
  attr_accessor :form_step

  def form_step
    @form_step ||= 'set_basic'
  end

  with_options if: -> { required_for_step?('set_address') } do |step|
    step.validates :city, presence: true
    step.validates :state, presence: true
  end

  def required_for_step?(step)
    # All fields are required if no form steps is present
    # return true if form_step.nil?

    # All fields from previous steps are required if the
    # step parameter appers before or we are on the current step
    # return true if form_steps.index(step.to_s) <= form_steps.index(form_step.to_s)
  end
end
