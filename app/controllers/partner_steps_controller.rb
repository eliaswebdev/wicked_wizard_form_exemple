class PartnerStepsController < ApplicationController
  include Wicked::Wizard

  layout 'application'

  before_action :set_partner, only: [:show, :update]

  # steps(*Partner.form_steps)
  steps :passo_1, :passo_2, :passo_3, :passo_4, :finish


  def show
    render_wizard
  end
  
  def update
    @partner.update(partner_params)

    render_wizard @partner
  end
  
  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thanks for signing up."
  end
  
  def set_partner
    @partner = Partner.find(session[:partner_id])
  rescue
    redirect_to partners_path, notice: 'Parner not found!'
  end

  def partner_params
    params.require(:partner)
          .permit!
  end
end