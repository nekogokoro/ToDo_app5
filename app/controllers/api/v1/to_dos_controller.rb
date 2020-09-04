class Api::V1::ToDosController < ActionController::API
  def index
    @to_dos = ToDo.all
  end

  def destroy
    to_do = ToDo.find_by(id: params[:id])
    render status: 200, json: { status: 200 } if to_do.destroy
  end

  def update
    @to_do = ToDo.find_by(id: params[:id])
    render status: 200, json: { status: 200 } if @to_do.update(to_do_params)
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      render status: :created
    else
      render status: 400, json: { status: 400, message: 'ToDoの作成に失敗しました' }
    end
  end

  private

  def to_do_params
    params.require(:to_do).permit(:finished, :title, :expired_at)
  end
end
