within CablesLib.OLD.CablesUPS;
model CableUPS
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
  // Port definitions
  parameter Integer nPorts=0 "Number of ports" annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Boolean isConstantLength = false;
  parameter Boolean setCableLength0 = false;
  parameter Real cableLength0(fixed=setCableLength0) annotation(Dialog(enable=setCableLength0));
  Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS jointUPS(
    n1_a={0,1,0},
    nAxis_ia={0,0,1},
    axisColor=if noEvent(bumpstopCable.tension) then {255,0,0} else {0,255,0}) annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Cable1D bumpstopCable(
    stateSelect=StateSelect.prefer,
    s_nominal=1,
    s_rel(fixed=false)) annotation (Placement(transformation(extent={{-12,42},{8,62}})));
  Modelica.Blocks.Interfaces.RealInput u[nPorts] if not isConstantLength
                                         annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
  Modelica.Blocks.Sources.Constant const(k=cableLength0) annotation (Placement(transformation(extent={{-176,14},{-156,34}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=sum(u)) if not isConstantLength annotation (Placement(transformation(extent={{-160,52},{-140,72}})));
  Modelica.Blocks.Sources.Constant const1(k=0) if isConstantLength annotation (Placement(transformation(extent={{-208,26},{-188,46}})));
initial equation
  cableLength0 = Modelica.Math.Vectors.norm(frame_b.r_0-frame_a.r_0);
equation
  assert(cableLength0+sum(u)>0, "Cable stuck into Joint");
  connect(frame_a, jointUPS.frame_a) annotation (Line(
      points={{-100,0},{-20,0}},
      color={95,95,95},
      thickness=0.5));
  connect(jointUPS.frame_b, frame_b) annotation (Line(
      points={{20,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(bumpstopCable.flange_b, jointUPS.axis) annotation (Line(points={{8,52},{8,20}},        color={0,127,0}));
  connect(jointUPS.bearing, bumpstopCable.flange_a) annotation (Line(points={{-8,20},{-12,20},{-12,52}}, color={0,127,0}));
  connect(add.y, bumpstopCable.cableLength) annotation (Line(points={{-79,30},{-36,30},{-36,59},{-12,59}}, color={0,0,127}));
  connect(const.y, add.u2) annotation (Line(points={{-155,24},{-102,24}},                    color={0,0,127}));
  connect(realExpression.y, add.u1) annotation (Line(points={{-139,62},{-120,62},{-120,36},{-102,36}}, color={0,0,127}));
  connect(const1.y, add.u1) annotation (Line(points={{-187,36},{-102,36}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableUPS;
