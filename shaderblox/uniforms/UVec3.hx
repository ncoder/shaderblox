package shaderblox.uniforms;
import lime.gl.GL;
import lime.utils.Vector3D;

/**
 * ...
 * @author Andreas Rønning
 */
class UVec3 extends UniformBase<Vector3D> implements IAppliable {
	public function new(index:Int, x:Float = 0, y:Float = 0, z:Float = 0) {
		super(index, new Vector3D(x, y, z);
	}
	public inline function apply():Void {
		GL.uniform3f(location, data.x, data.y, data.z);
	}
}