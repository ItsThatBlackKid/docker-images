# Start with the TensorFlow GPU Jupyter image
FROM tensorflow/tensorflow:latest-gpu-jupyter

# Copy the requirements.txt file into the container
COPY requirements.txt /tmp/requirements.txt

# Install the opencv deps 
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 graphviz  -y

# Install the required Python packages using pip
RUN pip install -r /tmp/requirements.txt

# Create a non-root user
RUN useradd -m jupyteruser

# Change ownership of the home directory to the non-root user
RUN chown -R jupyteruser /home/jupyteruser

# Switch to the non-root user
USER jupyteruser

# Set the working directory
WORKDIR /home/jupyteruser

# Expose the Jupyter Notebook port
EXPOSE 8888

# Add a script to configure the Jupyter password
COPY set_password.sh /usr/local/bin/set_jupyter_password.sh

ENV DISPLAY "`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"

# Set the default command to start Jupyter Notebook
CMD ["bash", "-c", "set_jupyter_password.sh && jupyter notebook --ip=0.0.0.0 --no-browser --allow-root"]