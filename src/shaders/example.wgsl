// Output of the vertex stage.
struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

// Fragment shader
@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    var col = vec3<f32>(in.uv.x, 0.0, 0.0);
    return vec4<f32>(col, 1.0);
}


