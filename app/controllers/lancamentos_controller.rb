class LancamentosController < ConfigsController
  before_action :set_lancamento, only: [:show, :edit, :update, :destroy, :pagamentos]

before_action :orcamento_lista_receita, only: [:new, :edit]
before_action :orcamento_lista_despesa, only: [:new, :edit]
before_action :pagamentos_all, only: [:pagamentos]

before_action :tipos,  only: [:new, :edit]
before_action :meses, only: [:index]

include DataModule
include Enum
  # GET /lancamentos
  # GET /lancamentos.json 
  
  def index

   @data = Time.new.month

   if  params[:q].blank?
    @lancamentos = Lancamento.usuario(current_user).search_mes(params[:q] = @data, @anos_atual[0].ano).order(:data)
  else
    @lancamentos = Lancamento.usuario(current_user).search_mes(params[:q], @anos_atual[0].ano).order(:data)
  end

  @campo = params[:q]

  if @campo.to_i > 1 and @campo.to_i < 12

    @anterior = (@campo.to_i - 1)
    @proximo = (@campo.to_i + 1)

  elsif @campo.to_i == 1
    @anterior = (@campo = 12 )
    @proximo = (@campo = 2)

  elsif @campo.to_i == 12
    @anterior = (@campo = 11 )
    @proximo = (@campo = 1)
  end
  @sum_receitas = @lancamentos.where(tipo: 1).sum(:valor)
  @sum_despesas = @lancamentos.where(tipo: 0).sum(:valor)
end


def pagamentos

  respond_to do |format|
    format.js
  end    
end




  # GET /lancamentos/1
  # GET /lancamentos/1.json
  def show
    respond_to do |format|
      format.js
    end
  end

  # GET /lancamentos/new
  def new
    @lancamento = Lancamento.new
    respond_to do |format|
      format.js
    end
  end

  # GET /lancamentos/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /lancamentos
  # POST /lancamentos.json
  def create
    @lancamento = Lancamento.new(lancamento_params)

    @data = @lancamento.data
    @parcela = (@lancamento.parcela - 1)
    @n = 1


    respond_to do |format|

      if @lancamento.save

        if @parcela > 1
          for i in 1..@parcela
            lancamento = @lancamento.dup
            lancamento.data =  (@data += 1.month)
            lancamento.parcela = (@n += 1)
            lancamento.save!
          end
        end


        format.html { redirect_to @lancamento, notice: 'Lancamento was successfully created.' }
        format.json { render :show, status: :created, location: @lancamento }
        format.js
      else
        format.html { render :new }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
        format.js
      end
    end
    
  end

  # PATCH/PUT /lancamentos/1
  # PATCH/PUT /lancamentos/1.json
  def update
    respond_to do |format|
      if @lancamento.update(lancamento_params)
        format.html { redirect_to @lancamento, notice: 'Lancamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @lancamento }
        format.js #{ redirect_to lancamentos_path, notice: "Atualizado com Sucesso" }
      else
        format.html { render :edit }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
        format.js #{ render :edit }
      end
    end
  end

  # DELETE /lancamentos/1
  # DELETE /lancamentos/1.json
  def destroy
    @lancamento.destroy
    respond_to do |format|
      format.html { redirect_to lancamentos_url, notice: 'Lancamento was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lancamento
      @lancamento = Lancamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lancamento_params
      params.require(:lancamento).permit(:fornecedor_id, :fonte_id, :centro_id, :orcamento_id,   :data, :descricao, :valor, :id, :tipo, :parcela, :number).merge(user_id: current_user.id)
    end
  end
