const entrada = require('readline-sync');

console.log("=== SISTEMA DE DIVISAO SEGURA ===");

try {
    // Tentamos fazer algo que pode dar erro
    const num1 = entrada.questionInt("Digite o primeiro numero: ");
    const num2 = entrada.questionInt("Digite o segundo numero: ");

    if (num2 === 0) {
        // Criamos o nosso proprio erro se alguem tentar dividir por zero
        throw new Error("Nao e possivel dividir por zero!");
    }

    const resultado = num1 / num2;
    console.log(`O resultado da divisao e: ${resultado}`);

} catch (erro) {
    // Se qualquer erro acontecer no 'try', o código pula para cá
    console.log("\n[ERRO NO SISTEMA]");
    console.log(`Mensagem: ${erro.message}`);
    console.log("Por favor, tente novamente digitando apenas numeros validos.");
}

console.log("\nO programa continua rodando normalmente...");