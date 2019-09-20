# NNStreamer Demo Docker

### Docker Compose
```bash
# Bring up the container and start the demo
docker-compose up -d

# Stop the container
docker-compose down
```

### Docker

```bash
# Build the container
docker build -t nnstreamer .

# Start the container and open a shell
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/video0 nnstreamer

# Run the example
./example_object_detection_tensorflow/gst-launch-object-detection-tf.sh

# Start the container and run the example
docker run -it --rm \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--device /dev/video0 \
	--entrypoint=/workspace/nnstreamer-example/bash_script/example_object_detection_tensorflow/gst-launch-object-detection-tf.sh \
	nnstreamer
```
