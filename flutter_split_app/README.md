# flutter_split_app

Flutter Integration with Split
https://www.split.io

## Configs in this project

1. Setup a new Split account
2. in console Split > create split

<img width="751" alt="Captura de Pantalla 2022-12-23 a la(s) 15 52 10" src="https://user-images.githubusercontent.com/75485698/209394102-df41b8d3-81fd-4934-b648-af84b67366d0.png">
<img width="1218" alt="Captura de Pantalla 2022-12-23 a la(s) 15 52 38" src="https://user-images.githubusercontent.com/75485698/209394143-006c9d43-9c3d-47bd-bf28-c272b6137ee2.png">


## Key Setup

you need to setup the split.io key-access (client-side) in 
- home_page.dart line 22

# big value treatment
for big values (more than 1000kb in json config) we'r using a custom solution
1. Make a custom index for each split values
![Captura de Pantalla 2022-12-28 a la(s) 17 15 11](https://user-images.githubusercontent.com/75485698/209995384-d565a274-fda4-45a9-8143-d0e76f235ecd.png)


2. Read the index and build up the value from each part

for example see home_page.dart method 'segmentedSplitTreatment'
