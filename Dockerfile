# Use CentOS 8 as baseline
FROM centos:8

# Add smartmet open and epel repositories
RUN rpm -ivh https://download.fmi.fi/smartmet-open/rhel/8/x86_64/smartmet-open-release-21.3.26-2.el8.fmi.noarch.rpm \
             https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

# Use eccodes from smartmet open
RUN dnf -y install dnf-plugins-core && \
    dnf config-manager --set-enabled PowerTools && \
    dnf -y module disable postgresql && \
    dnf config-manager --setopt="epel.exclude=eccodes*" --save

# Install Himan and dependencies
RUN yum -y install himan-bin himan-lib himan-plugins

