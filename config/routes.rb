Rails.application.routes.draw do

  resources :beneficiarios
  resources :bancos
  resources :centros
  resources :fontes
  resources :fornecedors
  resources :orcamentos
  resources :atuals, except: [:index, :show, :destroy]
  resources :transferencias
  #devise_for :users, :skip => [:registrations]
  devise_for :users
  resources :anos
  resources :contas
  resources :grupoconts
  get 'home/index'
  root 'home#index'
  
  
  resources :lancamentos do
   resources :pagamentos do
    resources :nenes, only: [:create]
   end
 end



get 'pagamentos/:id', controller: 'lancamentos', action: 'pagamentos', as: 'pagamento'

get 'sessions', controller: 'application', action: 'set_session'

  namespace :relatorios do
   get 'orcamentos/receitas_geral'
   get 'orcamentos/despesas_geral'
   get 'orcamentos/orcamento_geral'
   get 'contas/apagar'
   get 'contas/areceber'
   get 'bancos/extratos'
   get 'compara/despesas'
   get 'compara/receitas'
   get 'compara/gastos'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
