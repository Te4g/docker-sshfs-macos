### Requirement
Ensure SSH Agent is Running on Host:
Before you run your container, make sure the SSH agent is running on the host and your key is added.

```bash
eval $(ssh-agent -s)
ssh-add
```

### Build
```bash
docker build -t te4g/mount-ssh .
````

### Usage
```bash
docker run --rm --privileged \
  -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock \
  -e ADDRESS=$ADDRESS \
  -e DIRECTORY=$DIRECTORY \
  -e SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock \
  -p 9999:80 \
  te4g/mount-ssh
```

or set the environment variables in a `.env` file and run:

```bash
docker compose up -d --build
```
