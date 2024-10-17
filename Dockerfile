# Use the official Golang image as a base
FROM golang:1.20-alpine

# Set the current working directory inside the container
WORKDIR /app

# Copy the Go module file
COPY go.mod ./

# Download necessary Go modules (skip if you don't have external dependencies)
RUN go mod download || true

# Copy the rest of the application code
COPY . .

# Build the Go application
RUN go build -o main .

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["/app/main"]
