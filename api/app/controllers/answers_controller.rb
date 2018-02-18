class AnswersController < ApplicationController

  def create

    answers = JSON.parse(request.body.read).to_a
    @answer = Answer.new(
      answers: answers
    )

    @characteristics = Array.new
    answers.each do |answer|
      @characteristics = @characteristics + Characteristic.where(question_id: answer['id'], answer: answer['answer']).pluck(:candidate_id)
    end

    @candidate = @characteristics.select{ |e| @characteristics.count(e) == answers.count }.uniq

    if @candidate.nil? || @candidate.empty?
      @candidate = { name: 'Nulo', photo: 'https://placehold.it/400x400.png', description: 'Aparentemente você não compactua com nada disso e não tem outra opção a não ser votar nulo. Que sorte.' }
    else
      @candidate = Candidate.find(@candidate)
      @answer.candidate = @candidate.first
    end

    @answer.save
    render json: @candidate, except: [:created_at, :updated_at, :id]
  end

end
