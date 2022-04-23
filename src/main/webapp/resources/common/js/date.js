const dateTime = new Date();

const orderYear = dateTime.getFullYear();
const orderMonth = dateTime.getMonth();
const orderDate = dateTime.getDate();

console.log(`${orderYear}-${orderMonth}-${orderDate}`);