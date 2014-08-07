package shaderblox.uniforms;
#if snow
import snow.utils.Float32Array;
import falconer.utils.Matrix3D;
import snow.render.opengl.GL;
#elseif lime
import lime.graphics.opengl.GL;
import lime.utils.Matrix3D;
import lime.graphics.opengl.GLUniformLocation;

using shaderblox.helpers.GLUniformLocationHelper;
#else
throw "Requires lime or snow";
#end

/**
 * Matrix3D uniform (not transposed)
 * @author Andreas Rønning
 */
class UMatrix extends UniformBase<Matrix3D> implements IAppliable {
	public function new(name:String, index:GLUniformLocation, ?m:Matrix3D) {
		if (m == null) m = new Matrix3D();
		super(name, index, m);
	}
	public inline function apply():Void {
		#if lime
		if (location.isValid()) {
			GL.uniformMatrix3D(location, false, data);
			dirty = false;
		}
		#elseif snow
		if (location != -1) {
			GL.uniformMatrix4fv(location, false, new Float32Array(data.rawData));
			dirty = false;
		}
		#end
	}
}