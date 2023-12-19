within CablesLib.TESTS.Pulley3DTests;
model PulleyContactPointAnalyticTest
import Modelica.Mechanics.MultiBody.Frames;
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1}) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce myForce(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world, color={0,0,255}) annotation (Placement(transformation(extent={{134,-88},{114,-68}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed support annotation (Placement(transformation(extent={{-92,-88},{-72,-68}})));
  Math.RealVectorExpression realVectorExpression1(out={866,250,-500})   annotation (Placement(transformation(extent={{170,-88},{150,-68}})));

  CablesLib.CablesFlange.PulleyContactPointAnalytic pulleyContactPointAnalytic(radius=0.5) annotation (Placement(transformation(extent={{16,-90},{36,-70}})));
  CablesLib.CablesFlange.PulleyContactPointAnalytic pulleyContactPointAnalytic1(radius=0.5, flip_side=true) annotation (Placement(transformation(extent={{16,-38},{36,-18}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce myForce1(resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world, color={0,180,0})
                                                                                                                                                   annotation (Placement(transformation(extent={{134,-40},{114,-20}})));
  Math.RealVectorExpression realVectorExpression2(out={-866,250,-500})  annotation (Placement(transformation(extent={{170,-40},{150,-20}})));
equation

  connect(myForce.force, realVectorExpression1.out) annotation (Line(points={{136,-78},{149,-78}}, color={0,0,127}));
  connect(pulleyContactPointAnalytic.frame_a, support.frame_b) annotation (Line(
      points={{16,-80},{-28,-80},{-28,-78},{-72,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(pulleyContactPointAnalytic.frame_b, myForce.frame_b) annotation (Line(
      points={{36,-80},{76,-80},{76,-78},{114,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(myForce1.force, realVectorExpression2.out) annotation (Line(points={{136,-30},{149,-30}}, color={0,0,127}));
  connect(myForce1.frame_b, pulleyContactPointAnalytic1.frame_b) annotation (Line(
      points={{114,-30},{76,-30},{76,-28},{36,-28}},
      color={95,95,95},
      thickness=0.5));
  connect(pulleyContactPointAnalytic1.frame_a, support.frame_b) annotation (Line(
      points={{16,-28},{-28,-28},{-28,-78},{-72,-78}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PulleyContactPointAnalyticTest;
