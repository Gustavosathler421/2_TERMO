const fs = require('fs'); // Módulo nativo do Node para lidar com arquivos

// 1. Nossa lista de produtos (Objetos)
const produtos = [
    { id: 1, nome: "Parafuso", qtd: 100 },
    { id: 2, nome: "Porca", qtd: 250 },
    { id: 3, nome: "Arruela", qtd: 50 }
];

// 2. FUNÇÃO PARA SALVAR NO DISCO
function salvarDados() {
    // Transformamos a lista em texto (String)
    const dadosTexto = JSON.stringify(produtos, null, 2);
    
    // Gravamos o arquivo estoque.json
    fs.writeFileSync('estoque.json', dadosTexto);
    console.log("✅ Dados salvos com sucesso no arquivo estoque.json!");
}

// 3. FUNÇÃO PARA FILTRAR (USANDO O MÉTODO FILTER)
function verEstoqueBaixo() {
    console.log("\n--- Produtos com estoque baixo (menos de 100) ---");
    
    // O filter cria uma nova lista apenas com o que a gente quer
    const baixoEstoque = produtos.filter(p => p.qtd < 100);
    
    console.log(baixoEstoque);
}

// Executando
salvarDados();
verEstoqueBaixo();