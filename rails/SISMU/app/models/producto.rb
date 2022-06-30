class Producto < ApplicationRecord
    has_and_belongs_to_many :categories,  dependent: :destroy
    # has_many :clients, through: :pedidos, dependent: :destroy

    has_many :dproductions, dependent: :destroy
    has_many :detalles, dependent: :destroy
    has_many :factura, through: :detalles
    has_many :production, through: :productions
    has_many :emdetalles, dependent: :destroy
    has_many :emfactura, through: :emdetalles
    validates :referencia_pro, :nombre_pro, :precio_pro ,presence: {:message => "Requeridos"}
    validates :referencia_pro, uniqueness: {:message => "Referencia en uso"}
    # validates :referencia_pro, :precio_pro ,numericality: {:message => "numericos"}

    def buscar_producto
        "#{referencia_pro}- #{nombre_pro}"
    end

    def self.search(search)
        if search
         includes(:categories).where( ["referencia_pro LIKE  ? or nombre_pro LIKE ? or tipo_categoria LIKE?", "%#{search}%","%#{search}%","%#{search}%"]).references(:categories)
          
        else
            unscoped
        end
      end
end
