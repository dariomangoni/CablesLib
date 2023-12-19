within CablesLib.OLD.Cables;
model CableMass
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;

  parameter Integer nElements = 4;
  parameter Modelica.SIunits.Diameter diameter = 10e-3;
  parameter Modelica.SIunits.TranslationalSpringConstant stiffness = 1e6;
  parameter Modelica.SIunits.TranslationalDampingConstant damping = 7.5e5;
  parameter Modelica.SIunits.RotationalDampingConstant rotDamping = 1e12;
  parameter Modelica.SIunits.LinearDensity linDensity = 0.025;
  parameter Modelica.SIunits.Length unstretchedLength = 1;
  parameter Modelica.SIunits.Pressure maxTensileStrength = 900e6;
  parameter Modelica.SIunits.Pressure maxElongation = 0.3;
  parameter Modelica.SIunits.Mass cableSegmentMass = unstretchedLength*linDensity/(nElements-1);
  parameter Modelica.SIunits.Inertia cableSegmentInertiaX = 0.25*cableSegmentMass*(diameter/2)^4;
  parameter Modelica.SIunits.Inertia cableSegmentInertiaY = 0.25*cableSegmentMass*(diameter/2)^4 + 1/12*cableSegmentMass*(unstretchedLength/nElements)^2;
  parameter Modelica.SIunits.TranslationalDampingConstant criticalDamping = 2*sqrt(stiffness*cableSegmentMass);

  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel sd[nElements](
    each c=stiffness,
    each s_unstretched=unstretchedLength/nElements,
    each d=damping) annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body[nElements-1](
    each r_CM={0,0,0},
    each m=cableSegmentMass,
    each I_11=cableSegmentInertiaX,
    each I_22=cableSegmentInertiaY,
    each I_33=cableSegmentInertiaY,
    each r_0(fixed=false),
    each v_0(fixed=true),
    each w_0_fixed=true,
    each useQuaternions=false)
                         annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revA[nElements-1](
    each useAxisFlange=true,
    each n(displayUnit="1") = {0,0,1},
    each phi(fixed=true)) annotation (Placement(transformation(extent={{-40,-30},{-20,-50}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revB[nElements-1](
    each useAxisFlange=true,
    each n(displayUnit="1") = {0,1,0},
    each phi(fixed=true)) annotation (Placement(transformation(extent={{20,-30},{40,-50}})));
  Modelica.Mechanics.Rotational.Components.Damper       rsdA[nElements-1](                     each d=rotDamping) annotation (Placement(transformation(extent={{-40,-78},{-20,-58}})));
  Modelica.Mechanics.Rotational.Components.Damper       rsdB[nElements-1](                     each d=rotDamping) annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
initial equation
  for i in 1:nElements-1 loop
    body[i].r_0 = (frame_a.r_0 + frame_b.r_0)/nElements*i;
  end for;
equation
  for i in 1:nElements-1 loop
    connect(sd[i].frame_b, revA[i].frame_a);
    connect(revA[i].frame_b, body[i].frame_a);
    connect(body[i].frame_a, revB[i].frame_a);
    connect(revB[i].frame_b, sd[i+1].frame_a);

    connect(revA[i].support, rsdA[i].flange_a);
    connect(revA[i].axis, rsdA[i].flange_b);
    connect(revB[i].support, rsdB[i].flange_a);
    connect(revB[i].axis, rsdB[i].flange_b);

  end for;
  connect(sd[1].frame_a, frame_a);
  connect(sd[nElements].frame_b, frame_b);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Line(points={{-100,-2},{-66,-32},{-44,-46},{-4,-60},{26,-60},{56,-48},{82,-28},{102,0}}, color={28,108,200})}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end CableMass;
