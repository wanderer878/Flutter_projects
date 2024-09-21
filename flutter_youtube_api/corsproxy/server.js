const express = require('express');
const cors = require('cors');
const axios = require('axios');

const app = express();
const PORT = 8080;

// Enable CORS for all requests
app.use(cors());

// Proxy route to fetch images
app.get('/proxy', async (req, res) => {
  const { url } = req.query;

  // Check if URL is provided
  if (!url) {
    return res.status(400).send('URL is required');
  }

  try {
    // Fetch the image from the provided URL
    const response = await axios.get(url, {
      responseType: 'arraybuffer', // Ensures binary response for images
    });

    // Set the appropriate content type and send the image
    res.set('Content-Type', response.headers['content-type']);
    res.send(response.data);
  } catch (error) {
    console.error('Error fetching the image:', error);
    res.status(500).send('Failed to load image');
  }
});

app.listen(PORT, () => {
  console.log(`CORS proxy server running on http://localhost:${PORT}`);
});
