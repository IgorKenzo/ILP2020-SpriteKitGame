//
//  shader.fsh
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 21/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

//void main() {
//
////    vec4 val = texture2D(u_texture, v_tex_coord);
////
////    if(val.a == 0.0){
////        gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0); // The Color White in RGBA format
////    }else {
////        gl_FragColor = val;
////    }

//
//}

//
// void main() {
//
//     // Load the pixel from our original texture, and the same place in the gradient circle
//     vec4 val = texture2D(u_texture, v_tex_coord);
//     vec4 grad = texture2D(u_gradient, v_tex_coord);
//
//     // [1 - ORIGINAL CHECK] If the original is transparent AND
//     // [2 - HEALTH CHECK] The gradient image has a black value less than the remaining health AND
//     // [3 - MASKING] The gradient pixel is not transparent
//     if (val.a < 0.1 && grad.r < u_health && grad.a > 0.8) {
//         gl_FragColor = vec4(0.0,1.0,0.0,1.0);
//     } else {
//         gl_FragColor = val;
//     }
// }

//void main() {
//    vec2 coord = gl_FragCoord.xy / u_sprite_size;
//    vec3 color = vec3(0.0);
//    vec2 translate = vec2(-0.5);
//
//    color.r += abs(0.1 + length(coord));
//
//    gl_FragColor = vec4(color,1.0);
//
//}

#ifdef GL_ES
precision mediump float;
#endif

float circleShape(vec2 pos, float radius) {
    return step(radius, length(pos - vec2(0.5)));
}

//void main(){
//    vec2 coord = gl_FragCoord.xy /  u_resolution;
//    vec3 color = vec3(0.0);
//    vec2 translate = vec2(-1.225, -2.7);
//    coord += translate;
//    color.r += abs(0.1 + length(coord) - 0.6 * abs(sin(u_time * 0.9 / 12.0))); //abs(0.1 + length(coord) - 0.6);
//    color.g += abs(0.1 + length(coord) - 0.6 * abs(sin(u_time * 0.6 / 4.0))); //abs(0.1 + length(coord) - 0.6);
//    color.b += abs(0.1 + length(coord) - 0.6 * abs(sin(u_time * 0.3 / 9.0))); //abs(0.1 + length(coord) - 0.6);
//
//    gl_FragColor = vec4(0.1 / color, 0.4);
//}

float circle(in vec2 _st, in float _radius){
    vec2 dist = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(dist,dist)*4.0);
}

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution;
    
    vec2 translate = vec2(-1.0,-2.0);
     st += translate;

    vec3 color = vec3(circle(st,2.0));

    gl_FragColor = vec4( color, 1.0 );
}
//
//void main()
//{
//    vec2 coord = gl_FragCoord.xy / u_resolution;
//    vec2 translate = vec2(0.5);
//    coord += translate;
//    vec3 color = vec3(0.0);
//    float circle = circleShape(coord, 1.0);
//
//    color = vec3(circle);
//
//    gl_FragColor = vec4(color,1.0);
//
//}
//
