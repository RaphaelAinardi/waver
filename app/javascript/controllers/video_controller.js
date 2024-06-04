import { Controller } from "@hotwired/stimulus";
// import { videojs } from "video.js";

export default class extends Controller {
  connect() {
    this.player = videojs.getPlayer(this.element);
    console.log(this.player);
    // this.player = videojs(this.element, options, function onPlayerReady() {
    //   videojs.log('Your player is ready!');

    //   // In this context, `this` is the player that was created by Video.js.
    //   this.play();

    //   // How about an event listener?
    //   this.on('ended', function() {
    //     videojs.log('Awww...over so soon?!');
    //   });
    // });
  }
}
