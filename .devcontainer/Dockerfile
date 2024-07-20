FROM debian:12
# RUN echo 'export PATH=$HOME/.roswell/bin:$PATH' >> ~/.bashrc
# Set the locale
RUN apt update && apt-get install curl make bzip2 libcurl4-gnutls-dev locales git vim rlwrap -y
RUN sed --in-place '/en_US.UTF-8/s/^#//' /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ARG ROSWELL_VERSION=23.10.14.114
RUN curl -L -O https://github.com/roswell/roswell/releases/download/v${ROSWELL_VERSION}/roswell_${ROSWELL_VERSION}-1_amd64.deb && \
    dpkg -i *.deb && ros && rm *.deb


# ARG USERNAME=<<default username goes here>>
ARG USERNAME=cluser
# ARG USERNAME=<<default username goes here>>
ARG USERNAME=gouser
ARG PASSWORD=developingwithgo
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd -g $USER_GID $USERNAME
RUN useradd -s /bin/bash -u $USER_UID -G $USERNAME,sudo -m $USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd

ENV PATH="/user/$USERNAME/.roswell/bin:${PATH}"
RUN echo "PATH=\"/user/$USERNAME/.roswell/bin:${PATH}\"" >>  /user/$USERNAME/.bashrc
RUN echo "alias ros='/usr/bin/rlwrap /usr/bin/ros'" >> /user/$USERNAME/.bashrc
