const entrada = require('readline-sync');

const velocidade = entrada.questionFloat("Qual a velocidade do carro? ");

if (velocidade <=80) {
    console.log("Boa Viagem!");
} else if (velocidade >80 && velocidade <= 100) {
    console.log("Multa leve: R$130,00");
} else {
    console.log("Multa grave: R$800,00 + Apreensão da CNH)")
}
