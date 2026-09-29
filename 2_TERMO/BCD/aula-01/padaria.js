// 1. Criando as caixas (Variáveis)
const nomePadaria = "Padaria do Senai"; // Texto
const nomeProduto = "Pão de Queijo";    // Texto
let precoUnitario = 2.50;               // Número (decimal)
let quantidadeVendida = 10;             // Número (inteiro)

// 2. Fazendo a conta
// O asterisco (*) é o sinal de multiplicação
let valorTotal = precoUnitario * quantidadeVendida;

// 3. Mostrando o resultado (Usando a crase ` para frases bonitas)
console.log(`Bem-vindo à ${nomePadaria}!`);
console.log(`Produto: ${nomeProduto}`);
console.log(`O valor total da venda é: R$ ${valorTotal}`);