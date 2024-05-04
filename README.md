# BugsBunny

<img src="https://upload.wikimedia.org/wikipedia/en/thumb/1/17/Bugs_Bunny.svg/1200px-Bugs_Bunny.svg.png" alt="Texto Alternativo" width="100">

The **BugsBunny** gem provides a simple interface for monitoring RabbitMQ queues, using the Bunny gem as a base.

## Installation

### Build
```bash
gem build bugs_bunny.gemspec
```

### Install

```bash
gem install bugs_bunny-0.1.0.gem
```
## Usage

### Instance

```bash
monitoring = BugsBunny::Monitoring.instance("your_host_url", "your_user", "your_password")
```

### Queue (example)

```bash
queue = monitoring.queue(name: "your_queue_name", durable: true, auto_delete: false)
```

### Monitoring methods

```bash
monitoring.info(queue)

monitoring.options(queue)

monitoring.status(queue)

monitoring.messages(queue)
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
