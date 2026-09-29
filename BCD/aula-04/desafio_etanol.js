// 1. Importar a biblioteca
const entrada = require('readline-sync');

console.log("-------------------------------------");
console.log("   QUAL COMPENSA MAIS: ALCOOL OU GASOSA? ");
console.log("-------------------------------------\n");

// 2. Entrada de Preços
const precoAlcool = entrada.questionFloat("Preco do litro do Alcool: ");
const precoGasolina = entrada.questionFloat("Preco do litro da Gasolina: ");

// 3. O Cálculo (A regra dos 70%)
// Dividimos o preço do álcool pelo da gasolina para ver a proporção
const resultado = precoAlcool / precoGasolina;

console.log(`\nProporcao calculada: ${resultado.toFixed(2)}`);

// 4. Lógica de Decisão
// Se o resultado for menor que 0.7 (70%), o álcool é mais vantajoso
if (resultado < 0.7) {
    console.log("-------------------------------------");
    console.log("RESULTADO: ABASTEÇA COM ALCOOL! 🌿");
    console.log("O preco do alcool esta abaixo de 70% da gasolina.");
    console.log("-------------------------------------");
} else {
    console.log("-------------------------------------");
    console.log("RESULTADO: ABASTEÇA COM GASOLINA! ⛽");
    console.log("O preco do alcool nao compensa no momento.");
    console.log("-------------------------------------");
}