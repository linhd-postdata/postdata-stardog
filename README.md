# postdata-stardog

## Deployment

### Prerequisites
1. Download the [POSTDATA Knowledge graph](https://unedo365.sharepoint.com/:u:/s/proyectoercpostdata/Ee6-s0r_511Mk_mIEcpwE5wBQcSQWQUK_1zSqd7yoZZNZA?e=zT2lTL) 
and move it to `stardog` folder
2. Copy your Stardog's license key file into `stardog` folder

### Docker

You can also use the Docker file provided, which exposes the server at the port 5820.

```bash
$ docker build --tag linhdpostdata/postdata-stardog .

$ docker run -p "5820:5820" linhdpostdata/postdata-stardog
```