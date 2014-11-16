module Rapidfire
  class QuestionGroupsController < Rapidfire::ApplicationController
    before_filter :authenticate_administrator!, except: :index
    respond_to :html, :js
    respond_to :json, only: :results

    def index
      if can_administer?
        @question_groups = QuestionGroup.all
      else
        @question_groups = QuestionGroup.search(params[:search])
      end
      
      respond_with(@question_groups)
    end

    def new
      @question_group = QuestionGroup.new
      respond_with(@question_group)
    end

    def create
      #raise Question.find_by_question_group_id(13).question_text.inspect
      #@test = Question.find_by_question_group_id(13)
      #@test = Question.find(9, 10, 11, 12, 13)    # returns an array for objects with IDs in (1, 2, 6)

      #raise @test[1].question_text.inspect

      @question_group = QuestionGroup.new(question_group_params)
      @question_group.save

      #raise QuestionGroup.last.id.inspect

      @question = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", question_text: "CONTEÚDO DO COMPONENTE - Contribuição para o seu desempenho profissional", position: "1", answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")

      @question1 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", question_text: "CONTEÚDO DO COMPONENTE - Qualidade e quantidade das informações atenderam suas expectativas", position: "2", answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")

      @question.save
      @question1.save

      respond_with(@question_group, location: rapidfire.question_groups_url)
    end

    def edit
      @question_group = QuestionGroup.find(params[:id])
      respond_with(@question_group)
    end

    def update
      @question_group = QuestionGroup.find(params[:id])
      
      if @question_group.update(question_group_params)
        respond_with(@question_group, location: rapidfire.question_groups_url)      
      else
        respond_with(@question_group, location: rapidfire.question_groups_url)      
      end
    end

    def destroy
      @question_group = QuestionGroup.find(params[:id])
      @question_group.destroy

      respond_with(@question_group)
    end

    def results
      @question_group = QuestionGroup.find(params[:id])
      @question_group_results =
        QuestionGroupResults.new(question_group: @question_group).extract

      respond_with(@question_group_results, root: false)
    end

    private
    def question_group_params
      if Rails::VERSION::MAJOR == 4
        params.require(:question_group).permit(:name, :teacher, :active, :code)
      else
        params[:question_group]
      end
    end
  end
end
