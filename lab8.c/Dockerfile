FROM gcc:latest

WORKDIR /home/dev
COPY src/ src/

RUN gcc -o hello src/main.c
CMD ["./hello"]