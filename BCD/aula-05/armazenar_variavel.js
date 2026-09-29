const entrada = require('readline-sync');
let total = 0;
let preco = -1; // Começa com um valor qualquer só para entrar no loop

while (preco !== 0) {
    preco = entrada.questionFloat("Digite o preco do produto (ou 0 para finalizar): ");
    total += preco;
}
console.log(`\nValor total da compra: R$ ${total.toFixed(2)}`);