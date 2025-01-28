## Passo: Inicializar o Ambiente

1. **Configurar o arquivo `.env` do diretorio:**
   -  Renomeie o arquivo `.env.example` para `.env`.
   - Atualize as configurações de banco de dados no arquivo `.env` do do docker:
   ```env
   UID=1000 # Substitua pelo UID do seu usuário
   GID=1000 # Substitua pelo GID do seu grupo
   
   # Configurações do Laravel
   APP_PORT=8080
   PHP_PORT=9000

   # Configurações do Banco de Dados
   POSTGRES_USER=laravel
   POSTGRES_PASSWORD=laravel
   POSTGRES_DB=laravel_db
   DB_PORT=5432

   # Configurações do pgAdmin
   PGADMIN_DEFAULT_EMAIL=admin@admin.com
   PGADMIN_DEFAULT_PASSWORD=admin
   PGADMIN_PORT=5050

2. **Subir os containers:**
   ```bash
   docker compose up -d
   ```

3. **Instalar o Laravel (se ainda não estiver instalado):**
   ```bash
   sudo rm -rf src/* && docker exec -it laravel_app composer create-project --prefer-dist laravel/laravel .
   ```

4. **Configurar o arquivo `.env` do Laravel:**
   -  Renomeie o arquivo `.env.example` para `.env`.
   - Atualize as configurações de banco de dados no arquivo `.env` do Laravel:
   - Credenciais de acordo com o que foi configurado no `.env` do docker.
   ```env
   DB_CONNECTION=pgsql
   DB_HOST=db
   DB_PORT=5432
   DB_DATABASE=laravel_db
   DB_USERNAME=laravel
   DB_PASSWORD=laravel
   ```

5. **Acessar os serviços:**
   - **Aplicação Laravel:** [http://localhost:8080](http://localhost:8080)
   - **pgAdmin:** [http://localhost:5050](http://localhost:5050) (usuário: `admin@admin.com`, senha: `admin`)

---

## Dicas

- **Permissões:** Certifique-se de que as pastas `storage` e `bootstrap/cache` do Laravel tenham as permissões corretas:
  ```bash
  docker exec -it laravel_app chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
   docker exec -it laravel_app chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
  ```

- **Logs:** Verifique os logs do Docker para identificar problemas:
  ```bash
  docker-compose logs -f
  ```

---
