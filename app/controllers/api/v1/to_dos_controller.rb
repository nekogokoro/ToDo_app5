class Api::V1::ToDosController <  ActionController::API

  def index
    @to_dos = ToDo.all
  end
end
