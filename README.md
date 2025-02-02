# E-commerce Database

Este projeto consiste em um banco de dados para um sistema de e-commerce, projetado para gerenciar fornecedores, produtos, clientes, pedidos, pagamentos e entregas. O banco de dados foi modelado para ser escalável e eficiente, seguindo as melhores práticas de normalização.

## Tecnologias Utilizadas

- **MySQL**: Banco de dados relacional utilizado para armazenar os dados.
- **MySQL Workbench**: Ferramenta para modelagem e gerenciamento do banco de dados.
- **Git**: Controle de versão do projeto.
- **GitHub**: Hospedagem do repositório.

## Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas principais:

### Tabelas Principais

1. **Fornecedor**:
   - Armazena informações dos fornecedores, como nome, CNPJ, endereço e telefone.

2. **Produto**:
   - Contém detalhes dos produtos, como categoria, descrição, valor e estoque.

3. **Vendedor**:
   - Gerencia os vendedores terceirizados, com informações como nome, CNPJ e localização.

4. **Cliente**:
   - Armazena dados dos clientes, incluindo nome, endereço e telefone.

5. **Pedido**:
   - Registra os pedidos feitos pelos clientes, com data e status.

6. **Pagamento**:
   - Gerencia os pagamentos associados aos pedidos, incluindo método e valor.

7. **Entrega**:
   - Controla o status e o código de rastreio das entregas.

### Relacionamentos

- Um **Fornecedor** pode fornecer vários **Produtos**.
- Um **Vendedor** pode vender vários **Produtos**.
- Um **Cliente** pode fazer vários **Pedidos**.
- Um **Pedido** pode ter vários **Pagamentos** e uma **Entrega**.

## Como Usar

### Pré-requisitos

- MySQL Server instalado.
- MySQL Workbench (opcional, para visualização do modelo).

### Passos para Configuração

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-user/E-commerce-refinado.git

2. Importe o  ```script SQL```  para o MySQL:
  - Abra o MySQL Workbench ou um cliente MySQL.
  - Execute o script.sql para criar o banco de dados e as tabelas.
3. Configure as credenciais do banco de dados no seu ambiente.

## Exemplos de Consultas

1. Listar todos os produtos em estoque:
```
SELECT * FROM Produto WHERE Estoque > 0;

```

2. Buscar pedidos de um cliente específico:
```
SELECT * FROM Pedido WHERE Cliente_idCliente = 1;
```
3. Calcular o total de vendas por vendedor:
```
SELECT Vendedor_idVendedor, SUM(Valor) AS TotalVendas
FROM Pagamento
JOIN Pedido ON Pagamento.Pedido_idPedido = Pedido.IdPedido
GROUP BY Vendedor_idVendedor;
```

## Contribuição

Contribuições são bem-vindas! Siga os passos abaixo:

Faça um fork do projeto.

Crie uma branch para sua feature (```git checkout -b feature/nova-feature```).

Commit suas alterações (```git commit -m 'Adicionando nova feature'```).

Push para a branch (```git push origin feature/nova-feature```).

Abra um Pull Request (```ex: https://github.com/seu-user/E-commerce-refinado```).

##

Este projeto está licenciado sob a [MIT License](LICENSE).


![GitHub Org's stars](https://img.shields.io/github/stars/julianamaula?style=social)



   
