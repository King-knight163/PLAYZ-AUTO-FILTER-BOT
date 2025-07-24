# Don't Remove Credit @VJ_Botz
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

FROM python:3.10.8-slim-buster

# Fix broken Buster repos by pointing to the Debian archive
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/debian-security|http://archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    apt update -o Acquire::Check-Valid-Until=false && \
    apt upgrade -y -o Acquire::Check-Valid-Until=false

# Install Git
RUN apt install git -y

# Install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install --upgrade pip && pip3 install --upgrade -r /requirements.txt

# Set up working directory
WORKDIR /VJ-FILTER-BOT
COPY . /VJ-FILTER-BOT

# Default command to run the bot
CMD ["python", "bot.py"]
