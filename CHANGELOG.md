# [1.8.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.7.0...v1.8.0) (2022-09-25)


### Features

* **collection:** update to return boxset info ([6441d26](https://github.com/denvermullets/ninetynine-staples/commit/6441d2643c57e9d3d7588860f5793e6cdd54b2be))

# [1.7.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.6.4...v1.7.0) (2022-09-20)


### Features

* **collection:** add foils to collection, nin-52 ([#60](https://github.com/denvermullets/ninetynine-staples/issues/60)) ([50f77e6](https://github.com/denvermullets/ninetynine-staples/commit/50f77e60fbdd6807c9f7a2ed32453d76b9e16bad))

## [1.6.4](https://github.com/denvermullets/ninetynine-staples/compare/v1.6.3...v1.6.4) (2022-09-18)


### Bug Fixes

* **build:** add build script ([#58](https://github.com/denvermullets/ninetynine-staples/issues/58)) ([be60d42](https://github.com/denvermullets/ninetynine-staples/commit/be60d42c006faa97f1c7ed54a84cf0492a6c793d))

## [1.6.3](https://github.com/denvermullets/ninetynine-staples/compare/v1.6.2...v1.6.3) (2022-09-18)


### Bug Fixes

* **boxsets:** add check for empty sets ([#56](https://github.com/denvermullets/ninetynine-staples/issues/56)) ([4aad629](https://github.com/denvermullets/ninetynine-staples/commit/4aad6294af6020ad8370233481e0483c5ab37744))

## [1.6.2](https://github.com/denvermullets/ninetynine-staples/compare/v1.6.1...v1.6.2) (2022-09-18)


### Bug Fixes

* **boxsets:** ignore sets w/o cards in the db ([#54](https://github.com/denvermullets/ninetynine-staples/issues/54)) ([6a0af10](https://github.com/denvermullets/ninetynine-staples/commit/6a0af10f63039cbaf6d207add7c477d8de16cbad))

## [1.6.1](https://github.com/denvermullets/ninetynine-staples/compare/v1.6.0...v1.6.1) (2022-09-17)


### Bug Fixes

* **sidekiq:** reduce concurrency for sidekiq ([#50](https://github.com/denvermullets/ninetynine-staples/issues/50)) ([204819e](https://github.com/denvermullets/ninetynine-staples/commit/204819ed6079b1731b4bc984cec530731456f044))

# [1.6.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.5.0...v1.6.0) (2022-09-17)


### Features

* **sidekiq:** add sidekiq to try out alt ingest, nin-46 ([#48](https://github.com/denvermullets/ninetynine-staples/issues/48)) ([c6ae2a5](https://github.com/denvermullets/ninetynine-staples/commit/c6ae2a55a3161a6f11653d04585571775c44d218))

# [1.5.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.4.3...v1.5.0) (2022-09-11)


### Features

* **flyio:** add auto deploy ([#32](https://github.com/denvermullets/ninetynine-staples/issues/32)) ([5e050c8](https://github.com/denvermullets/ninetynine-staples/commit/5e050c8c0e15272e2bc2bef2512e8adb861d9dc5))

## [1.4.3](https://github.com/denvermullets/ninetynine-staples/compare/v1.4.2...v1.4.3) (2022-09-11)


### Bug Fixes

* **flyio:** lower workers to 2 ([#30](https://github.com/denvermullets/ninetynine-staples/issues/30)) ([68931ea](https://github.com/denvermullets/ninetynine-staples/commit/68931ea5c619ff921b8a29b8102c663d9fb6cdba))

## [1.4.2](https://github.com/denvermullets/ninetynine-staples/compare/v1.4.1...v1.4.2) (2022-09-11)


### Bug Fixes

* **fly.io:** comment out build task w/assets:precompile ([5dbacce](https://github.com/denvermullets/ninetynine-staples/commit/5dbacce1b802eac8e3061e275201c4b7ea3633c0))
* **fly.io:** comment out build task w/assets:precompile, take 2 ([9ff5a0d](https://github.com/denvermullets/ninetynine-staples/commit/9ff5a0dff6589a30f433aac5e990a3321925804f))

## [1.4.1](https://github.com/denvermullets/ninetynine-staples/compare/v1.4.0...v1.4.1) (2022-09-11)


### Bug Fixes

* **fly.io:** comment out build task w/assets:precompile ([#28](https://github.com/denvermullets/ninetynine-staples/issues/28)) ([8b32ad7](https://github.com/denvermullets/ninetynine-staples/commit/8b32ad73d0e099cc7dfcfa85f72a0e9a0bd16501))

# [1.4.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.3.0...v1.4.0) (2022-09-11)


### Features

* **auth:** add login/sign up view, handle auth, nin-39, nin-42 ([#25](https://github.com/denvermullets/ninetynine-staples/issues/25)) ([1548079](https://github.com/denvermullets/ninetynine-staples/commit/15480799d7d140f630f0c0690b9d3e98cc64cf06))
* **boxsets:** controller actions for loading up cards in a set ([#22](https://github.com/denvermullets/ninetynine-staples/issues/22)) ([6a63788](https://github.com/denvermullets/ninetynine-staples/commit/6a637886e14b50fbf96eab1391d3e2bef7370b3c))
* **collections:** able to add or delete cards from specified collections, nin-24 ([#23](https://github.com/denvermullets/ninetynine-staples/issues/23)) ([bc2efd8](https://github.com/denvermullets/ninetynine-staples/commit/bc2efd84c38098571951702675ba9a30e4f02d75))
* **ingest:** fix ingest issues, update formatting, nin-22 ([#24](https://github.com/denvermullets/ninetynine-staples/issues/24)) ([3b593d1](https://github.com/denvermullets/ninetynine-staples/commit/3b593d1e2a83ba5870b5b821a4002320a732479e))

# [1.3.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.2.0...v1.3.0) (2022-08-22)


### Bug Fixes

* **setup:** update routes, add show method for collection ([#20](https://github.com/denvermullets/ninetynine-staples/issues/20)) ([ae5cd23](https://github.com/denvermullets/ninetynine-staples/commit/ae5cd2310b7115d9e44664b737722ecb73a433f3))


### Features

* **controllers:** add some basic crud for some controllers ([#19](https://github.com/denvermullets/ninetynine-staples/issues/19)) ([9776275](https://github.com/denvermullets/ninetynine-staples/commit/9776275181a688eb6c6f9541c34da69146d011b0))

# [1.2.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.1.0...v1.2.0) (2022-08-14)


### Features

* **db:** add players, collections, and decks tables w/joins, nin-10 ([#15](https://github.com/denvermullets/ninetynine-staples/issues/15)) ([0577875](https://github.com/denvermullets/ninetynine-staples/commit/057787507d73a152255f325a3af93b6cb30e7d8c))

# [1.1.0](https://github.com/denvermullets/ninetynine-staples/compare/v1.0.0...v1.1.0) (2022-08-11)


### Features

* **core:** update ruby/rails to latest versions ([700a62c](https://github.com/denvermullets/ninetynine-staples/commit/700a62c531490404a655f045fa14a0d835520889))

# 1.0.0 (2022-08-11)


### Bug Fixes

* **ci/cd:** update semver issues ([5277d4f](https://github.com/denvermullets/ninetynine-staples/commit/5277d4f669ce7ca4f868950d7b32528c8d863936))
* **gemfile:** add linux ([6dc4579](https://github.com/denvermullets/ninetynine-staples/commit/6dc4579312e44c3a590a6799c49f83a4e70aa197))
* **seed:** update seed to reflect migration change ([9e588ae](https://github.com/denvermullets/ninetynine-staples/commit/9e588ae764f810ac5efb6ffb9dfa480e0fc36f17))
* **seed:** update seedfile and update readme ([6951cb1](https://github.com/denvermullets/ninetynine-staples/commit/6951cb16f077db5c87d9a8c6e85969522e58aac1))


### Features

* **api:** setup api versioning, add rubocop settings ([ea60de9](https://github.com/denvermullets/ninetynine-staples/commit/ea60de9abc060d076ef1ecd54d9265ceef3af717))
* **ci/cd:** add semantic release ([55af92e](https://github.com/denvermullets/ninetynine-staples/commit/55af92ebb7a1bb91e95d01f78e96bf61972efac0))
* **db:** create migrations and setup associations ([0a986ea](https://github.com/denvermullets/ninetynine-staples/commit/0a986eaee4e7071b02b58b1ca9b790bdb34bccb8))
* **ingest:** update migrations, add rake task for ingestion ([09cc20a](https://github.com/denvermullets/ninetynine-staples/commit/09cc20a23d8563b8a35ec9b3f1201d2f1f9f1fd6))
* **rake:** add rake task to ingest card, create card model ([b6716cc](https://github.com/denvermullets/ninetynine-staples/commit/b6716cc0e94aba6b3d9a38467af0dddebc73c4a2))
* **seed:** add seed file and fix model assocations and migrations ([9aabb2d](https://github.com/denvermullets/ninetynine-staples/commit/9aabb2d6be7ff7acec071efe6b333ce602e046bf))
