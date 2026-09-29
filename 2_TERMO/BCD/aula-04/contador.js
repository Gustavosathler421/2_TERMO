let contador = 0;

// Vamos contar de 0 até 50, pulando de 5 em 5
while (contador <= 50) {
    console.log(`Valor atual: ${contador}`);
    
    // Em vez de contador++, usamos += 5
    contador += 5; 
}

console.log("Fim da contagem de 5 em 5!");