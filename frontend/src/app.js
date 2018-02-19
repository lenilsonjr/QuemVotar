import React, { Component } from 'react'

const SETTINGS = { API_HOST: 'http://localhost:3002' }

class App extends Component  {
  state = {
    answers: [],
    questions: [],
    hasQuestions: false,
    showSendAnswersButton: true
  }

  componentWillMount () {
    fetch(`${SETTINGS.API_HOST}/questions`)
      .then(res => res.json())
      .then(res => this.setState({questions: res}))
      .then(() => this.setState({questionsTotal: this.state.questions.length}))
      .then(res => this.setState({hasQuestions: this.state.questionsTotal}))
      .then(() => this.setState({currentQuestion: this.state.questions[0]}))
      .catch(err => {throw err})
  }

  handleSubmit (e) {
    e.preventDefault()

    const {id} = this.state.currentQuestion
    const answer = e.target.value === '0' ? true : false

    this.setState({answers: [...this.state.answers, {id, answer}]})
    this.setState({currentQuestion: this.state.questions[id]})
    this.setState({hasQuestions: this.state.hasQuestions - 1})
  }

  sendAnswers () {
    fetch(`${SETTINGS.API_HOST}/answers`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
        body: JSON.stringify(this.state.answers)
      }
    )
    .then(res => res.json())
    .then(res => this.setState({candidates: res}))
    .catch(err => {throw err})

    this.setState({showSendAnswersButton: false})
  }

  render () {
    const {
      currentQuestion,
      hasQuestions,
      candidates,
      showSendAnswersButton
    } = this.state

    return (
      <section>
        <h1>Quem Votar — Problemas para decidir seu voto?</h1>

        {currentQuestion &&
          <form>
            <div key={currentQuestion.id}>
              <h2>{currentQuestion.title}</h2>

              {currentQuestion.choices.map((choice, index) => (
                <button
                  onClick={this.handleSubmit.bind(this)}
                  ref='answer'
                  key={index}
                  value={index}
                >
                  {choice}
                </button>
              ))}
            </div>
          </form>
        }

        {!hasQuestions &&
          <section>
            {showSendAnswersButton &&
              <button onClick={this.sendAnswers.bind(this)}>
                Em quem devo votar?
              </button>
            }

            {candidates &&
              <section key={candidates.name}>
                <figure>
                  <img
                    src={candidates.photo}
                    alt='Foto de um candidato à política no Brasil'
                  />
                  <figcaption>{candidates.description}</figcaption>
                </figure>

                <h2>{candidates.name}</h2>
              </section>
            }
          </section>
        }
      </section>
    )
  }
}

export default App
