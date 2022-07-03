class Client < ApplicationRecord
    # has_many :productos, through: :pedidos, dependent: :destroy
    has_many :facturas, dependent: :destroy

    def nombre_completo
        "#{id}- #{nombre_cli} #{nombre2_cli}"
    end
    validates :id, :correo_cli, uniqueness: {:message => "Campo único"}
    validates :id, :nombre_cli, :apellido_cli, :tel_cli, :correo_cli, :direccion_cli, presence: {:message => "Requerido"}
    validates :nombre_cli, :apellido_cli, format: { with: /\A[a-zA-Z]+\z/, message: "Solo se permiten letras" }
    validates :id, length: {  in:7.. 10, :message=>"Tiene que contener mínimo 7 numeros maximo 10" }
    validates :tel_cli, length: { is:10, :message=>"Debe contener 10 digitos" }
    validates :id, :tel_cli, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100, :message=> "No se permiten numeros negativos"}
    def self.search(search)
        if search
          where( ["id LIKE  ? or nombre_cli LIKE ? ", "%#{search}%","%#{search}%"]  )
        else
            unscoped
        end
      end
end
