# Getting Started with Apache Kafka

This README provides a starting point for learning Apache Kafka using resources from LinkedIn Learning, YouTube, and Conduktor, along with hands-on setup instructions and essential Kafka commands.

---

## Learning Resources

### Online LinkedIn Learning Courses
1. [Complete Guide to Apache Kafka for Beginners](https://www.linkedin.com/learning/complete-guide-to-apache-kafka-for-beginners/kafka-course-introduction?u=85185346)
2. [Apache Kafka Essential Training: Getting Started](https://www.linkedin.com/learning/apache-kafka-essential-training-getting-started-22398044/getting-started-with-apache-kafka?u=85185346)

### YouTube Videos
1. [Apache Kafka in 15 mins](https://www.youtube.com/watch?v=hNDjd9I_VGA)
2. [Apache Kafka Fundamentals You Should Know](https://www.youtube.com/watch?v=-RDyEFvnTXI)
3. [Apache Kafka Fundamentals](https://www.youtube.com/watch?v=B5j3uNBH8X4)

---

## Installing Kafka

### Prerequisites
1. Ensure Docker is installed:
   - Download Docker Desktop from [Docker](https://www.docker.com/products/docker-desktop).

### Quick Start with Conduktor
1. Navigate to the directory where you want to set up Kafka.
2. Run the following command:
   ```bash
   curl -L https://releases.conduktor.io/quick-start -o docker-compose.yml && docker compose up -d --wait && echo "Conduktor started on http://localhost:8080"
   ```

### Setting Up Kafka with Docker Compose
1. Open a Terminal (Mac/Linux) or PowerShell (Windows).
2. Navigate to the directory containing the `kafka-single-node.yml` file.
3. Start Kafka using Docker Compose:
   ```bash
   docker-compose -f kafka-single-node.yml up -d
   ```
4. Verify the containers are running:
   ```bash
   docker ps
   ```
5. To shut down and clean up:
   ```bash
   docker-compose -f kafka-single-node.yml down
   ```

---

## Working with Kafka

### Accessing Kafka Container
1. Log in to the Kafka container:
   ```bash
   docker exec -it kafka-broker /bin/bash
   ```
2. Navigate to the Kafka scripts directory:
   ```bash
   cd /opt/bitnami/kafka/bin
   ```

### Common Kafka Commands

#### Creating Topics
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --create \
    --topic kafka.learning.tweets \
    --partitions 1 \
    --replication-factor 1

./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --create \
    --topic kafka.learning.alerts \
    --partitions 1 \
    --replication-factor 1
```

#### Listing Topics
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --list
```

#### Describing a Topic
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --topic kafka.learning.tweets \
    --describe
```

#### Publishing Messages to a Topic
```bash
./kafka-console-producer.sh \
    --bootstrap-server localhost:29092 \
    --topic kafka.learning.tweets
```

#### Consuming Messages from a Topic
```bash
./kafka-console-consumer.sh \
    --bootstrap-server localhost:29092 \
    --topic kafka.learning.tweets \
    --from-beginning
```

#### Deleting Topics
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --delete \
    --topic kafka.learning.alerts
```

---

## Advanced Kafka Operations

### Creating a Topic with Multiple Partitions
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --create \
    --topic kafka.learning.orders \
    --partitions 3 \
    --replication-factor 1
```

### Describing Topic Partitions
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --topic kafka.learning.orders \
    --describe
```

### Publishing Messages with Keys
```bash
./kafka-console-producer.sh \
    --bootstrap-server localhost:29092 \
    --property "parse.key=true" \
    --property "key.separator=:" \
    --topic kafka.learning.orders
```

### Consuming Messages Using a Consumer Group
```bash
./kafka-console-consumer.sh \
    --bootstrap-server localhost:29092 \
    --topic kafka.learning.orders \
    --group test-consumer-group \
    --property print.key=true \
    --property key.separator=" = " \
    --from-beginning
```

### Checking Consumer Group Offset Status
```bash
./kafka-consumer-groups.sh \
    --bootstrap-server localhost:29092 \
    --describe \
    --all-groups
```

---

## Hands-On Use Case

### Creating a Topic
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --create \
    --topic kafka.usecase.students \
    --partitions 2 \
    --replication-factor 1
```

### Describing the Topic
```bash
./kafka-topics.sh \
    --bootstrap-server localhost:29092 \
    --topic kafka.usecase.students \
    --describe
```

### Publishing Messages to the Topic
```bash
./kafka-console-producer.sh \
    --bootstrap-server localhost:29092 \
    --property "parse.key=true" \
    --property "key.separator=:" \
    --topic kafka.usecase.students
```

### Consuming Messages from the Topic
```bash
./kafka-console-consumer.sh \
    --bootstrap-server localhost:29092 \
    --topic kafka.usecase.students \
    --group usecase-consumer-group \
    --property print.key=true \
    --property key.separator=" = " \
    --from-beginning
```

---

This README is a foundational guide for learning and working with Apache Kafka. Follow the steps sequentially and refer to the resources for a deeper understanding.

