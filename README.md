# PWM Controller in Verilog

## This project is a basic bare implementation of a PWM Controller in Vivado. This was undertaken to better understand how PWM control is implemented in microcontrollers.

### **The Setup**
The project was made using Vivado. Two main implementations were implemented, one is a basic implementation and the other is an enhancement of the same.

### **Overview Of PWM**
PWM (Pulse Width Modulation) is a method of mimicing an analog signal by changing the duty cycle ("ON" Time of the signal). 
It's useful for controlling the average power or amplitude delivered by an electrical signal. The average value of voltage fed 
to the load is controlled by switching the supply between 0-100%.


### **Applications Of PWM**
The kernel requires an entry function to execute an injected module, i.e. is the **Init Function** which initilizes queues, variables, registers, etc; anything which the program requires for it's core funcitonlity.

When the module is taken out or removed, the kernel requires an **Exit Function** that essentially does cleanup functions like freeing up memory, unregistering for events, returning back the resources to the kernel, etc. 

In our case, the init function is of static int type [Returns a 0; Returning a negtaive number causes a failure to execute] which takes in no arguements whereas our exit function is a static void as it does not return anything as just as the init function, does not take in any parameters.

Two macros, **module_init** and **module_exit** takes in the name of their corresponding init and exit functions as their arguments.
Essentially it's passing the funciton pointer of the entry and exit of the module so the kernel knows where to look into for entry and exit.

These macros are called from the header-files:
#include <linux/init.h>
#include <linux/module.h>

Also it's very important to specify the license under which we would be releasing the kernel module:
MODULE_LICENSE("GPL");
Else the kernel won't accept the module.

### **Commands For Execution**
* `Make` - Utility that compiles the files as directed inside the Makefile and accordingly builds additional files; the most important being the .ko file which is the actual kernel module that needs to be injected.
* `Make Clean` - Clears out all the files built by Make
* `sudo insmod ldd.ko` -  Injects the module into the kernel
* `sudo dmesg` - Prints the kernel's log buffer [We use printk to print log messages inside the kernel's log buffer] [-c flag clears the log buffer]
* `sudo rmmod ldd.ko` - Removes the module from the kernel 
* `modinfo ldd.ko` - Gives out info about the module such as > Filename, license, Author, Description, etc.
* `lsmod` - Utility that lists all the modules present in the kernel, the size and by how many processes it is being used.
* `file*` - Gives information about the files in the directory
### **The Insmod Utility**
* Sudo insmod ldd.ko [Invoked from the userspace]
* Calls `init_module` to hint the kernel that a module insertion is being attempted.
* Control is transferred to the kernelspace
* Kernel calls `sys_init_module` which verifies the permission on the kernel module
* `load_module` function is called which:
   * Perfroms sanity checks on the .ko [is an elf file]
   * Creates memory in kernel space for the code to be copied to 
   * Copies code from userspace to kernelspace
   * Resolves symbols
   * Returns a reference to the kernel
* This reference is added to a link list that has all the loaded module.
* The kernel will now execute the `module_init` function mentioned in the code [Points to the init function of our module].
If process fails, the steps are reversed and error msg displayed.

### **The Rmmod Utility**
* Sudo rmmod ldd [Invoked from the userspaec]
* Calls `delete_module()` which hints the kernel that a module is to be removed
* Control is transferred to the kernelspace
* Kernel calls `sys_delete_module()` which:
  * Checks the permission of the one requesting [Important to add sudo]
  * Checks if any other loaded module needs the current module
  * Checks if the module is actually loaded
  * Executes the function provided in `module_exit` mentioned in the code [Points to the exit functions of our module].
* `free_module` function is called which:
  * Removes references and kernel object reference 
  * Performs any other cleanup
  * Unloads the module
  * Changes the state in list [Marked as unavailable]
  * Removes it from the list and frees the memory

### **The Proc Filesystem**
It is a virtual filesystem which has no real files and are not stored on the memory of the disk, but instead contains listings.
It contains useful information about the processes that are currently running. It is reagrded as the control & information centre of the kernel.
The proc file system provides a medium between kernel and the userspace.

Through a kernel api, we set up an entry point for the proc file system. We use `proc_ops` (operations) on our file entry to perform read, write, open, close, etc.
`proc_ops` is a struct with a bunch of system calls that are defined as function pointers.

We want to add a virtual file entry into the proc system that is associated with our driver. Afer that we want to associate our driver to the `proc_ops`. 
This will enable use to perform read and write operations on our driver through the proc virtual file system.

### **High Level View** 
sudo isnmod ldd.ko 
      >
Kernel calls the pyjama_module_init
      >
proc entry created 
      >
registers read on proc entry = pyjama_read
      >
proc entry read through python 
      >
pyjama_read invoked
      >
pyjama_read copies "Ack!\n" from internal kernel memory to the Python Program (Userspace)
      >
Acknoledgement sent to the kernel that the message's 5 bytes were copied
      >
0 returned to signal End Of File
