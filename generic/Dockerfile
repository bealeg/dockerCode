ARG FROM_ARG
# hadolint ignore=DL3006
FROM ${FROM_ARG}
ARG ROS_DISTRO
ARG VERSION

USER autoware
ENV USERNAME autoware

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Build Autoware
# wget https://gitlab.com/autowarefoundation/autoware.ai/autoware/raw/$VERSION/autoware.ai.repos; \

RUN bash -c 'mkdir -p /home/$USERNAME/Autoware/src; \
    cd /home/$USERNAME/Autoware; \
    wget https://raw.githubusercontent.com/bealeg/autoware.ai/master/autoware.ai.repos; \
    vcs import src < autoware.ai.repos; \
    cd src; \
    git clone https://github.com/bealeg/processingCode.git; \
    cd ../..; \
    source /opt/ros/$ROS_DISTRO/setup.bash; \
    colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release'; \
    chmod 777 /home/autoware -R; \
    source /opt/ros/$ROS_DISTRO/setup.bash;

# RUN echo "source /home/$USERNAME/install/local_setup.bash" >>

RUN echo "source /home/$USERNAME/install/local_setup.bash" >> \
    /home/$USERNAME/.bashrc

COPY ./entrypoint.sh /
USER root
ENTRYPOINT ["/entrypoint.sh"]
COPY ./example.sh /
