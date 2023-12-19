within CablesLib.OLD.CablesModular;
model Weight
  parameter Real attachPos = 0;
  parameter Modelica.SIunits.Mass mass = 10;
  Interfaces.Cable_b cable_b annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100})));
  Real vel[3];
protected
  outer Modelica.Mechanics.MultiBody.World world;
equation
  vel = der(cable_b.pos);
  cable_b.f + mass*(world.gravityAcceleration(cable_b.pos) - der(vel)) = zeros(3);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Weight;
