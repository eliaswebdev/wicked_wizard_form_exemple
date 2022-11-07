class PartnersController < ApplicationController
  before_action :set_partner, only: %i[ show edit update destroy ]

  # GET /partners
  def index
    @partners = Partner.all
  end

  # GET /partners/1
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
    @partner.save(validates: false)
    session[:partner_id] = @partner.id
    redirect_to partner_steps_path
  end

  # GET /partners/1/edit
  def edit
    session[:partner_id] = params[:id]
    redirect_to partner_steps_path
  end

  # POST /partners
  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      redirect_to partners_url, notice: "Partner <strong>#{@partner.id}</strong> was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /partners/1
  def update
    if @partner.update(partner_params)
      redirect_to partners_url, notice: "Partner <strong>#{@partner.id}</strong> was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /partners/1
  def destroy
    name = @partner.name
    @partner.destroy
    redirect_to partners_url, notice: "Partner <strong>#{name}</strong> was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:name, :price, :width, :height, :weight)
    end
end

