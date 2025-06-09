import express from 'express';

const PORT = 3000;

const app = express();

app.get('/api/hello', (_req, res) => {
  res.json('Hello from Typescript backend 🥰🥰🥰');
});

app.listen(PORT, error => {
  if (error) {
    console.group('Failed to start backend server');
    console.error(error);
    console.groupEnd();

    return;
  }

  console.group('--- --- --- --- --- --- --- --- --- --- ');
  console.log(`Server is running at http://localhost:${PORT}`);
  console.group('--- --- --- --- --- --- --- --- --- --- ');
});
