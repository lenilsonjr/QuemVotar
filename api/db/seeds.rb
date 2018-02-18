Question.delete_all
Candidate.delete_all

7.times do
  Question.create(title: "#{Faker::MostInterestingManInTheWorld.quote}?", choices: ['Sim', 'Não'])
end

@questions = Question.all

18.times do
  @candidate = Candidate.create(name: Faker::RickAndMorty.character, photo: Faker::Placeholdit.image("400x400"), description: Faker::RickAndMorty.quote)

  @questions.each do |question|
    Characteristic.create(question: question, candidate: @candidate, answer: [true, false].sample)
  end
end