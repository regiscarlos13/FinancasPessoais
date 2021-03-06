class OrcamentosController < ConfigsController
  before_action :set_orcamento, only: [:show, :edit, :update, :destroy]

  before_action :grupos_contas, only: [:new, :edit]

include DataModule
  # GET /orcamentos
  # GET /orcamentos.json
  def index
     @orcamentos = Orcamento.usuario_ano(current_user, @anos_atual[0].id)
  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
  end

  # GET /orcamentos/1/edit
  def edit
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    @orcamento = Orcamento.new(orcamento_params)

    respond_to do |format|
      if @orcamento.save
        format.html { redirect_to @orcamento, notice: "Orcamento #{@orcamento.conta.nome} Criado com Sucesso!" }
        format.json { render :show, status: :created, location: @orcamento }
      else
        format.html { render :new }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
      respond_to do |format|
        if @orcamento.update(orcamento_params) 
          format.html { redirect_to @orcamento, notice: "Orcamento #{@orcamento.conta.nome} Atualizado com Sucesso!" }
          format.json { render :show, status: :ok, location: @orcamento }
        else
          format.html { render :edit }
          format.json { render json: @orcamento.errors, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    @orcamento.destroy
    respond_to do |format|
      format.html { redirect_to orcamentos_url, notice: "Orcamento #{@orcamento.conta.nome} Apagado com Sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orcamento
      @orcamento = Orcamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orcamento_params
      params.require(:orcamento).permit(:janeiro, :fevereiro, :marco, :abril, :maio, :junho, :julho, :agosto, :setembro, :outubro, :novembro, :dezembro, :total, :grupocont_id, :conta_id).merge(user_id: current_user.id, ano_id: @anos_atual[0].id)
    end
end
