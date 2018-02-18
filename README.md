# QuemVotar

🇧🇷 Problemas para decidir seu voto?

## API

```javascript
// GET /questions
{
  questions: [
    { id: 0, question: 'string', choices: ['string', 'string', 'string'] },
    { id: 0, question: 'string', choices: ['string', 'string', 'string'] }
  ]
}

// POST /answers
{
  answers: [
     { id: 0, answer: 'string' },
     { id: 0, answer: 'string' }
  ]
}

// POST /answers [response]
{
  candidates: [
    { name: 'string', avatar: 'string', description: 'string' }
  ]
}
```

## Front-end Flow

```
GET /questions
Storage questions
Render question by question
Storage answer by answer
POST /answers
Render candidates
```
