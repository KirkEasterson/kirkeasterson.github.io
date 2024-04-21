# Development

## Prerequisites

- Init submodules:

```sh
git submodule update --init --recursive
```

### Running locally

- Install [Hugo](https://gohugo.io/installation/)

- Run the `hugo` server:

```sh
make dev
```

- Build the site

```sh
make build
```

### Running in docker

- Install [docker-compose](https://docs.docker.com/compose/install/)

- Run the `hugo` server:

```sh
make docker-dev
```

- It can also be run in the background

```sh
make docker-start

# do stuff

make docker-stop
```

- Interact with `hugo`

```sh
make docker-interact
```

## Roadmap

- [ ] add portfolio section
- [ ] add blog section
- [ ] add contact form instead of posting email address
- [ ] add CV
- [ ] add tests for accessibility
- [ ] finetune lighthouserc
- [ ] add cypress (or some alternative) tests
