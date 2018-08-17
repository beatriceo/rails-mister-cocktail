/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import 'bootstrap';
// console.log('Hello World from Webpacker')
import anime from 'animejs'

var lineDrawing = anime({
  targets: 'path',
  strokeDashoffset: [anime.setDashoffset, 0],
  easing: 'easeInOutCubic',
  duration: 4000,
  begin: function(anim) {
    document.querySelector('path').setAttribute("stroke", "black");
    document.querySelector('path').setAttribute("fill", "none");
  },
  complete: function(anim) {
    document.querySelector('path').setAttribute("fill", "none");
  },
  autoplay: true
});


$('.ml6 .letters').each(function(){
  $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
});

anime.timeline({loop: false})
  .add({
    targets: '.ml6 .letter',
    translateY: ["1.0em", 0],
    translateZ: 0,
    duration: 2000,
    delay: function(el, i) {
      return 50 * i;
    }
  });
