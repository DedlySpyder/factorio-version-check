# Factorio Version Check
This GitHub Action obtains the current Factorio versions from the [official website](https://factorio.com/api/latest-releases) and emits them as outputs.

## Usage
Example usage to print the current experimental version:
```
jobs:
  ...
  steps:
    - id: factorioVersion
      uses: DedlySpyder/factorio-version-check@main
    - name: Output experimental version
      run: echo "${{ steps.factorioVersion.outputs.experimental }}"
```

## Inputs

### `version_type`
The version type to get from the website. This will default to `headless`, which should match the latest version that players have.

Valid Values:
* `alpha`
* `demo`
* `headless`

## Outputs

### `experimental`
Value of the experimental version type.

### `stable`
Value of the stable version type.
