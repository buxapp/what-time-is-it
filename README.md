# What time is it?

Allows finding what time is it in Amsterdam and in London.

## Usage

```
GET /amsterdam
GET /london
```

## Configuration

Default port is 8080, to override set `PORT` environment variable.

## Container Delivery

The repository ships with a GitHub Actions workflow in
`.github/workflows/build-and-push.yml`.

- Pull requests verify that the Docker image builds successfully.
- Pushes to `main` publish the image to Artifact Registry:
  `europe-west1-docker.pkg.dev/homework-492515/what-time-is-it/what-time-is-it`

To enable image publishing, configure these repository secrets:

- `GCP_WORKLOAD_IDENTITY_PROVIDER`
- `GCP_SERVICE_ACCOUNT_EMAIL`
