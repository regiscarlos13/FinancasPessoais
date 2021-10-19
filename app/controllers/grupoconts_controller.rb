class GrupocontsController < ConfigsController 
  before_action :set_grupocont, only: [:show, :edit, :update, :destroy]

  before_action :tipos, only: [:new, :edit]
include Enum

  # GET /grupoconts
  # GET /grupoconts.json
  def index
    @grupoconts = Grupocont.usuario(current_user).order(:nome)
  end

  # GET /grupoconts/1
  # GET /grupoconts/1.json
  def show
  end

  # GET /grupoconts/new
  def new
    @grupocont = Grupocont.new
  end

  # GET /grupoconts/1/edit
  def edit
  end

  # POST /grupoconts
  # POST /grupoconts.json
  def create
    @grupocont = Grupocont.new(grupocont_params)

    respond_to do |format|
      if @grupocont.save
        format.html { redirect_to grupoconts_path, notice: "Grupo #{@grupocont.nome} Criado com Sucesso!"  }
        format.json { render :show, status: :created, location: @grupocont }
      else
        format.html { render :new }
        format.json { render json: @grupocont.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupoconts/1
  # PATCH/PUT /grupoconts/1.json
  def update
    respond_to do |format|
      if @grupocont.update(grupocont_params)
        format.html { redirect_to grupoconts_path, notice:  "Grupo #{@grupocont.nome} Atualizado com Sucesso!" }
        format.json { render :show, status: :ok, location: @grupocont }
      else
        format.html { render :edit }
        format.json { render json: @grupocont.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupoconts/1
  # DELETE /grupoconts/1.json
  def destroy
    @grupocont.destroy
    respond_to do |format|
      format.html { redirect_to grupoconts_url, notice: "Grupo #{@grupocont.nome} Removido com Sucesso!"  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupocont
      @grupocont = Grupocont.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupocont_params
      params.require(:grupocont).permit(:nome, :tipo,:user_id, :ativo).merge(user_id: current_user.id)
    end
end
