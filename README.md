## University of St Andrews Year 1 

# CS1007 Assignment 2 Project 

In this coursework, I was required to setup a method to record the usage of resource for three separate programs provided using containers. Using the data collected, the task was to aggregate this, and record the findings of this data. This would then be evaluated and discussed in this report.

## Implimentation

The details below are the prerequisites required to run the scripts for the container file:

Run the following commands:

```bash
podman volume create A03-Container
podman run -v A03-Volume:/A03-Volume --rm -it bash
```

This will place you in a container running the bash script.
After this, run the following commands:

```bash
touch /A03-Volume/Testfile-hn__4.3.03__va_nFXnp12 /A03-Volume/Testfile-prog1 /A03-Volume/Testfile-test
exit
```

After this go into the test_Environment directory, and the all of the available scripts should work.

## Result

This Assignment was graded as a 19 of 20, a strong First-Class Grade.
