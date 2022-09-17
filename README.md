# 99Staples

quick iteration on an api to index magic cards

### Deployment note:
to get this to deploy on render, i had to run so that linux versions of gems would load on the server  🤷🏻

` bundle lock --add-platform x86_64-linux`

#
`rake cards:ingest`