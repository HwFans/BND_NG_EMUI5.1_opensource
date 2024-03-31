#!/bin/bash


need_pass=198
failures=0
PIGLIT_PATH=/usr/local/piglit/lib/piglit/
export PIGLIT_SOURCE_DIR=/usr/local/piglit/lib/piglit/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PIGLIT_PATH/lib
export DISPLAY=:0
export XAUTHORITY=/home/chronos/.Xauthority


function run_test()
{
  local name="$1"
  local time="$2"
  local command="$3"
  echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  echo "+ Running test [$name] of expected runtime $time sec: [$command]"
  sync
  $command
  if [ $? == 0 ] ; then
    let "need_pass--"
    echo "+ pass :: $name"
  else
    let "failures++"
    echo "+ fail :: $name"
  fi
}


pushd $PIGLIT_PATH
run_test "shaders/glsl-fs-mov-masked" 0.0 "bin/shader_runner tests/shaders/glsl-fs-mov-masked.shader_test -auto"
run_test "shaders/glsl-fs-neg" 0.0 "bin/shader_runner tests/shaders/glsl-fs-neg.shader_test -auto"
run_test "shaders/glsl-fs-neg-abs" 0.0 "bin/shader_runner tests/shaders/glsl-fs-neg-abs.shader_test -auto"
run_test "shaders/glsl-fs-neg-dot" 0.0 "bin/shader_runner tests/shaders/glsl-fs-neg-dot.shader_test -auto"
run_test "shaders/glsl-fs-pointcoord" 0.0 "bin/glsl-fs-pointcoord -fbo -auto"
run_test "shaders/glsl-fs-post-increment-01" 0.0 "bin/shader_runner tests/shaders/glsl-fs-post-increment-01.shader_test -auto"
run_test "shaders/glsl-fs-reflect" 0.0 "bin/shader_runner tests/shaders/glsl-fs-reflect.shader_test -auto"
run_test "shaders/glsl-fs-sampler-numbering" 0.0 "bin/glsl-fs-sampler-numbering -fbo -auto"
run_test "shaders/glsl-fs-sampler-numbering-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-sampler-numbering-2.shader_test -auto"
run_test "shaders/glsl-fs-sampler-numbering-3" 0.0 "bin/shader_runner tests/shaders/glsl-fs-sampler-numbering-3.shader_test -auto"
run_test "shaders/glsl-fs-sign" 0.0 "bin/shader_runner tests/shaders/glsl-fs-sign.shader_test -auto"
run_test "shaders/glsl-fs-sqrt-branch" 0.0 "bin/glsl-fs-sqrt-branch -fbo -auto"
run_test "shaders/glsl-fs-statevar-call" 0.0 "bin/shader_runner tests/shaders/glsl-fs-statevar-call.shader_test -auto"
run_test "shaders/glsl-fs-step" 0.0 "bin/shader_runner tests/shaders/glsl-fs-step.shader_test -auto"
run_test "shaders/glsl-fs-struct-equal" 0.0 "bin/shader_runner tests/shaders/glsl-fs-struct-equal.shader_test -auto"
run_test "shaders/glsl-fs-struct-notequal" 0.0 "bin/shader_runner tests/shaders/glsl-fs-struct-notequal.shader_test -auto"
run_test "shaders/glsl-fs-swizzle-1" 0.0 "bin/shader_runner tests/shaders/glsl-fs-swizzle-1.shader_test -auto"
run_test "shaders/glsl-fs-tan-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-tan-2.shader_test -auto"
run_test "shaders/glsl-fs-texture2d" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-bias" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-bias.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-branching" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-branching.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-dependent-1" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-dependent-1.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-dependent-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-dependent-2.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-dependent-3" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-dependent-3.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-dependent-4" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-dependent-4.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-dependent-5" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-dependent-5.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-masked" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-masked.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-masked-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-masked-2.shader_test -auto"
run_test "shaders/glsl-fs-texture2d-masked-4" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2d-masked-4.shader_test -auto"
run_test "shaders/glsl-fs-texture2dproj" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2dproj.shader_test -auto"
run_test "shaders/glsl-fs-texture2dproj-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2dproj-2.shader_test -auto"
run_test "shaders/glsl-fs-texture2dproj-bias" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2dproj-bias.shader_test -auto"
run_test "shaders/glsl-fs-texture2dproj-bias-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-texture2dproj-bias-2.shader_test -auto"
run_test "shaders/glsl-fs-texture2drect" 0.0 "bin/glsl-fs-texture2drect -fbo -auto"
run_test "shaders/glsl-fs-texture2drect-proj3" 0.0 "bin/glsl-fs-texture2drect -proj3 -fbo -auto"
run_test "shaders/glsl-fs-texture2drect-proj4" 0.0 "bin/glsl-fs-texture2drect -proj4 -fbo -auto"
run_test "shaders/glsl-fs-texturecube" 0.0 "bin/glsl-fs-texturecube -fbo -auto"
run_test "shaders/glsl-fs-texturecube-2" 0.0 "bin/glsl-fs-texturecube-2 -fbo -auto"
run_test "shaders/glsl-fs-texturecube-2-bias" 0.0 "bin/glsl-fs-texturecube-2 -bias -fbo -auto"
run_test "shaders/glsl-fs-texturecube-bias" 0.0 "bin/glsl-fs-texturecube -bias -fbo -auto"
run_test "shaders/glsl-fs-textureenvcolor-statechange" 0.0 "bin/glsl-fs-textureenvcolor-statechange -fbo -auto"
run_test "shaders/glsl-fs-uniform-array-1" 0.0 "bin/shader_runner tests/shaders/glsl-fs-uniform-array-1.shader_test -auto"
run_test "shaders/glsl-fs-uniform-array-3" 0.0 "bin/shader_runner tests/shaders/glsl-fs-uniform-array-3.shader_test -auto"
run_test "shaders/glsl-fs-uniform-array-4" 0.0 "bin/shader_runner tests/shaders/glsl-fs-uniform-array-4.shader_test -auto"
run_test "shaders/glsl-fs-uniform-array-loop-unroll" 0.0 "bin/shader_runner tests/shaders/glsl-fs-uniform-array-loop-unroll.shader_test -auto"
run_test "shaders/glsl-fs-uniform-bool-1" 0.0 "bin/shader_runner tests/shaders/glsl-fs-uniform-bool-1.shader_test -auto"
run_test "shaders/glsl-fs-uniform-bool-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-uniform-bool-2.shader_test -auto"
run_test "shaders/glsl-fs-uniform-sampler-array" 0.0 "bin/shader_runner tests/shaders/glsl-fs-uniform-sampler-array.shader_test -auto"
run_test "shaders/glsl-fs-user-varying-ff" 0.0 "bin/glsl-fs-user-varying-ff -fbo -auto"
run_test "shaders/glsl-fs-vec4-indexing-1" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-indexing-1.shader_test -auto"
run_test "shaders/glsl-fs-vec4-indexing-2" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-indexing-2.shader_test -auto"
run_test "shaders/glsl-fs-vec4-indexing-3" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-indexing-3.shader_test -auto"
run_test "shaders/glsl-fs-vec4-indexing-4" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-indexing-4.shader_test -auto"
run_test "shaders/glsl-fs-vec4-indexing-5" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-indexing-5.shader_test -auto"
run_test "shaders/glsl-fs-vec4-indexing-6" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-indexing-6.shader_test -auto"
run_test "shaders/glsl-fs-vec4-indexing-7" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-indexing-7.shader_test -auto"
run_test "shaders/glsl-fs-vec4-operator-equal" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-operator-equal.shader_test -auto"
run_test "shaders/glsl-fs-vec4-operator-notequal" 0.0 "bin/shader_runner tests/shaders/glsl-fs-vec4-operator-notequal.shader_test -auto"
run_test "shaders/glsl-function-chain16" 0.0 "bin/shader_runner tests/shaders/glsl-function-chain16.shader_test -auto"
run_test "shaders/glsl-function-prototype" 0.0 "bin/shader_runner tests/shaders/glsl-function-prototype.shader_test -auto"
run_test "shaders/glsl-getactiveuniform-array-size" 0.0 "bin/glsl-getactiveuniform-array-size -fbo -auto"
run_test "shaders/glsl-getactiveuniform-count: glsl-getactiveuniform-length" 0.0 "bin/glsl-getactiveuniform-count shaders/glsl-getactiveuniform-length.vert 1 -fbo -auto"
run_test "shaders/glsl-getactiveuniform-length" 0.0 "bin/glsl-getactiveuniform-length -fbo -auto"
run_test "shaders/glsl-getattriblocation" 0.0 "bin/glsl-getattriblocation -fbo -auto"
run_test "shaders/glsl-gnome-shell-dim-window" 0.0 "bin/shader_runner tests/shaders/glsl-gnome-shell-dim-window.shader_test -auto"
run_test "shaders/glsl-if-assign-call" 0.0 "bin/shader_runner tests/shaders/glsl-if-assign-call.shader_test -auto"
run_test "shaders/glsl-implicit-conversion-01" 0.0 "bin/shader_runner tests/shaders/glsl-implicit-conversion-01.shader_test -auto"
run_test "shaders/glsl-implicit-conversion-02" 0.0 "bin/shader_runner tests/shaders/glsl-implicit-conversion-02.shader_test -auto"
run_test "shaders/glsl-inexact-overloads" 0.0 "bin/shader_runner tests/shaders/glsl-inexact-overloads.shader_test -auto"
run_test "shaders/glsl-inout-struct-01" 0.0 "bin/shader_runner tests/shaders/glsl-inout-struct-01.shader_test -auto"
run_test "shaders/glsl-inout-struct-02" 0.0 "bin/shader_runner tests/shaders/glsl-inout-struct-02.shader_test -auto"
run_test "shaders/glsl-invalid-asm-01" 0.0 "bin/glsl-invalid-asm-01 -fbo -auto"
run_test "shaders/glsl-invalid-asm-02" 0.0 "bin/glsl-invalid-asm-02 -fbo -auto"
run_test "shaders/glsl-invariant-pragma" 0.0 "bin/shader_runner tests/shaders/glsl-invariant-pragma.shader_test -auto"
run_test "shaders/glsl-kwin-blur-1" 0.0 "bin/glsl-kwin-blur-1 -fbo -auto"
run_test "shaders/glsl-light-model" 0.0 "bin/glsl-light-model -fbo -auto"
run_test "shaders/glsl-link-array-01" 0.0 "bin/shader_runner tests/shaders/glsl-link-array-01.shader_test -auto"
run_test "shaders/glsl-link-bug30552" 0.0 "bin/glsl-link-bug30552 -fbo -auto"
run_test "shaders/glsl-link-bug38015" 0.0 "bin/glsl-link-bug38015 -fbo -auto"
run_test "shaders/glsl-link-empty-prog-01" 0.0 "bin/glsl-link-empty-prog-01 -fbo -auto"
run_test "shaders/glsl-link-empty-prog-02" 0.0 "bin/glsl-link-empty-prog-02 -fbo -auto"
run_test "shaders/glsl-link-unnamed-types" 0.0 "bin/shader_runner tests/shaders/glsl-link-unnamed-types.shader_test -auto"
run_test "shaders/glsl-link-varying-TexCoord" 0.0 "bin/shader_runner tests/shaders/glsl-link-varying-TexCoord.shader_test -auto"
run_test "shaders/glsl-link-varyings-1" 0.0 "bin/shader_runner tests/shaders/glsl-link-varyings-1.shader_test -auto"
run_test "shaders/glsl-link-varyings-2" 0.0 "bin/shader_runner tests/shaders/glsl-link-varyings-2.shader_test -auto"
run_test "shaders/glsl-link-varyings-3" 0.0 "bin/shader_runner tests/shaders/glsl-link-varyings-3.shader_test -auto"
run_test "shaders/glsl-lod-bias" 0.0 "bin/glsl-lod-bias -fbo -auto"
run_test "shaders/glsl-mat-110" 0.0 "bin/shader_runner tests/shaders/glsl-mat-110.shader_test -auto"
run_test "shaders/glsl-mat-attribute" 0.0 "bin/glsl-mat-attribute -fbo -auto"
run_test "shaders/glsl-mat-from-int-ctor-01" 0.0 "bin/shader_runner tests/shaders/glsl-mat-from-int-ctor-01.shader_test -auto"
run_test "shaders/glsl-mat-from-int-ctor-02" 0.0 "bin/shader_runner tests/shaders/glsl-mat-from-int-ctor-02.shader_test -auto"
run_test "shaders/glsl-mat-from-int-ctor-03" 0.0 "bin/shader_runner tests/shaders/glsl-mat-from-int-ctor-03.shader_test -auto"
run_test "shaders/glsl-mat-from-vec-ctor-01" 0.0 "bin/shader_runner tests/shaders/glsl-mat-from-vec-ctor-01.shader_test -auto"
run_test "shaders/glsl-mat-mul-1" 0.0 "bin/shader_runner tests/shaders/glsl-mat-mul-1.shader_test -auto"
run_test "shaders/glsl-max-vertex-attrib" 0.0 "bin/glsl-max-vertex-attrib -fbo -auto"
run_test "shaders/glsl-novertexdata" 0.0 "bin/glsl-novertexdata -fbo -auto"
run_test "shaders/glsl-octal" 0.0 "bin/shader_runner tests/shaders/glsl-octal.shader_test -auto"
run_test "shaders/glsl-orangebook-ch06-bump" 0.0 "bin/glsl-orangebook-ch06-bump -fbo -auto"
run_test "shaders/glsl-override-builtin" 0.0 "bin/shader_runner tests/shaders/glsl-override-builtin.shader_test -auto"
run_test "shaders/glsl-override-builtin-2" 0.0 "bin/shader_runner tests/shaders/glsl-override-builtin-2.shader_test -auto"
run_test "shaders/glsl-pp-elif-no-expression-1" 0.0 "bin/shader_runner tests/shaders/glsl-pp-elif-no-expression-1.shader_test -auto"
run_test "shaders/glsl-precision-110" 0.0 "bin/shader_runner tests/shaders/glsl-precision-110.shader_test -auto"
run_test "shaders/glsl-preprocessor-comments" 0.0 "bin/glsl-preprocessor-comments -fbo -auto"
run_test "shaders/glsl-reload-source" 0.0 "bin/glsl-reload-source -fbo -auto"
run_test "shaders/glsl-routing" 0.0 "bin/glsl-routing -fbo -auto"
run_test "shaders/glsl-struct-constructor-01" 0.0 "bin/shader_runner tests/shaders/glsl-struct-constructor-01.shader_test -auto"
run_test "shaders/glsl-texcoord-array-2" 0.0 "bin/shader_runner tests/shaders/glsl-texcoord-array-2.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-1" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-1.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-2" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-2.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-3" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-3.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-4" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-4.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-5" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-5.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-6" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-6.shader_test -auto"
run_test "shaders/glsl-uniform-initializer-7" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-initializer-7.shader_test -auto"
run_test "shaders/glsl-uniform-linking-1" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-linking-1.shader_test -auto"
run_test "shaders/glsl-uniform-non-uniform-array-compare" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-non-uniform-array-compare.shader_test -auto"
run_test "shaders/glsl-uniform-out-of-bounds" 0.0 "bin/glsl-uniform-out-of-bounds -fbo -auto"
run_test "shaders/glsl-uniform-out-of-bounds-2" 0.0 "bin/glsl-uniform-out-of-bounds-2 -fbo -auto"
run_test "shaders/glsl-uniform-struct" 0.0 "bin/shader_runner tests/shaders/glsl-uniform-struct.shader_test -auto"
run_test "shaders/glsl-uniform-update" 0.0 "bin/glsl-uniform-update -fbo -auto"
run_test "shaders/glsl-unused-varying" 0.0 "bin/glsl-unused-varying -fbo -auto"
run_test "shaders/glsl-useprogram-displaylist" 0.0 "bin/glsl-useprogram-displaylist -fbo -auto"
run_test "shaders/glsl-varying-mat3x2" 0.0 "bin/shader_runner tests/shaders/glsl-varying-mat3x2.shader_test -auto"
run_test "shaders/glsl-varying-read" 0.0 "bin/shader_runner tests/shaders/glsl-varying-read.shader_test -auto"
run_test "shaders/glsl-vec-array" 0.0 "bin/shader_runner tests/shaders/glsl-vec-array.shader_test -auto"
run_test "shaders/glsl-vs-abs-attribute" 0.0 "bin/shader_runner tests/shaders/glsl-vs-abs-attribute.shader_test -auto"
run_test "shaders/glsl-vs-abs-neg" 0.0 "bin/shader_runner tests/shaders/glsl-vs-abs-neg.shader_test -auto"
run_test "shaders/glsl-vs-abs-neg-with-intermediate" 0.0 "bin/shader_runner tests/shaders/glsl-vs-abs-neg-with-intermediate.shader_test -auto"
run_test "shaders/glsl-vs-all-01" 0.0 "bin/shader_runner tests/shaders/glsl-vs-all-01.shader_test -auto"
run_test "shaders/glsl-vs-all-02" 0.0 "bin/shader_runner tests/shaders/glsl-vs-all-02.shader_test -auto"
run_test "shaders/glsl-vs-array-redeclaration" 0.0 "bin/shader_runner tests/shaders/glsl-vs-array-redeclaration.shader_test -auto"
run_test "shaders/glsl-vs-arrays" 0.0 "bin/glsl-vs-arrays -fbo -auto"
run_test "shaders/glsl-vs-arrays-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-arrays-2.shader_test -auto"
run_test "shaders/glsl-vs-arrays-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-arrays-3.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-01" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-01.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-02" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-02.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-03" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-03.shader_test -auto"
run_test "shaders/glsl-vs-channel-overwrite-04" 0.0 "bin/shader_runner tests/shaders/glsl-vs-channel-overwrite-04.shader_test -auto"
run_test "shaders/glsl-vs-clamp-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-clamp-1.shader_test -auto"
run_test "shaders/glsl-vs-constructor-call" 0.0 "bin/shader_runner tests/shaders/glsl-vs-constructor-call.shader_test -auto"
run_test "shaders/glsl-vs-continue-inside-do-while" 0.0 "bin/shader_runner tests/shaders/glsl-vs-continue-inside-do-while.shader_test -auto"
run_test "shaders/glsl-vs-copy-propagation-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-copy-propagation-1.shader_test -auto"
run_test "shaders/glsl-vs-cross" 0.0 "bin/shader_runner tests/shaders/glsl-vs-cross.shader_test -auto"
run_test "shaders/glsl-vs-cross-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-cross-2.shader_test -auto"
run_test "shaders/glsl-vs-cross-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-cross-3.shader_test -auto"
run_test "shaders/glsl-vs-deadcode-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-deadcode-1.shader_test -auto"
run_test "shaders/glsl-vs-deadcode-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-deadcode-2.shader_test -auto"
run_test "shaders/glsl-vs-dot-vec2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-dot-vec2.shader_test -auto"
run_test "shaders/glsl-vs-double-negative-copy-propagation" 0.0 "bin/shader_runner tests/shaders/glsl-vs-double-negative-copy-propagation.shader_test -auto"
run_test "shaders/glsl-vs-f2b" 0.0 "bin/shader_runner tests/shaders/glsl-vs-f2b.shader_test -auto"
run_test "shaders/glsl-vs-ff-frag" 0.0 "bin/shader_runner tests/shaders/glsl-vs-ff-frag.shader_test -auto"
run_test "shaders/glsl-vs-functions" 0.0 "bin/glsl-vs-functions -fbo -auto"
run_test "shaders/glsl-vs-functions-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-functions-2.shader_test -auto"
run_test "shaders/glsl-vs-functions-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-functions-3.shader_test -auto"
run_test "shaders/glsl-vs-if-bool" 0.0 "bin/glsl-vs-if-bool -fbo -auto"
run_test "shaders/glsl-vs-if-greater" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-greater.shader_test -auto"
run_test "shaders/glsl-vs-if-greater-equal" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-greater-equal.shader_test -auto"
run_test "shaders/glsl-vs-if-less" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-less.shader_test -auto"
run_test "shaders/glsl-vs-if-less-equal" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-less-equal.shader_test -auto"
run_test "shaders/glsl-vs-if-nested" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-nested.shader_test -auto"
run_test "shaders/glsl-vs-if-nested-loop" 0.0 "bin/shader_runner tests/shaders/glsl-vs-if-nested-loop.shader_test -auto"
run_test "shaders/glsl-vs-large-uniform-array" 0.0 "bin/shader_runner tests/shaders/glsl-vs-large-uniform-array.shader_test -auto"
run_test "shaders/glsl-vs-loop" 0.0 "bin/glsl-vs-loop -fbo -auto"
run_test "shaders/glsl-vs-loop-300" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-300.shader_test -auto"
run_test "shaders/glsl-vs-loop-break" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-break.shader_test -auto"
run_test "shaders/glsl-vs-loop-continue" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-continue.shader_test -auto"
run_test "shaders/glsl-vs-loop-nested" 0.0 "bin/glsl-vs-loop-nested -fbo -auto"
run_test "shaders/glsl-vs-loop-redundant-condition" 0.0 "bin/shader_runner tests/shaders/glsl-vs-loop-redundant-condition.shader_test -auto"
run_test "shaders/glsl-vs-main-return" 0.0 "bin/shader_runner tests/shaders/glsl-vs-main-return.shader_test -auto"
run_test "shaders/glsl-vs-masked-cos" 0.0 "bin/shader_runner tests/shaders/glsl-vs-masked-cos.shader_test -auto"
run_test "shaders/glsl-vs-masked-dot" 0.0 "bin/shader_runner tests/shaders/glsl-vs-masked-dot.shader_test -auto"
run_test "shaders/glsl-vs-mat-add-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-add-1.shader_test -auto"
run_test "shaders/glsl-vs-mat-div-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-div-1.shader_test -auto"
run_test "shaders/glsl-vs-mat-div-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-div-2.shader_test -auto"
run_test "shaders/glsl-vs-mat-mul-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-mul-1.shader_test -auto"
run_test "shaders/glsl-vs-mat-mul-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-mul-2.shader_test -auto"
run_test "shaders/glsl-vs-mat-mul-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-mul-3.shader_test -auto"
run_test "shaders/glsl-vs-mat-sub-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-mat-sub-1.shader_test -auto"
run_test "shaders/glsl-vs-max-array-access-forward-declaration" 0.0 "bin/shader_runner tests/shaders/glsl-vs-max-array-access-forward-declaration.shader_test -auto"
run_test "shaders/glsl-vs-max-array-access-function" 0.0 "bin/shader_runner tests/shaders/glsl-vs-max-array-access-function.shader_test -auto"
run_test "shaders/glsl-vs-mov-after-deref" 0.0 "bin/glsl-vs-mov-after-deref -fbo -auto"
run_test "shaders/glsl-vs-mvp-statechange" 0.0 "bin/glsl-vs-mvp-statechange -fbo -auto"
run_test "shaders/glsl-vs-neg-abs" 0.0 "bin/shader_runner tests/shaders/glsl-vs-neg-abs.shader_test -auto"
run_test "shaders/glsl-vs-neg-attribute" 0.0 "bin/shader_runner tests/shaders/glsl-vs-neg-attribute.shader_test -auto"
run_test "shaders/glsl-vs-normalscale" 0.0 "bin/glsl-vs-normalscale -fbo -auto"
run_test "shaders/glsl-vs-position-outval" 0.0 "bin/shader_runner tests/shaders/glsl-vs-position-outval.shader_test -auto"
run_test "shaders/glsl-vs-post-increment-01" 0.0 "bin/shader_runner tests/shaders/glsl-vs-post-increment-01.shader_test -auto"
run_test "shaders/glsl-vs-raytrace-bug26691" 0.0 "bin/glsl-vs-raytrace-bug26691 -fbo -auto"
run_test "shaders/glsl-vs-sign" 0.0 "bin/shader_runner tests/shaders/glsl-vs-sign.shader_test -auto"
run_test "shaders/glsl-vs-statechange-1" 0.0 "bin/glsl-vs-statechange-1 -fbo -auto"
run_test "shaders/glsl-vs-swizzle-swizzle-lhs" 0.0 "bin/shader_runner tests/shaders/glsl-vs-swizzle-swizzle-lhs.shader_test -auto"
run_test "shaders/glsl-vs-swizzle-swizzle-rhs" 0.0 "bin/shader_runner tests/shaders/glsl-vs-swizzle-swizzle-rhs.shader_test -auto"
run_test "shaders/glsl-vs-texturematrix-1" 0.0 "bin/glsl-vs-texturematrix-1 -fbo -auto"
run_test "shaders/glsl-vs-texturematrix-2" 0.0 "bin/glsl-vs-texturematrix-2 -fbo -auto"
run_test "shaders/glsl-vs-uniform-array-1" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-1.shader_test -auto"
run_test "shaders/glsl-vs-uniform-array-2" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-2.shader_test -auto"
run_test "shaders/glsl-vs-uniform-array-3" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-3.shader_test -auto"
run_test "shaders/glsl-vs-uniform-array-4" 0.0 "bin/shader_runner tests/shaders/glsl-vs-uniform-array-4.shader_test -auto"
popd

if [ $need_pass == 0 ] ; then
  echo "+---------------------------------------------+"
  echo "| Overall pass, as all 198 tests have passed. |"
  echo "+---------------------------------------------+"
else
  echo "+-----------------------------------------------------------+"
  echo "| Overall failure, as $need_pass tests did not pass and $failures failed. |"
  echo "+-----------------------------------------------------------+"
fi
exit $need_pass
