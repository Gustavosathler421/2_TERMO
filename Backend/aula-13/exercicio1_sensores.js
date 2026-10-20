const fs = require('fs');

const sensores = [
{ codigo: 886, tipo: "Temperatura", leituraAtual: 84.2, status: "Operando" },
{ codigo: 887, tipo: "Pressão", leituraAtual: 6.7, status: "Operando" },
{ codigo: 888, tipo: "Temperatura", leituraAtual: 102.4, status: "Alerta" }
];

const dadosJSON = JSON.stringify(sensores, null, 2);
fs.writeFileSync('sensores.json', dadosJSON);
console.log("Arquivo 'sensores.json' gerado com sucesso.");