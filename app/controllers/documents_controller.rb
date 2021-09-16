class DocumentsController < ApplicationController

  before_action :logged_in_user

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = "Document uploaded successfully!"
      redirect_to documents_path
    else
      render "new"
    end 
  end

  def show
    @document = Document.find(params[:id])
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:success] = "Document Deleted!!!"
    redirect_to root_url
  end

  private

    def document_params
      params.require(:document).permit(:title, :description, :attachment) 
    end
end
