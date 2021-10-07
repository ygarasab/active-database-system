const PGPubSub = require('pg-notify');
const config = require('./config');

setTimeout(async () => {

    console.log("Starting logger...")

    const pubsub = new PGPubSub(config)
  
    await pubsub.connect()
  
    await pubsub.on('stock', (payload) => {
      console.log('Notification on stock channel: ', payload)
    })
  
  }, 10000)