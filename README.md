# Scraping Service

Este README documenta os passos necessários para configurar e executar o `scraping_service`.

### Versão do Ruby

- `3.1.6`

### Dependências do Sistema

- Certifique-se de ter o Docker e o Docker Compose instalados em sua máquina.

### Configuração

1. Clone o repositório `scraping_service`:

```bash
git clone https://github.com/Raphaelbsi/scraping_service.git
cd scraping_service
```

2. Construa e execute os contêineres Docker:

```bash
docker-compose up --build
```

3. Execute as migrações e popule o banco de dados:

```bash
docker-compose exec notification_service bundle exec rails db:create db:migrate
```

4. Execute a suíte de testes:

```bash
docker-compose exec scraping_service bundle exec rails db:create db:migrate
```

### Documentação da API

Endpoints de Scraping

- Criar Scraping
  - URL: /scrape
  - Método: POST
  - Corpo:

```json
{
  "url": "https://www.webmotors.com.br/comprar/chevrolet/cruze/14-turbo-lt-16v-flex-4p-automatico/4-portas/2022-2023/51047580?pos=a51047580p:&np=1",
  "task_id": 123,
  "user_id": 456
}
```

- Resposta

```json
{
  "status": "Scraping completed successfully",
  "data": {
    "id": 2,
    "task_id": 124,
    "user_id": 1,
    "make": "CHEVROLET",
    "model": "CRUZE",
    "price": "104390.0",
    "created_at": "2024-08-07T00:06:42.129Z",
    "updated_at": "2024-08-07T00:06:42.129Z",
    "city": "Serra",
    "year": "2023.0",
    "km": "38883.0",
    "transmission": "Automática",
    "body_type": "Sedã",
    "fuel": "Gasolina e álcool",
    "final_plate": "2.0",
    "color": "Branco",
    "trade": "N/A"
  }
}
```

- Listar Resultados de Scraping
  - URL: /scraping_results
  - Método: GET
  - Resposta:

```json
[
  {
    "id": 1,
    "task_id": 123,
    "user_id": 456,
    "make": "Chevrolet",
    "model": "Cruze",
    "price": "10000",
    "city": "São Paulo",
    "year": "2023",
    "km": "15000",
    "transmission": "Automático",
    "body_type": "Sedan",
    "fuel": "Gasolina",
    "final_plate": "ABC1234",
    "color": "Preto",
    "trade": "N/A"
  },
  {
    "id": 2,
    "task_id": 124,
    "user_id": 457,
    "make": "Ford",
    "model": "Fiesta",
    "price": "8000",
    "city": "Rio de Janeiro",
    "year": "2021",
    "km": "20000",
    "transmission": "Manual",
    "body_type": "Hatch",
    "fuel": "Flex",
    "final_plate": "XYZ5678",
    "color": "Vermelho",
    "trade": "N/A"
  }
]
```

## Exemplo de Comandos CURL

- Criar Scraping

```bash
curl --location 'http://localhost:3003/scrape' \
--header 'Content-Type: application/json' \
--data '{
    "url": "https://www.webmotors.com.br/comprar/chevrolet/cruze/14-turbo-lt-16v-flex-4p-automatico/4-portas/2022-2023/51047580?pos=a51047580p:&np=1",
    "task_id": 124,
    "user_id": 1
}'
```

- Listar Resultados de Scraping

```bash
curl --location 'http://localhost:3003/scraping_results'
```
