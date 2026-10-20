const entrada = require("readline-sync");

console.log("=== CONTROLE DE ACESSO AO LABORATORIO ===");

const idade = entrada.questionInt("Digite a idade do aluno: ");

const autorizacao = entrada.question(
    "Possui autorizacao? (S/N): "
).toUpperCase();

const acompanhado = entrada.question(
    "Esta acompanhado por um professor? (S/N): "
).toUpperCase();

if (
    (idade >= 16 && autorizacao === "S") ||
    acompanhado === "S"
) {
    console.log("ACESSO LIBERADO");
} else {
    console.log("ACESSO NEGADO");
}

console.log("\nPressione ENTER para fechar...");
entrada.question();