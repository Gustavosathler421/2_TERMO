const entrada = require('readline-sync');
const idade = entrada.questionInt("Qual sua idade? ");

if (idade >= 18) {
    console.log("Acesso liberado! Divirta-se.");
} else {
    console.log("Acesso negado. Va para casa estudar Node.js!");
}