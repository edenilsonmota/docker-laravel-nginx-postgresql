## Passo: Inicializar o Ambiente

1. **Subir os containers:**
   ```bash
   docker-compose up -d
   ```

2. **Instalar o Laravel (se ainda não estiver instalado):**
   ```bash
   docker exec -it laravel_app composer create-project --prefer-dist laravel/laravel .
   ```

3. **Configurar o arquivo `.env` do Laravel:**
   -  Renomeie o arquivo `.env.example` para `.env`.
   - Atualize as configurações de banco de dados no arquivo `.env` do Laravel:
   ```env
   DB_CONNECTION=pgsql
   DB_HOST=db
   DB_PORT=5432
   DB_DATABASE=laravel_db
   DB_USERNAME=laravel
   DB_PASSWORD=laravel
   ```

4. **Acessar os serviços:**
   - **Aplicação Laravel:** [http://localhost:8080](http://localhost:8080)
   - **pgAdmin:** [http://localhost:5050](http://localhost:5050) (usuário: `admin@admin.com`, senha: `admin`)

---

## Dicas

- **Permissões:** Certifique-se de que as pastas `storage` e `bootstrap/cache` do Laravel tenham as permissões corretas:
  ```bash
  docker exec -it laravel_app chmod -R 775 storage bootstrap/cache
  ```

- **Logs:** Verifique os logs do Docker para identificar problemas:
  ```bash
  docker-compose logs -f
  ```

---