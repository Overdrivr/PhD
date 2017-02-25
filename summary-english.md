# English summary - (< 4000 characters)

The miniaturization of electronic circuits continues nowadays and sees the more recent technologies being applied to diverse fields of application such as automotive.
Very dense and small integrated circuits are interesting for economical reasons, because they are cheaper to manufacture in mass and can pack more functionalities with elevated performances.
The counterpart of size reduction is integrated circuits becoming more fragile electrically.

In the automotive world, the new trend of fully autonomous driving is seeing tremendous progress recently.
Autonomous vehicles must take decisions and perform critical actions such as braking or steering the wheel.
Those decisions are taken by electronic modules, that have now very high responsabilities with regards of our safety.
It is important to ensure that those modules will operate no matter the kind of disturbances they can be exposed to.

The automotive world is a quite harsh environment for electronic systems, where they are constantly exposed to a wide range of electrical stresses.
Turning on the engine creates large disturbances inside the car's electrical network, and can damage unprotected devices.
The other major source of electrical stress is called the Electrostatic Discharge (ESD).
It is a sudden flow of electricity, very short and of large amplitude, between two objects of different charge.
Electrostatic discharge can destroy electronic components, or disturb them during their normal operation.
In this research work, we focus on the second kind of issues that is starting to be studied since a few years.
Because of an electrical disturbance, functionnality can be temporarily lost with various impact on the vehicle.
To guarantee before manufacturing that a module and its components will perform their duty correctly, new analysis and prediction methods are required against soft-failures caused by electrostatic discharges.

In this research, different approches have been explored and proposed towards that goal.
First, a modelling method for reproducing the ESD waveforms from the test generator up to the integrated circuit input is presented.
It is based on a hierarchical approach where each element of the system is modelled individually, then added to the complete setup model.
A practical case of functionnal failure at silicon-level is analyzed using simulation tools.
To acquire more data on this fault, a testchip has been designed.
It contains on-chip monitoring structures to measure voltage and current, and monitor function behavior directly at silicon-level.
For instance, an integrated near-field on-chip sensor was integrated on silicon, to measure currents circulating inside near tracks.
The last part of this research details different analysis methods developped for identifying efficiently functionnal weaknesses.
They enable hierarchical analysis of complex integrated circuit designs, in order to identify potential weak spots inside the circuit that could require more shielding or protection.
The methods rely heavily on simulation tools, and prototypes have been implemented to prove the initial concepts.
The first method models each function inside the chip individually, using behavioral models, then enables to connect the models together in order to deduce the full function's robustness.
The second method is focused on constructing equivalent electrical black box models of integrated circuit functions.
The goal is to model the IC with a behavioral, black-box model capable of reproducing waveforms in powered conditions during the ESD.

The conclusion summarizes the work achieved during the PhD, highlights the most notable discoveries, and identifies follow-up work and research topics that could be worth pursuing.
