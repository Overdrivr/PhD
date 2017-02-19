# English summary - (< 4000 characters)

The miniaturization of electronic circuits continues nowadays and sees the more recent technologies being applied to diverse fields of application such as automotive.
Very dense and small integrated circuits are interesting for economical reasons, because they are cheaper to manufacture in mass and can pack more functionalities with elevated performances.
On the other hand, reducing the size of integrated circuits makes them more fragile electrically.

In the automotive world, the new trend of fully autonomous driving is seeing tremendous progress recently.
Autonomous vehicles must take decisions and perform critical actions such as braking or steering the wheel.
Those decisions are taken by electronic modules, that have now very high responsabilities with regards of our safety.
It is important to ensure that those modules will operate no matter the kind of disturbances they can be exposed to.

The automotive world is quite harsh in terms of stresses for electronic systems.
A running engine generates plenty of mechanical and thermal stress, that wear-out electronic devices in the long run.
Electronic system are also exposed to a wide range of electrical stresses inside vehicles, due to natural phenomena or the vehicle itself.
Turning an engine on creates large disturbances inside the car's electrical network, and can damage unprotected devices.
The other major source of electrical stress is called the Electrostatic Discharge (ESD).
It is a sudden flow of electricity, very short and of large amplitude, between two objects of different charge.
Electrostatic discharge can destroy electronic components, or disturb them during their normal operation.
In this research work, we focus on the second kind of issues that is starting to be studied since a few years.
Because of an electrical disturbance, functionnality can be temporarily lost.
It can recover immediately without noticeable impact or require user intervention, and affect more or less critical functions of a vehicule (airbag versus entertainment for instance).
To guarantee before manufacturing that a module and its components will perform their duty correctly, new analysis and prediction methods are required against soft-failures caused by electrostatic discharges.

In this research, different approches have been explored and proposed towards that goal.
Analysis of a failure at silicon-level was conducted using simulation tools.
For the simulations to be accurate, a method for modelling external devices has been developped.
It enables to accurately reproduce the disturbance waveform up to the integrated circuit input.
New measurements and investigation methods are also detailled.
A testchip has been designed, containing on-chip monitoring structures to acquire data between block functions.
An integrated near-field on-chip sensor was also integrated on silicon.
Finally, three different analysis methods using simulation tools were prototyped.
They enable hierarchical analysis of complex integrated circuit designs.
The first method models each block function individually, then enables to connect the models together in order to deduce the full function's robustness.
The second method is focused on constructing equivalent electrical black box models of integrated circuit functions.
The goal is to model the IC with a behavioral, black-model capable of reproducing waveforms in powered conditions during the ESD.
Finally, the last method remains at the concept stage, but offers a per-block, assertion-based flow to identify exactly during ESD simulations which blocks and nets are in fault and require additionnal protection.

After those methods were presented, the conclusion summarizes the work achieved during the PhD, highlights the most notable discoveries, and identifies follow-up work and research topics that could be worth pursuing.
