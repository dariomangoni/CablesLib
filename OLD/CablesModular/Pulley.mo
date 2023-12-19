within CablesLib.OLD.CablesModular;
model Pulley
  CablesModular.Interfaces.Cable_a cable_a annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  CablesModular.Interfaces.Cable_b cable_b annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a support annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,-100})));
equation
  cable_a.f + cable_b.f + support.f = zeros(3);
  cable_a.s = cable_b.s;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Pulley;
