let total = 0; // O cofre começa vazio
let preco = -1; // Valor inicial "falso" só para começar o loop

// "Enquanto o preco digitado for diferente de 0..."
while (preco !== 0) {
    preco = entrada.questionFloat("Preco: R$ ");
    
    // Se o usuario não digitou 0 (que é o sinal de saída)
    if (preco !== 0) {
        total += preco; // Adiciona o preco ao cofre
        console.log(`Subtotal: R$ ${total.toFixed(2)}`);
    }
}