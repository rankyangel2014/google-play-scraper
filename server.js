import express from 'express';
import * as gplay from './index.js';

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/app/:appId', async (req, res) => {
  try {
    const result = await gplay.app({ appId: req.params.appId });
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/search', async (req, res) => {
  try {
    const result = await gplay.search({ term: req.query.term });
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});