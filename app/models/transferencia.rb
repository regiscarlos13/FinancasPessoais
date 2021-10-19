class Transferencia < ApplicationRecord
  belongs_to :user
  belongs_to :pagamento

end
