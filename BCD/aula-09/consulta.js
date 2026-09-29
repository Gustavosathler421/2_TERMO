const fs = require('fs');
const entrada = require('readline-sync');

console.log("=== SISTEMA DE CONSULTA DE ESTOQUE ===\n");

try {
    // 1. LER o arquivo como texto bruto
    // O 'utf-8' serve para o computador entender acentos e cedilhas
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');

    // 2. CONVERTER o texto de volta para uma lista de Objetos (Array)
    const produtos = JSON.parse(dadosTexto);

    // 3. PEDIR o que o usuário deseja buscar
    const termoBusca = entrada.question("Digite o nome do produto para buscar: ");

    // 4. REALIZAR A BUSCA (Usando o método .find)
    // O .find percorre a lista e traz o primeiro que ele encontrar
    const resultado = produtos.find(p => p.nome.toLowerCase() === termoBusca.toLowerCase());

    // 5. MOSTRAR O RESULTADO
    if (resultado) {
        console.log("\n✅ PRODUTO ENCONTRADO:");
        console.log(`ID: ${resultado.id}`);
        console.log(`Nome: ${resultado.nome}`);
        console.log(`Quantidade em estoque: ${resultado.qtd}`);
    } else {
        console.log("\n❌ Sinto muito. Produto nao cadastrado no sistema.");
    }

} catch (erro) {
    console.log("Erro ao acessar o banco de dados: " + erro.message);
}