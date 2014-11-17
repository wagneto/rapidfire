module Rapidfire
  class QuestionsController < Rapidfire::ApplicationController
    before_filter :authenticate_administrator!
    respond_to :html, :js

    before_filter :find_question_group!
    before_filter :find_question!, :only => [:edit, :update, :destroy]

    def index
      @questions = @question_group.questions
      respond_with(@questions)
    end

    def new
      @question = QuestionForm.new(:question_group => @question_group)
      respond_with(@question)
    end

    def create
      form_params = params[:question].merge(:question_group => @question_group)
      @question = QuestionForm.new(form_params)
      @question.save

      respond_with(@question, location: index_location)
      flash[:notice] = "Questão criada com sucesso!"      
    end

    def edit
      @question = QuestionForm.new(:question => @question)
      respond_with(@question)

      flash[:notice] = "Questão editada com sucesso!"      
    end

    def update
      form_params = params[:question].merge(:question => @question)
      @question = QuestionForm.new(form_params)
      @question.save

      respond_with(@question, location: index_location)
    end

    def destroy
      @question.destroy
      respond_with(@question, location: index_location)

      flash[:notice] = "Questão apagada com sucesso!"            
    end

    private
    def find_question_group!
      @question_group = QuestionGroup.find(params[:question_group_id])
    end

    def find_question!
      @question = @question_group.questions.find(params[:id])
    end

    def index_location
      rapidfire.question_group_questions_url(@question_group)
    end
  end
end
