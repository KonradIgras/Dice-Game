FPGA 5-Dice Game
A hardware-implemented 5-dice game designed for FPGA boards. The project accurately replicates the core gameplay of Yahtzee, focusing on score optimization through strategic re-rolling.
Key Features:
- 5-Dice Simultaneous Roll: Independent random generation for each die using optimized LFSR (Linear-Feedback Shift Register) modules.
- Dice Locking Mechanism: Allows the player to hold/freeze desired dice values between rolls using physical switches.
- Re-roll System: Supports the standard rule of re-rolling unlocked dice to improve the final hand.
- Hardware Interface: Full integration with FPGA peripherals, including push-buttons for rolling, switches for holding dice, and displays for real-time score and dice value tracking.
