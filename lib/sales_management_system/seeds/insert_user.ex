defmodule SalesManagementSystem.Seeds.InsertUser do
    # Carrega as dependências do projeto
    Application.load(:sales_management_system)
    
    # Alias para a tabela de usuários e o repositório
    alias SalesManagementSystem.{User, Repo}
  
    # Importa os dados da API e salva na tabela de usuários
    def import_users do
      url = "https://jsonplaceholder.typicode.com/users"
      response = HTTPoison.get!(url)
      IO.inspect(url)
      users = response.body |> Jason.decode!()
  
      Enum.each(users, fn user ->
        changeset = User.changeset(%User{}, %{
          name: user["name"],
          email: user["email"],
          phone: user["phone"],
          address: "#{user["address"]["street"]}, #{user["address"]["suite"]}, #{user["address"]["city"]}, #{user["address"]["zipcode"]}",
          position: "lead null",
          hierarchy: "0"
        })
        
  
        case Repo.insert(changeset) do
          {:ok, _user} ->
            IO.puts "User #{user["name"]} created successfully"
          {:error, changeset} ->
            IO.puts "Error creating user #{user["name"]}: #{inspect changeset.errors}"
        end
      end)
    end
  
    # Chama a função de importação de dados
    def run do
        import_users()
      end
  end

  