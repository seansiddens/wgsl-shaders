// Vertex shader
struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) uv: vec2<f32>,
};

@vertex
fn vs_main(
    @builtin(vertex_index) in_vertex_index: u32,
) -> VertexOutput {
    var out: VertexOutput;
    // out.clip_position = vec4<f32>(model.position, 1.0);
    let vertex_index = u32(in_vertex_index);
    let uv = vec2<f32>(f32((vertex_index << u32(1)) & u32(2)), f32(vertex_index & u32(2)));
    out.clip_position = vec4<f32>(uv * 2.0 + -1.0, 0.0, 1.0);
    out.uv = uv;
    return out;
}

// Fragment shader
@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    var col = vec3<f32>(in.uv.x);
    return vec4<f32>(col, 1.0);
}


