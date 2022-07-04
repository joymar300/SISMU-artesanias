class Producto < ApplicationRecord
    has_and_belongs_to_many :categories,  dependent: :destroy
    # has_many :clients, through: :pedidos, dependent: :destroy

    has_many :dproductions, dependent: :destroy
    has_many :detalles, dependent: :destroy
    has_many :factura, through: :detalles
    has_many :production, through: :productions
    has_many :emdetalles, dependent: :destroy
    has_many :emfactura, through: :emdetalles


    validates :referencia_pro, :nombre_pro, :precio_pro ,presence: {:message => "«Este campo es obligatorio»"}
    validates :referencia_pro, uniqueness: {:message => "«Este número de referencia ya se encuentra en uso»"}

     # nuevas validaciones actualizacion version 1.2

    validates :referencia_pro, format: { with: /\A[A-Za-z0-9]{1,15}\z/, :message => "«No se permiten carácteres especiales»"}
    validates :nombre_pro, format: { with: /\A[A-Za-z\s]+$\z/, :message => "«Se permiten solo letras» (no se permiten carácteres especiales)"  }
    validates :precio_pro, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 99999999999, :message => "«No se permiten números negativos»"  }


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
