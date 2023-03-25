
# 99 Staples

This is a Magic: The Gathering collection app w/deck building capabilities (coming soon)

## Description

This app pulls down the JSON file of all existing cards from MTGJSON.com and iterates and compares to what the database currently has. If there's a new card or a change, then we update the record. We also pull some information from Scryfall's API (while respecting API ratelimit requests) to keep our images up to date.

I opted to created my own database so that the client would only have to make 1 API request instead of hundreds of calls to Scryfall or others per user per page. Some services have pretty limiting requirements (fair!) and while I could implement some caching to get around this, I felt it was best to maintain a database of cards. This allows the app to play with custom deck building ideas that integrate nicely while keeping the response time as low as possible.


## Screenshots

![Collection screenshot](https://user-images.githubusercontent.com/47340962/212079083-d1da8c75-7fd5-4df0-a99a-0fc1a3aa74e2.png)

![Collection screenshot](https://user-images.githubusercontent.com/47340962/212096034-30f04595-8c77-468a-b0d6-bd906c87a0a4.png)
## Tech Stack

**Client:** React (v18), Typescript, Chakra-UI, React Router (v6.3)

**Server:** Ruby on Rails (Ruby v3.1.2, Rails v7), Sidekiq, REDIS

**Deployment:** Render

**CI/CD:** husky, eslint, prettier, Github actions

## Installation

Installation is pretty standard, use yarn/npm to install.

### Front-end

```bash
  yarn install
  yarn start
```
### Back-end

```bash
  bundle install
  rails db:create
  rails db:migrate

  rails s
```
in a separate terminal startup up the worker (if ingesting)
```bash
  bundle exec sidekiq
```

### misc

` bundle lock --add-platform x86_64-linux`
`rake cards:ingest`
    
### Development notes

If making a PR, branch off of `develop`. I use Semantic Versioning for generating release notes (CHANGELOG.md). I use husky to check Typescript for errors on pre-commit. Once all is good, commit and merge into `develop`. When a release is needed I merge `develop` into `main` and github actions take over. Release notes are generated only on `main` changes and once it is updated github will backmerge the changes into `develop`. Render has a webhook setup to auto deploy once changes are made to `main` branch.

I also use Linear for all of my issue tracking and you'll see that webhook attaches the issue # to the PR for my own tracking. Linear is super awesome, you should use it!
## Acknowledgements

 - [Mana font](https://mana.andrewgioia.com/)
 - [Keyrune](https://keyrune.andrewgioia.com/)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)


