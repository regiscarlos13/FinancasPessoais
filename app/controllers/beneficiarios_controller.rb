class BeneficiariosController < ConfigsController 
  before_action :set_beneficiario, only: [:show, :edit, :update, :destroy]

  # GET /beneficiarios
  # GET /beneficiarios.json
  def index
    @beneficiarios = Beneficiario.usuario(current_user)
  end

  # GET /beneficiarios/1
  # GET /beneficiarios/1.json
  def show
  end

  # GET /beneficiarios/new
  def new
    @beneficiario = Beneficiario.new
  end

  # GET /beneficiarios/1/edit
  def edit
  end

  # POST /beneficiarios
  # POST /beneficiarios.json
  def create
    @beneficiario = Beneficiario.new(beneficiario_params)

    respond_to do |format|
      if @beneficiario.save
        format.html { redirect_to beneficiarios_path, notice: 'Beneficiario Criado com Sucesso.' }
        format.json { render :show, status: :created, location: @beneficiario }
      else
        format.html { render :new }
        format.json { render json: @beneficiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beneficiarios/1
  # PATCH/PUT /beneficiarios/1.json
  def update
    respond_to do |format|
      if @beneficiario.update(beneficiario_params)
        format.html { redirect_to beneficiarios_path, notice: 'Beneficiario Atualizado com Sucesso.' }
        format.json { render :show, status: :ok, location: @beneficiario }
      else
        format.html { render :edit }
        format.json { render json: @beneficiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beneficiarios/1
  # DELETE /beneficiarios/1.json
  def destroy
    @beneficiario.destroy
    respond_to do |format|
      format.html { redirect_to beneficiarios_url, notice: 'Beneficiario Removido com Sucessoe.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beneficiario
      @beneficiario = Beneficiario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beneficiario_params
      params.require(:beneficiario).permit(:nome, :ativo).merge(user_id: current_user.id)
    end
end
