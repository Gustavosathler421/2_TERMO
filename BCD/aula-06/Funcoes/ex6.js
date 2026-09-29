const entrada = require('readline-sync');

// Função que decide se a peca passa ou nao
function validarPeca(diametro) {
    if (diametro >= 20 && diametro <= 25) {
        return "APROVADA";
    } else {
        return "REPROVADA";
    }
}

console.log("--- CONTROLE DE QUALIDADE ---");

for (let i = 1; i <= 3; i++) {
    let leitura = entrada.questionFloat(`Digite o diametro da peca ${i} (mm): `);
    
    // A função recebe o número e devolve o texto do status
    let status = validarPeca(leitura);
    
    console.log(`Resultado da peca ${i}: ${status}\n`);
}