const entrada = require('readline-sync');

// 1. Função para validar status (Aprovado/Reprovado)
function verificarStatus(nota) {
    return nota >= 7 ? "APROVADO" : "REPROVADO";
}

const turma = [];

// 2. Loop para cadastrar objetos no Array
for (let i = 0; i < 3; i++) {
    console.log(`\n--- Cadastro do Aluno ${i+1} ---`);
    let nomeAluno = entrada.question("Nome: ");
    let notaAluno = entrada.questionFloat("Nota: ");
    
    // Criando o objeto e guardando no Array
    const novoAluno = {
        nome: nomeAluno,
        nota: notaAluno,
        status: verificarStatus(notaAluno) // Usando a função aqui!
    };
    
    turma.push(novoAluno);
}

// 3. Exibindo o relatório final
console.log("\n======= RELATORIO FINAL =======");
for (let i = 0; i < turma.length; i++) {
    console.log(`${turma[i].nome} - Nota: ${turma[i].nota} | Status: ${turma[i].status}`);
}