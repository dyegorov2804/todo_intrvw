class TdlistsController < ApplicationController
  before_action :set_tdlist, only: [:show, :edit, :update, :destroy]

  # GET /tdlists
  # GET /tdlists.json
  def index
    @tdlists = Tdlist.all
  end

  # GET /tdlists/1
  # GET /tdlists/1.json
  def show
  end

  # GET /tdlists/new
  def new
    @tdlist = Tdlist.new
  end

  # GET /tdlists/1/edit
  def edit
  end

  # PATCH /tdlists/id/change_status
  def change_status
    td_item = Tdlist.where(id: params[:id]).last
    
    td_item.completed ? (td_item.update(:completed=>false)) : td_item.update(:completed=>true)

    #if current_status
    #  @td_item.update(:completed=>false)
    #else
    #  @td_item.update(:completed=>true)
    #end

    redirect_to root_url
  end

  # POST /tdlists
  # POST /tdlists.json
  def create
    @tdlist = Tdlist.new(tdlist_params)

    respond_to do |format|
      if @tdlist.save
        format.html { redirect_to root_url, notice: 'Tdlist was successfully created.' }
        format.json { render :show, status: :created, location: @tdlist }
      else
        format.html { render :new }
        format.json { render json: @tdlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tdlists/1
  # PATCH/PUT /tdlists/1.json
  def update
    respond_to do |format|
      if @tdlist.update(tdlist_params)
        format.html { redirect_to @tdlist, notice: 'Tdlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @tdlist }
      else
        format.html { render :edit }
        format.json { render json: @tdlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tdlists/1
  # DELETE /tdlists/1.json
  def destroy
    @tdlist.destroy
    respond_to do |format|
      format.html { redirect_to tdlists_url, notice: 'Tdlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tdlist
      @tdlist = Tdlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tdlist_params
      params.require(:tdlist).permit(:description, :completed)
    end
end
