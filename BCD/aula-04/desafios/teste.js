console.log("Meu primeiro programa executavel em JavaScript!");

console.log("\nPressione ENTER para sair.");

process.stdin.once("data", () => {
    process.exit();
});