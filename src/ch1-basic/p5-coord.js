let img;
let resolution;

function setup() {
  createCanvas(640, 480);
  img = createImage(width, height);
  resolution = createVector(width, height);
}

function draw() {
  img.loadPixels();
  for (let w = 0; w < width; w++) {
    for (let h = 0; h < height; h++) {
      const coord = createVector(w, h);
      const c = getPixel(coord, resolution);
      img.set(w, h, c);
    }
  }
  img.updatePixels();
  image(img, 0, 0); 
}

function getPixel(coord, resolution) {
  return color(
    255 * coord.x / resolution.x,
    255 * coord.y / resolution.y,
    0.0
  );
}