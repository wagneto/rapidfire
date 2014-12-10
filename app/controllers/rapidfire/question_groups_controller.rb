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

      #raise @question_group.type_evaluation.inspect

      if @question_group.type_evaluation == "2"

        @question = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "1) CONTEÚDO DO COMPONENTE - Contribuição para o seu desempenho profissional", position: "1", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question1 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "2) CONTEÚDO DO COMPONENTE - Qualidade e quantidade das informações atenderam suas expectativas", position: "2", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question2 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "3) CONTEÚDO DO COMPONENTE - Método utilizado", position: "3", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question3 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "4) CONTEÚDO DO COMPONENTE - Equilíbrio entre teoria e/ou prática – se houver prática", position: "4", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question4 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "5) ATUAÇÃO DO DOCENTE - Clareza na exposição dos assuntos", position: "5", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question5 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "6) ATUAÇÃO DO DOCENTE - Facilidade em esclarecer dúvidas", position: "6", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question6 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "7) ATUAÇÃO DO DOCENTE - Relacionamento com a turma", position: "7", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question7 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "8) ATUAÇÃO DO DOCENTE - Assiduidade e cumprimento do  horário", position: "8", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question8 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "9) ATUAÇÃO DO DOCENTE - Domínio do conteúdo", position: "9", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question9 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "10) ATUAÇÃO DO DOCENTE - Utilização dos recursos didáticos", position: "10", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question10 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "11) MATERIAL DIDÁTICO - Facilidade de compreensão do texto", position: "11", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question11 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "12) MATERIAL DIDÁTICO - Clareza das informações e conceitos apresentados", position: "12", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question12 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "13) MATERIAL DIDÁTICO - Conceitos e informações técnicas corretas e atualizadas", position: "13", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question13 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "14) MATERIAL DIDÁTICO - Adequação da linguagem a sua realidade de trabalho", position: "14", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question14 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "15) MATERIAL DIDÁTICO - Relevância do conteúdo para sua prática profissional", position: "15", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question15 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "16) MATERIAL DIDÁTICO - Qualidade das apostilas (encadernação, impressão e ilustração)", position: "16", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question16 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "17) MATERIAL DIDÁTICO - Qualidade dos Material audiovisual – se houver (apresentação, vídeo)", position: "17", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question17 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "18) ORGANIZAÇÃO - Carga horária x conteúdo", position: "18", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question18 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "19) ORGANIZAÇÃO - Horário do curso", position: "19", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question19 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "20) ORGANIZAÇÃO - Instalações", position: "20", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question20 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "21) ORGANIZAÇÃO - Coordenação", position: "21", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question21 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "22) ORGANIZAÇÃO - Materiais de consumo – se houver", position: "22", 
          answer_options: "MUITO BOM
BOM
REGULAR
DEFICIENTE
SEM RESPOSTA", :validation_rules => {:presence => "1"})      

        @question22 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Long", 
          question_text: "23) COMENTÁRIOS E SUGESTÕES", position: "23", 
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

      elsif @question_group.type_evaluation == "1"

        @question = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "1) PONTUALIDADE - É frequente?", position: "1", 
          answer_options: "SIM
NÃO
ÀS VEZES
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question1 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "2) PONTUALIDADE - Chega e sai no horário?", position: "2", 
          answer_options: "SIM
NÃO
ÀS VEZES
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question2 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "3) DOMÍNIO DO CONTEÚDO - Explica com clareza o conteúdo nas aulas teóricas?", position: "3", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question3 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "4) DOMÍNIO DO CONTEÚDO - Explica com clareza as atividades nas aulas práticas?", position: "4", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question4 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "5) DOMÍNIO DO CONTEÚDO - Apresenta conhecimentos atualizados sobre o assunto? Equipamentos?", position: "5", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question5 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "6) DOMÍNIO DO CONTEÚDO - Esclarece as dúvidas da matéria e revisa o conteúdo?", position: "6", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question6 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "7) PLANEJAMENTO - É organizado?", position: "7", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question7 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "8) PLANEJAMENTO - Leva o material necessário para as aulas?", position: "8", 
          answer_options: "SIM
NÃO
ÃS VEZES
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question8 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "9) PLANEJAMENTO - As aulas são bem planejadas, estão de acordo com o conteúdo?", position: "9", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question9 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "10) PLANEJAMENTO - As aulas são dinâmicas, criativas e interessantes?", position: "10", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question10 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "11) PLANEJAMENTO - Tinha material para as aulas práticas?", position: "11", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})
        
        @question11 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "12) DISCIPLINA - Mantém a disciplina dentro de sala e ou oficina?", position: "12", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question12 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "13) DISCIPLINA - Provoca o interesse da turma durante as aulas?", position: "13", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question13 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "14) QUALIDADE - As atividades avaliataivas são bem elaboradas?", position: "14", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question14 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Radio", 
          question_text: "15) QUALIDADE - As atividades são de acordo com os conteúdos vistos em sala?", position: "15", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})


        @question15 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Long", 
          question_text: "16) Informe, três pontos positivos do instrutor. Um dos pontos pode ser algo que aprendeu e euq realmente fez diferença em você.", position: "16", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA")

        @question16 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Long", 
          question_text: "17) Informe três pontos em que o instrutor poderia melhorar.", position: "17", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

        @question17 = Question.new(question_group_id: QuestionGroup.last.id.inspect, type: "Rapidfire::Questions::Numeric", 
          question_text: "18) Em geral de 01 a 10 qual seria sua nota para o instrutor:", position: "18", 
          answer_options: "ÓTIMO
BOM
REGULAR
FRACO
SEM RESPOSTA", :validation_rules => {:presence => "1"})

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

      end

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
        params.require(:question_group).permit(:name, :teacher, :active, :code, :room, :date, :shift, :course, :date_end, :quantity, :quantity_end, :type_evaluation)
      else
        params[:question_group]
      end
    end
  end
end
