class FontesController < ConfigsController 
  before_action :set_fonte, only: [:show, :edit, :update, :destroy]

  # GET /fontes
  # GET /fontes.json
  def index
    @fontes = Fonte.usuario(current_user)
  end

  # GET /fontes/1
  # GET /fontes/1.json
  def show
  end

  # GET /fontes/new
  def new
    @fonte = Fonte.new
  end

  # GET /fontes/1/edit
  def edit
  end

  # POST /fontes
  # POST /fontes.json
  def create
    @fonte = Fonte.new(fonte_params)

    respond_to do |format|
      if @fonte.save
        format.html { redirect_to fontes_path, notice: "Fonte #{@fonte.nome} Criado com Sucesso!" }
        format.json { render :show, status: :created, location: @fonte }
      else
        format.html { render :new }
        format.json { render json: @fonte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fontes/1
  # PATCH/PUT /fontes/1.json
  def update
    respond_to do |format|
      if @fonte.update(fonte_params)
        format.html { redirect_to fontes_path, notice: "Fonte #{@fonte.nome} Atualizado com Sucesso!" }
        format.json { render :show, status: :ok, location: @fonte }
      else
        format.html { render :edit }
        format.json { render json: @fonte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fontes/1
  # DELETE /fontes/1.json
  def destroy
    @fonte.destroy
    respond_to do |format|
      format.html { redirect_to fontes_url, notice: "Fonte #{@fonte.nome} Apagada com Sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fonte
      @fonte = Fonte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fonte_params
      params.require(:fonte).permit(:nome, :endereco, :cidade, :telefone, :documento, :ativo).merge(user_id: current_user.id)
    end
end
