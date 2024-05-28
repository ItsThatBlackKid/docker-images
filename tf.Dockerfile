# Start with the TensorFlow GPU Jupyter image
FROM tensorflow/tensorflow:latest-gpu-jupyter

# Copy the requirements.txt file into the container
COPY requirements.txt /tmp/requirements.txt

# Install the required Python packages using pip
RUN pip install -r /tmp/requirements.txt

# Expose the Jupyter Notebook port
EXPOSE 8888

# Set the default command to start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]