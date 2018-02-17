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
  [
    { name: 'string', avatar: image, description: 'string' }
  ]
}
```
