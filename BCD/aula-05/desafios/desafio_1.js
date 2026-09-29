const entrada = require("readline-sync");

console.log("=== REGISTRO DE TEMPERATURAS ===");

// Cria um array vazio
const temperaturas = [];

// Pergunta quantas temperaturas serão registradas
const quantidade = entrada.questionInt(
    "Quantas temperaturas deseja registrar? "
);

// Repete de acordo com a quantidade informada
for (let i = 0; i < quantidade; i++) {

    let temperatura = entrada.questionFloat(
        `Temperatura ${i + 1}: `
    );

    // Adiciona a temperatura no array
    temperaturas.push(temperatura);
}

console.log("\n--- RELATORIO ---");

// Mostra todas as temperaturas
console.log(
    `Temperaturas registradas: ${temperaturas.join(" °C | ")} °C`
);

// Mostra a quantidade de registros
console.log(
    `Quantidade de registros: ${temperaturas.length}`
);

// Mostra a primeira temperatura
console.log(
    `Primeira temperatura: ${temperaturas[0]} °C`
);

// Mostra a última temperatura
console.log(
    `Ultima temperatura: ${temperaturas[temperaturas.length - 1]} °C`
);