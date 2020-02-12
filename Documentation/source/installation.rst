Installation:
===============

The installation guide is split into the set up guide for the Pynq, and the set up guide for the work station.

Pynq Setup Guide:
^^^^^^^^^^^^^^^^^^^^^
1. The installation of the Pynq image and basic set up is best explained `here <https://pynq.readthedocs.io/en/v2.0/getting_started.html>`_.

2. Copy the TimeController directory under OnPynq into the folder named xilinx on the Pynq, this can be done either through the **windows explorer** or an **FTP client.**
   To use windows explorer, use the map network drive utility with the Pynq's local IP address followed by the xilinx directory e.g. (``\\xxx.xxx.xxx.xxx\xilinx\``)

   To use an FTP client, connect to the IP address of the Pynq using SFTP port 22.

3. To enable the program to automatically start after a reboot:
   
   * Navigate either via ssh or serial terminal to etc/ and edit the profile file using nano or other editor.
   * Add the following line to the end of the file: ``echo -e "xilinx\n" | sudo -S python3.6 /home/xilinx/TimeController/sp_MAIN.py`` and save and exit.
   * Next navigate to ``/etc/systemd/system/basic.target.wants/`` and edit the file ``boot_leds.service``.
   * Comment out every line of the file with ``#`` and save and exit.

   The Pynq will now start the Time Controller program on boot up. If manual starting of the program is needed, navigate to ``/home/xilinx/TimeController/`` and run the command ``sudo python3.6 sp_MAIN.py``.

Workstation setup:
^^^^^^^^^^^^^^^^^^^

The TimeController.py module will run on Python3.7 without any extra references, however in order to use the histogram examples, the packages outlined in `prerequisites <prereq.html>`_  will be required and can be installed using pip.