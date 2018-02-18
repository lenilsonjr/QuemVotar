import React, { Component } from 'react'

class App extends Component  {
  state = { answers: [], questions: [] }

  componentWillMount () {
    const endpoint = 'http://localhost:3001'

    fetch(`${endpoint}/questions`)
      .then(res => res.json())
      .then(res => this.setState({questions: res}))
      .then(() => this.setState({questionsTotal: this.state.questions.length}))
      .then(() => this.setState({currentQuestion: this.state.questions[0]}))
      .catch(err => {throw err})
  }

  handleSubmit (e) {
    e.preventDefault()

    const {id} = this.state.currentQuestion
    const answer = e.target.value === '0' ? true : false

    this.setState({answers: [...this.state.answers, {id, answer}]})
    this.setState({currentQuestion: this.state.questions[id + 1]})
  }

  render () {
    const {currentQuestion} = this.state

    return (
      <section>
        <h1>Quem Votar — Problemas para decidir seu voto?</h1>

        <form>
          {currentQuestion &&
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
          }
        </form>
      </section>
    )
  }
}

export default App
