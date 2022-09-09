// Output of the vertex stage.
struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

fn pcg2d(input: vec2<u32>) -> vec2<u32> {
    var v = input * 1664525u + 1013904223u;

    v.x += v.y * 1664525u;
    v.y += v.x * 1664525u;

    v = v ^ (vec2<u32>(v.x >> 16u, v.y >> 16u));

    v.x += v.y * 1664525u;
    v.y += v.x * 1664525u;

    v = v ^ (vec2<u32>(v.x >> 16u, v.y >> 16u));

    return v;
}


// Fragment shader
@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    let hash = vec2<u32>(in.uv * 100000.0);
    let rnd = vec2<f32>(pcg2d(hash)) * (1.0 / f32(0xffffffffu));
    let col = vec3<f32>(rnd.x);
    return vec4<f32>(col, 1.0);
}
