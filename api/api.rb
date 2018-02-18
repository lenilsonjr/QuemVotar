require 'sinatra'
require 'json'
set :bind, '0.0.0.0'

get '/questions' do
  content_type :json

  {
    questions: [
      { id: 0, question: 'Pergunta Um', choices: ['string', 'string'] },
      { id: 1, question: 'Pergunta Dois', choices: ['string', 'string'] },
      { id: 2, question: 'Pergunta Três', choices: ['string', 'string'] },
      { id: 3, question: 'Pergunta Quatro', choices: ['string', 'string'] },
      { id: 4, question: 'Pergunta Cinco', choices: ['string', 'string'] },
      { id: 5, question: 'Pergunta Seis', choices: ['string', 'string'] },
      { id: 6, question: 'Pergunta Sete', choices: ['string', 'string'] }
    ]
  }.to_json
end

post '/answers' do
  content_type :json

  """{
    answers: [
        { id: 0, answer: 'string' },
        { id: 1, answer: 'string' },
        { id: 2, answer: 'string' },
        { id: 3, answer: 'string' },
        { id: 4, answer: 'string' },
        { id: 5, answer: 'string' },
        { id: 6, answer: 'string' }
      ]
  }"""

  puts params[:answers]
  puts "======================================================="
  params[:answers].each do |answer|
    puts answer
  end

  if params[:answers].nil? || params[:answers].empty?
    {
      candidates: nil
    }.to_json
  else
    {
      candidates: [
          { name: 'Candidato 1', avatar: 'https://picsum.photos/200', description: 'string' },
          { name: 'Candidato 2', avatar: 'https://picsum.photos/200', description: 'string' }
      ]
    }.to_json  
  end

end