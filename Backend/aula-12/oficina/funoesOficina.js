// --- ARQUIVO DE FUNÇÕES ---

function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00; 
    const totalMaoDeObra = horasTrabalho * valorHora;
    return precoPeca + totalMaoDeObra;
}

function verificarGarantia(meses) {
    if (meses <= 3) {
        return "Dentro da Garantia ✅";
    } else {
        return "Garantia Expirada ❌";
    }
}

// NOVA FUNÇÃO: Recebe o total e tira 5%
function aplicarDesconto(valorTotal) {
    return valorTotal * 0.95; // Multiplicar por 0.95 é o mesmo que tirar 5%
}

// IMPORTANTE: Adicionar a nova função na lista de exportação
module.exports = {
    calcularOrcamento,
    verificarGarantia,
    aplicarDesconto
};