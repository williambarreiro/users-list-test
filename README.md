## Tecnologias
- `Flutter` na versão 3.7.12;
- `Cubit` para gerenciamento de estados;
- `Modular` para injeção de dependências e gerenciamento de rotas;
- `Dio` como Client HTTP;
- `Sqflite` como database (para carregar usuários offline);
- `DotEnv` para o carregamento de variáveis de ambiente (como é apenas um exemplo,
 o arquivo `.env` está incluso no repositório);
- `Validatorless` para validações de input;

---

## Rodando o app

```bash
# Na pasta /server execute:
$ json_rest_server run

# Na pasta /app execute:
$ flutter pub get
$ flutter run
```