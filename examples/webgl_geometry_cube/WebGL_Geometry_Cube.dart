#import('dart:html');
#import('../../src/ThreeD.dart');

class WebgL_Geometry_Cube  {
  Element container;

  PerspectiveCamera camera;
  Scene scene;
  WebGLRenderer renderer;

  Mesh cube;
  
  void run() {
    init();
    animate();
  }
  
  void init() {
    
    container = new Element.tag('div');
    
    document.body.nodes.add( container );

    scene = new Scene();

    camera = new PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 1, 1000 );
    camera.position.z = 400;

    var geometry = new CubeGeometry( 200, 200, 200 );
    var material = new MeshBasicMaterial( { map: ImageUtils.loadTexture( 'textures/crate.gif' ) });

    cube = new Mesh( geometry, material);
    scene.add( cube );

    renderer = new WebGLRenderer();
    renderer.setSize( window.innerWidth, window.innerHeight );
    
    container.nodes.add( renderer.domElement );
    
    window.on.resize.add(onWindowResize);
  }
  
  function onWindowResize(e) {

    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();

    renderer.setSize( window.innerWidth, window.innerHeight );

  }

  bool animate(int time) {

    window.webkitRequestAnimationFrame( animate );

    cube.rotation.x += 0.005;
    cube.rotation.y += 0.01;

    renderer.render( scene, camera );

  }
  
}

void main() {
  new WebGL_Geometry_Cube().run();
}
