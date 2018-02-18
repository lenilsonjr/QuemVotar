# QuemVotar

🇧🇷 Problemas para decidir seu voto?

## API

```javascript
// GET /questions
[
  {
    "id": 1,
    "title": "Pergunta Um",
    "choices": [
      "Sim",
      "Não"
    ]
  },
  {
    "id": 2,
    "title": "Pergunta Dois",
    "choices": [
      "Sim",
      "Não"
    ]
  },
  {
    "id": 3,
    "title": "Pergunta Três",
    "choices": [
      "Sim",
      "Não"
    ]
  }
]

// POST /answers
{
  [
     { id: 0, answer: 'string' },
     { id: 0, answer: 'string' }
  ]
}

// POST /answers [response]
[
  {
    "name": "Unity",
    "photo": "https://placehold.it/400x400.png",
    "description": "Great, now I have to take over an entire planet because of your stupid boobs."
  }
]
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
