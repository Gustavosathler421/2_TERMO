const cinema = [
    { titulo: "Dumbo", censura: 0 },
    { titulo: "Deadpool", censura: 18 },
    { titulo: "Batman", censura: 12 }
];
const idadeUser = 14;
for (let i = 0; i < cinema.length; i++) {
    if (idadeUser >= cinema[i].censura) {
        console.log(`Pode ver: ${cinema[i].titulo}`);
    }
}