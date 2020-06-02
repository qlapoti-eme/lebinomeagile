import { connect, createLocalTracks } from 'twilio-video';

const twilioInit = () => {
  const video = document.querySelector('.twilio-video');

  // Option 1
  createLocalTracks({
    audio: true,
    video: { width: 640 }
  }).then(localTracks => {
    return connect(video.dataset.token, {
      name: video.dataset.room,
      tracks: localTracks
    });
  }).then(room => {
    console.log(`Connected to Room: ${room.name}`);
  });
}

export default twilioInit;
