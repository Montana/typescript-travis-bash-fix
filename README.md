# TypeScript bash script I wrote solving an issue involving Mocha (Travis CI, June 3 2020)

Bash fix I wrote for a TypeScript problem in Travis CI that involves Mocha. 

If you're using Mocha and TypeScript and your build fails, SSH could be a factor. Please check this first obviously. First you want to make the bash script exectuable via:

```bash
chmod u+x tsx.sh
```

Then add it to your yaml config, and try and trigger a build again and it should pash.
