class ToysController < ApplicationController
# index, new, create, edit, update, show, and destroy are the 7 RESTful actions that Rails uses.
# A frequent practice is to place theses standard CRUD actions in each controller in the following order:
# index, show, new, edit, create, update and destroy.
  http_basic_authenticate_with name: "denise", password: "geheim", except: [:index, :show]

  def index
    @toys = Toy.all
  end

  def show
    @toy = Toy.find(params[:id])  # @toy is an instance variable. Instance variables are passed to the view by Rails.
  end

  def new
    @toy = Toy.new
  end

  def edit
    @toy = Toy.find(params[:id])
  end

  def create
    @toy = Toy.new(toy_params)

    if @toy.save
      redirect_to @toy
    else
      render 'new'
    end
  end

  def update
    @toy = Toy.find(params[:id])

    if @toy.update(toy_params)
      redirect_to @toy
    else
      render 'edit'
    end
  end

  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy

    redirect_to toys_path
  end

  private
    def toy_params
      params.require(:toy).permit(:title, :text)
    end
end
