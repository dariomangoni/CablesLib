within CablesLib.OLD.CablesModular;
model CableAdapter
  Interfaces.Cable_a cable_a annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));
equation
  cable_a.f + frame_b.f = zeros(3);
  cable_a.pos = frame_b.r_0;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableAdapter;
