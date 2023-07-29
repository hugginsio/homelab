# external-landing

This website is a statically exported Next.js application hosted on Cloudflare Pages. It is [deployed automatically by GitHub Actions](../.github/workflows/external-landing-cd.yaml) whenever the source is modified on the `main` branch.

The production deployment in Cloudflare Pages is mapped to the same domains used by my homelab's reverse proxy. External users (family) will see this reminder if they access an application running on the homelab infrastructure without being logged in to the VPN.
