# Use the miniforge3 base image with CUDA support
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04


# Install Miniconda
RUN apt-get update && apt-get install -y wget bzip2 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    /opt/conda/bin/conda clean --all --yes

# Set environment variables for conda
ENV PATH /opt/conda/bin:$PATH

# Copy the Conda environment file into the container
COPY env.yml /tmp/env.yml

# Create the Conda environment
RUN conda env create -f /tmp/env.yml && conda clean -a

# Create a non-root user
RUN useradd -m jupyteruser

# Change ownership of the home directory to the non-root user
RUN chown -R jupyteruser /home/jupyteruser

# Switch to the non-root user
USER jupyteruser

# Set the working directory
WORKDIR /home/jupyteruser


SHELL ["conda", "run", "-n", "ml", "/bin/bash", "-c"]

RUN python3 -m pip install tensorflow[and-cuda]

# Set the default command to run Jupyter Notebook, listening on the internal IP
CMD ["conda", "run", "--no-capture-output", "-n", "ml", "jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
