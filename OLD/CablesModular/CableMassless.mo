within CablesLib.OLD.CablesModular;
model CableMassless
  Interfaces.Cable_a cable_a annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Interfaces.Cable_b cable_b annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  BumpstopSingleNoFrame bumpstopSingleNoFrame(c=1000, s_unstretched=0.1) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  BumpstopSingleNoFrame bumpstopSingleNoFrame1(c=1000) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Weight weight annotation (Placement(transformation(extent={{-10,-28},{10,-8}})));
equation
//   cable_a.pos = bumpstopSingle.frame_a.r_0;
//   cable_b.pos = bumpstopSingle.frame_a.r_0;
//   cable_a.f + bumpstopSingle.frame_a.f = zeros(3);
//   cable_b.f + bumpstopSingle.frame_b.f = zeros(3);
  connect(bumpstopSingleNoFrame.cable_b, weight.cable_b) annotation (Line(points={{-40,0},{0,0},{0,-8}}, color={28,108,200}));
  connect(bumpstopSingleNoFrame1.cable_a, weight.cable_b) annotation (Line(points={{40,0},{0,0},{0,-8}}, color={28,108,200}));
  connect(bumpstopSingleNoFrame1.cable_b, cable_b) annotation (Line(points={{60,0},{100,0}}, color={28,108,200}));
  connect(bumpstopSingleNoFrame.cable_a, cable_a) annotation (Line(points={{-60,0},{-100,0},{-100,0}}, color={28,108,200}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableMassless;
