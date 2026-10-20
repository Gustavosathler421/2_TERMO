const entrada = require('readline-sync');

// Importando o nosso módulo (caixa de ferramentas)
const oficina = require('./funcoesOficina');

console.log("=== SISTEMA DE GESTAO DE OFICINA 2.0 ===");

// Entradas de dados
const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

// 1. Calculamos o orçamento bruto usando a ferramenta
const totalBruto = oficina.calcularOrcamento(peca, horas);

// 2. Verificamos a garantia usando a ferramenta
const statusGarantia = oficina.verificarGarantia(tempoUso);

// 3. Aplicamos o desconto de 5% usando a NOVA ferramenta
const totalComDesconto = oficina.aplicarDesconto(totalBruto);

// Relatório Final
console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento Bruto: R$ ${totalBruto.toFixed(2)}`);
console.log(`DESCONTO (5%):   R$ ${(totalBruto - totalComDesconto).toFixed(2)}`);
console.log(`TOTAL A PAGAR:   R$ ${totalComDesconto.toFixed(2)}`);
console.log(`Status:          ${statusGarantia}`);
console.log("----------------------------");