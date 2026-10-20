const alunos = ["Ana", "Bruno", "Carlos", "Diego"];

console.log("Lista de alunos:");
console.log(alunos);

console.log(`Primeiro aluno: ${alunos[0]}`);
console.log(`Segundo aluno: ${alunos[1]}`);
console.log(`Quantidade de alunos: ${alunos.length}`);

// acrescentar mais 2 nomes ao array
alunos.push("Eduardo");
alunos.push("Fernanda");

// mostrar o terceiro aluno
console.log(`Terceiro aluno: ${alunos[2]}`);

// mostrar o último aluno usando .length
console.log(`Último aluno: ${alunos[alunos.length - 1]}`);

// trocar um dos nomes diretamente pelo índice
alunos[1] = "Beatriz";

console.log("Lista atualizada:");
console.log(alunos);