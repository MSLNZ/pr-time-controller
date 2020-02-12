Time Controller Specifications
==============================
The time controller has been implemented on a Xilinx Pynq board which uses a Zynq-7000 series FPGA/Microprocessor hybrid (Part: ``xc7z020-1CLG400C``).

This time controller consists of 5 modules, three of which are Time To Digital Converters (TDCs). The modules are listed below:

    **TDC Modules**

- Single channel inter rising edge timer
- Two channel pulse coincidence timer
- Four channel time tagger


  **Others**
- Pulse Counter
- Signal Generator

| **Specifications:**

- The single channel inter rising edge timer module is designed to measure the time between two rising edges on the same channel. It has a time resolution of 625ps with a minimum pulse width requirement of 9ns.
- The Two channel coincidence timer is designed to measure the time between two rising edges on two channels. It can be configured to chose which channel is the start signal or whether just to choose the first detected channel as the start signal. It has a timing resolution of 625ps with a minimum pulse width of 9ns.
- The time tagger is designed to detect a start signal (T0) and then measure the time to detections on each channel (CH1 to CH4). It has a timing resolution of 625ps with a minimum pulse width of 9ns.
- The pulse counter is designed to count incoming rising edges on all four channels with either a manual start and window designation, or can be externally triggered to start using the T0 channel or can be both externally started and stopped using T0 and E_TRIG. It has a maximum count rate of 50MHz.
- The signal generator is designed to output phase coherent waveforms on four output channels (OP0 to OP3). The waveforms have configurable frequencies (from 0.1Hz to 50MHz) and configurable duty cycles and output delays. The output delays have a resolution of 2.71ns which is the same as the pulse width/duty cycle specification.