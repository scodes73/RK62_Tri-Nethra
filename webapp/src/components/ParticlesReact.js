import React, { Component } from "react";
import Particles from "react-particles-js";
class Party extends Component {
  render() {
    return (
      <div style={{ width: "100%", height: "100%" }}>
        <Particles
          height="100vh"
          width="100vw"
          params={{
            particles: {
              number: {
                value: 150,
                density: {
                  enable: true,
                  value_area: 1800,
                },
              },
              color: {
                value: "#3CA9D1",
              },
              shape: {
                type: "circle",
                stroke: {
                  width: 4,
                  color: "#3CA9D1",
                },
                polygon: {
                  nb_sides: 3,
                },
                image: {
                  src: "",
                  width: 100,
                  height: 100,
                },
              },
              opacity: {
                value: 1,
                random: false,
                anim: {
                  enable: false,
                  speed: 2,
                  opacity_min: 0,
                  sync: false,
                },
              },
              size: {
                value: 1,
                random: false,
                anim: {
                  enable: false,
                  speed: 10,
                  size_min: 0.1,
                  sync: false,
                },
              },
              line_linked: {
                enable: true,
                distance: 200,
                color: "#3CA9D1",
                opacity: 1,
                width: 1,
              },
              move: {
                enable: true,
                speed: 2,
                direction: "none",
                random: false,
                straight: false,
                out_mode: "out",
                bounce: false,
                attract: {
                  enable: false,
                  rotateX: 3000,
                  rotateY: 3000,
                },
              },
            },
            interactivity: {
              detect_on: "window",
              events: {
                onhover: {
                  enable: true,
                  mode: "repulse",
                },
                onclick: {
                  enable: false,
                  mode: "repulse",
                },
                resize: true,
              },
              modes: {
                grab: {
                  distance: 200,
                  line_linked: {
                    opacity: 1,
                  },
                },
                bubble: {
                  distance: 200,
                  size: 80,
                  duration: 2,
                  opacity: 8,
                  speed: 3,
                },
                repulse: {
                  distance: 150,
                  duration: 2
                  
                },
                push: {
                  particles_nb: 2,
                },
                remove: {
                  particles_nb: 2,
                },
              },
            },
            retina_detect: false,
          }}
        />
      </div>
    );
  }
}

export default Party;
