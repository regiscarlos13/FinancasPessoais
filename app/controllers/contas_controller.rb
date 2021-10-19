class ContasController < ConfigsController 
  before_action :set_conta, only: [:show, :edit, :update, :destroy]
  before_action :grupos_contas, only: [:edit, :new]
  before_action :ctipos, only: [:edit, :new]


include DataModule
include Enum

  
  # GET /contas
  # GET /contas.json

   def index
    @contas = Conta.usuario(current_user).order(:nome)
  end

  # GET /contas/1
  # GET /contas/1.json
  def show
  end

  # GET /contas/new
  def new
    @conta = Conta.new
  end

  # GET /contas/1/edit
  def edit
  end

  # POST /contas
  # POST /contas.json
  def create
    @conta = Conta.new(conta_params)

    respond_to do |format|
      if @conta.save
        format.html { redirect_to contas_path, notice: "Conta #{@conta.nome} Criado com Sucesso!" }
        format.json { render :show, status: :created, location: @conta }
      else
        format.html { render :new }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contas/1
  # PATCH/PUT /contas/1.json
  def update
    respond_to do |format|
      if @conta.update(conta_params)
        format.html { redirect_to contas_path, notice: "Conta #{@conta.nome} Atualizada com Sucesso! "}
        format.json { render :show, status: :ok, location: @conta }
      else
        format.html { render :edit }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contas/1
  # DELETE /contas/1.json
  def destroy
    @conta.destroy
    respond_to do |format|
      format.html { redirect_to contas_url, notice: "Conta #{@conta.nome} Removida com Sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta
      @conta = Conta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conta_params
      params.require(:conta).permit(:nome, :tipo, :ctipo, :ativo, :grupocont_id).merge(user_id: current_user.id)
    end
  
  end
