# EOS-Test-Cave [![Build Status](https://travis-ci.com/EOS-BP-Developers/EOS-Test-Cave.svg?branch=master)](https://travis-ci.com/EOS-BP-Developers/EOS-Test-Cave)

Automated EOS testing framework.

## Dependencies

The test runner requires `jq` and `bc`.

### Ubuntu

```console
sudo apt-get install -y jq bc
```

## Install

```console
git clone https://github.com/EOS-BP-Developers/EOS-Test-Cave.git
cd EOS-Test-Cave
git checkout v0.2.0
```

## Config

Use the dist:

```console
cp config.json.dist config.json
```

And point the `node_bin` to your local install.

## Running Tests

In the root project directory, tests are executed with:

```console
./start.sh
```

## CI

We have hooked in Travis CI which will auto build and execute tests in a controlled environment. The CI runner will execute on master and all PRs. No PR can be merged without CI passing!

## Contributors

This is made with ♥ by:

- [CryptoLions](http://cryptolions.io/)
- [HKEOS](https://www.hkeos.com)
- [Block Matrix](https://blockmatrix.network)
- [EOSSW/eden](https://eossweden.se)
- [EOSeoul](http://eoseoul.io/)
- [eosDAC](https://eosdac.io/)
