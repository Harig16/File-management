class DocumentsController < ApplicationController

  before_action :logged_in_user
  before_action :correct_user, only: [:destroy]

  def index
    @documents = current_user.documents.all
  end

  def new
    @document = Document.new
  end

  def create
    #@document = Document.new(document_params)
    if logged_in?
      @document = current_user.documents.create(document_params)
      if @document.save
        flash[:success] = "Document uploaded successfully!"
        redirect_to documents_path
      else
        render "new"
      end
    else
      redirect_to login_path 
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

    def correct_user
      @document = current_user.documents.find_by(id: params[:id])
      redirect_to root_url if @document.nil?
    end
end
