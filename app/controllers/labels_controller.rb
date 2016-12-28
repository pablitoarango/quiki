class LabelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_label, only: [:show]
  before_action :check_permission, only: [:show]
  before_action :find_notifications

  def index
    @labels = Label
                  .paginate(page: params[:page], per_page: 25)
                  .where(companies_id: current_user.company)
                  .where("questions_count > ?", 0)
                  .order('questions_count DESC, name ASC')
  end

  def show
    @questions = @label.questions.paginate(page: params[:page], per_page: 15)
  end

  private

  def set_label
    @label = Label.find(params[:id])
  end


  def check_permission
    unless @label.company == current_user.company
      redirect_to root_path, :alert => 'Unauthorized'
    end
  end

end