# Robot Framework projects for Tesvan

<b> Python Version: </b><i>3.9.2</i>


## Set up the prerequisites

<div style="background-color: #303030; padding: 20px; border-radius: 10px;">

### Install dependencies
<br>

#### Open cmd in the root folder of the project and then paste the following command there:

```
python -m pip install -r requirements.txt
```
#### If you're on linux:
```
python3 -m pip install -r requirements.txt
```
<br>

### Web-driver setup
<br>

### <i> Chromedriver </i>
#### Make sure that you have your chromedriver in your PATH. For example, you can move chromedriver to Windows folder in 'C' drive.
<hr>
<h3><i> Geckodriver </i></h3>

#### For having up-and-working geckodriver you must allocate your geckodriver.exe file in Mozilla's root folder.
</div>

<hr>



## How to run the tests
<div style="background-color: #303030; padding: 20px; border-radius: 10px;">

<b> Note: </b><i> This manual is written from the perspective that you are in the root folder.</i>

#### Choose the test or suite you want to execute, and run the following command in cmd:
```
robot -d {path_for_results} -v browser:{chrome|ff} {path_to_suite_or_file}
```

#### Sample command usage:
```
robot -d Results/eBay -v browser:chrome TestSuite/eBay/VerifyResultsCount.robot
```
</div>