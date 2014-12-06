module Rapidfire
  class QuestionGroupsController < Rapidfire::ApplicationController
    before_filter :authenticate_administrator!, except: :index
    respond_to :html, :js
    respond_to :json, only: :results

    def index
      if can_administer?
        @question_groups = QuestionGroup.order("name").page(params[:page]).per_page(10).search_admin(params[:search])        
        #@question_groups = QuestionGroup.all
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
      @question_group = QuestionGroup.new(question_group_params)
      @question_group.save

      @question = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "CONTEÚDO DO COMPONENTE - Contribuição para o seu desempenho profissional", position: "1", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")

      @question1 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "CONTEÚDO DO COMPONENTE - Qualidade e quantidade das informações atenderam suas expectativas", position: "2", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")

      @question2 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "CONTEÚDO DO COMPONENTE - Método utilizado", position: "3", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")

      @question3 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "CONTEÚDO DO COMPONENTE - Equilíbrio entre teoria e/ou prática – se houver prática", position: "4", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")

      @question4 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ATUAÇÃO DO DOCENTE - Clareza na exposição dos assuntos", position: "5", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")

      @question5 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ATUAÇÃO DO DOCENTE - Facilidade em esclarecer dúvidas", position: "6", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question6 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ATUAÇÃO DO DOCENTE - Relacionamento com a turma", position: "7", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question7 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ATUAÇÃO DO DOCENTE - Assiduidade e cumprimento do  horário", position: "8", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question8 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ATUAÇÃO DO DOCENTE - Domínio do conteúdo", position: "9", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question9 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ATUAÇÃO DO DOCENTE - Utilização dos recursos didáticos", position: "10", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question10 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "MATERIAL DIDÁTICO - Facilidade de compreensão do texto", position: "11", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question11 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "MATERIAL DIDÁTICO - Clareza das informações e conceitos apresentados", position: "12", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question12 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "MATERIAL DIDÁTICO - Conceitos e informações técnicas corretas e atualizadas", position: "13", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question13 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "MATERIAL DIDÁTICO - Adequação da linguagem a sua realidade de trabalho", position: "14", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question14 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "MATERIAL DIDÁTICO - Relevância do conteúdo para sua prática profissional", position: "15", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question15 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "MATERIAL DIDÁTICO - Qualidade das apostilas (encadernação, impressão e ilustração)", position: "16", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question16 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "MATERIAL DIDÁTICO - Qualidade dos Material audiovisual – se houver (apresentação, vídeo)", position: "17", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question17 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ORGANIZAÇÃO - Carga horária x conteúdo", position: "18", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question18 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ORGANIZAÇÃO - Horário do curso", position: "19", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question19 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ORGANIZAÇÃO - Instalações", position: "20", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question20 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ORGANIZAÇÃO - Coordenação", position: "21", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question21 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
        question_text: "ORGANIZAÇÃO - Materiais de consumo – se houver", position: "22", 
        answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE")      

      @question22 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Long", 
        question_text: "COMENTÁRIOS E SUGESTÕES", position: "23", 
        answer_options: "")      

      @question.save
      @question1.save
      @question2.save
      @question3.save
      @question4.save
      @question5.save
      @question6.save
      @question7.save
      @question8.save
      @question9.save
      @question10.save
      @question11.save
      @question12.save
      @question13.save
      @question14.save
      @question15.save
      @question16.save
      @question17.save
      @question18.save
      @question19.save
      @question20.save
      @question21.save
      @question22.save

      respond_with(@question_group, location: rapidfire.question_groups_url)
      
      flash[:notice] = "Pesquisa criada com sucesso!"
    end

    def edit
      @question_group = QuestionGroup.find(params[:id])
      respond_with(@question_group)

      flash[:notice] = "Pesquisa editada com sucesso!"
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

      flash[:notice] = "Pesquisa apagada com sucesso!"      
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
        params.require(:question_group).permit(:name, :teacher, :active, :code, :room, :date, :shift, :course, :date_end, :quantity, :quantity_end)
      else
        params[:question_group]
      end
    end
  end
end
