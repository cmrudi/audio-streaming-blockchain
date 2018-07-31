'use strict';
/**
 * Write your transction processor functions here
 */

/**
 * Sample transaction
 * @param {org.example.mynetwork2.Streaming} streamData
 * @transaction
 */
async function onStreaming(streamData) {
    /*var music = streamData.relatedMusic;
    music.totalStreaming = music.totalStreaming + 1;

    const musicRegistry = await getAssetRegistry('org.example.mynetwork2.Music');
    await musicRegistry.update(music);*/
    if (streamData == null) {
      throw new Error('Listing is not FOR SALE');
    }
}
