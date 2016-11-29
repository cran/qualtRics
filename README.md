# qualtRics

This project contains an R package to interact with the [Qualtrics](https://www.qualtrics.com/) API. It is currently under development. I will add more functionality later.

Note that your institution must support API access and that it must be enabled for your account. Whoever manages your Qualtrics account can help you with this. Please refer to the [Qualtrics documentation](https://api.qualtrics.com/docs/authentication) on how to find your API token.

## Installation

To install this package, execute the following in R:

```r
install.packages("qualtRics")
```

Or, if you want to install the latest development version, run:

```r
install.packages("devtools")
devtools::install_github("JasperHG90/qualtRics")
```

## Dependencies

This package depends on `httr`, `stringr`, `jsonlite` and `XML`. All dependencies will be installed when you install `qualtRics`.

## Updates

Periodically check this repository for updates and execute `devtools::install_github("JasperHG90/qualtRics")` to update.

## Usage

Currently, the package contains three functions. It supports fetching a list of courses and their IDs from qualtrics, as well as downloading and reading a survey export. 

Note that, while requests will work without a [root url](https://api.qualtrics.com/docs/root-url) for the `getSurveys` function, it is desirable that you supply it. Supplying the correct url will reduce the number of errors you'll experience. The `getSurvey` function requires you to pass this root url. Please refer to the [official documentation](https://api.qualtrics.com/docs/root-url) to find out your institution-specific root url.

Note that you can only export surveys that you own, or to which you have been given explicit administration rights.

### Commands

Load the package:

```r
library(qualtRics)
```

Register your Qualtrics API key. You need to do this only once per R session:

```r
registerApiKey(API.TOKEN = "<yourapitoken>")
```

Get a data frame of surveys:

```r
surveys <- getSurveys(root_url="https://leidenuniv.eu.qualtrics.com") # URL is for my own institution
```

Export a survey and load it into R:

```r
mysurvey <- getSurvey(surveyID = surveys$id[6], root_url = "https://leidenuniv.eu.qualtrics.com", verbose = TRUE)
```

You can request a CSV, JSON or XML file:

```r
mysurvey <- getSurvey(surveyID = surveys$id[6], format="csv", root_url = "https://leidenuniv.eu.qualtrics.com", verbose = TRUE) # CSV
mysurvey <- getSurvey(surveyID = surveys$id[6], format="json", root_url = "https://leidenuniv.eu.qualtrics.com", verbose = TRUE) # JSON
mysurvey <- getSurvey(surveyID = surveys$id[6], format="xml", root_url = "https://leidenuniv.eu.qualtrics.com", verbose = TRUE) # XML
```

You may also store the results in a filepath of your choosing:

```r
mysurvey <- getSurvey(surveyID = surveys$id[6], format="csv", save_dir = "/users/jasper/desktop/", root_url = "https://leidenuniv.eu.qualtrics.com", verbose = TRUE)
```

## Other information

For specific information about the Qualtrics API, you can refer to the [official documentation](https://api.qualtrics.com/docs/overview).

### Issues

Should you encounter any bugs or issues, please report them [here](https://github.com/JasperHG90/qualtRics/issues)

### Requests

If you have a request (like adding a new argument), please leave it [here](https://github.com/JasperHG90/qualtRics/issues)

### Changelog

**[v0.03]**
- User can choose to save results directly in a folder through 'save_dir' parameter in `getSurvey()`
- Results can now be requested in .csv, .json or .xml format. The packages `jsonlite` and `XML` are added to 'Suggests' in DESCRIPTION.
- `constructHeader()` is now deprecated and should no longer be used. Instead, users need to call `registerApiKey()`.
- Added a new function `registerApiKey()` which saves the user's API key and header information in the `tempdir()` environment. 

**[v0.02]**
- Renamed 'base url' to 'root url' such that it corresponds to Qualtrics documentation.
- The root url no longer requires API-specific endpoints. So e.g. 'https://leidenuniv.eu.qualtrics.com' now works for all functions. The API-specific endpoints are added in the functions itself.
- Institution-specific root url is now required by `getSurvey()`

**[v0.01]**
- Added first three functions (`constructHeader`, `getSurvey`, `getSurveyIDs`)
- base_url parameter is now uniform across functions. Parameter is called 'root url' to bring it in line with Qualtrics documentation.
