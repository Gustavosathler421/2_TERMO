// 1. Importar a biblioteca
const entrada = require('readline-sync');

console.log("-------------------------------------");
console.log("   SISTEMA DE CLASSIFICAÇÃO: NATAÇÃO ");
console.log("-------------------------------------\n");

// 2. Entrada de Dados
const nome = entrada.question("Nome do atleta: ");
const idade = entrada.questionInt("Idade do atleta: ");

console.log(`\nAtleta: ${nome}`);

// 3. Lógica de Categorias (Uso do && para faixas de idade)
if (idade < 5) {
    console.log("SITUACAO: Muito jovem para a competicao.");
} 
else if (idade >= 5 && idade <= 10) {
    console.log("CATEGORIA: INFANTIL 👶");
} 
else if (idade >= 11 && idade <= 17) {
    console.log("CATEGORIA: JUVENIL 👦");
} 
else if (idade >= 18 && idade <= 60) {
    console.log("CATEGORIA: ADULTO 👨");
} 
else {
    // Se não for nenhuma das anteriores, só pode ser maior que 60
    console.log("CATEGORIA: SÊNIOR 👴");
}

console.log("-------------------------------------");