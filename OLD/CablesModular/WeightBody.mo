within CablesLib.OLD.CablesModular;
model WeightBody
  parameter Real attachPos = 0;
  Interfaces.Cable_b cable_b annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100})));
  Modelica.Mechanics.MultiBody.Parts.Body body(r_CM={0,0,0}, m=1, useQuaternions=false) annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
equation
  cable_b.f + Modelica.Mechanics.MultiBody.Frames.resolve1(body.frame_a.R, body.frame_a.f) = zeros(3);
  body.frame_a.t = zeros(3);
  body.frame_a.r_0 = cable_b.pos;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end WeightBody;
