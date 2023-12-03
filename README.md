# Seminaarityö - Robot Framework
Haaga-Helia-2023. Ohke-teknologiat. Seminaarityö - Robot Framework.

Tämän seminaarityön aiheena on perehtyä Robot Framework ohjelman käyttöön automaatiotestauksessa. Työssä tutustutaan web- sovelluksen testaukseen Selenium- kirjastoa hyödyntyäen.

## Robot Framework ja Selenium- kirjasto

Robot Framework on Python- kieleen perustuva, avoimen lähdekoodin ohjelmisto, jota voidaan käyttää testiautomaatiossa ja robottiprosessiautomaatiossa (Robotic Process Automation, RPA). Robot Framework voidaan integroida muihin työkaluihin, jolloin saadaan tehokkaita ja joustavia automaatioratkaisuja.

Robot Frameworkissa voidaan hyödyntää Robot Frameworkin mukana asentuvaa standardikirjastoa sekä erillisiä kirjastoja, jotka on kehitetty erityisiin tarkoituksiin. Käytettävän kirjaston valintaan vaikuttaa testattavassa sovelluksessa käytetty teknologia.
Esimerkiksi Selenium- kirjastoa voidaan hyödyntää web- sovellusten testauksessa. Kirjastoja voi myös itse rakentaa omiin tarpeisiin.

Selenium- kirjastolla voidaan automatisoida selaimella käytettävien web- sovellusten testaus. Selenium- kirjasto on Robot Frameworkille kehitetty web- testaus- kirjasto. Kirjasto hyödyntää Selenium- työkalua, jonka WebDriverilla voidaan ohjailla selainta komentojen avulla. Kirjastoa hyödyntäen voidaan toteuttaa testejä, joissa automatisoitu testikäyttäjä esimerkiksi avaa nettisivun ja toteuttaa käyttöliittymässä erilaisia toimintoja.

## Asennukset

Robot Framework hyödyntää Pythonia, joten ensin tulee asentaa Python. Robot Frameworkin asennusta varten tarvitaan pip paketinhallintaohjelmisto, jonka asentumisen voi tarkistaa komennolla pip list. Lopuksi voidaan asentaa Robot Framework ja tarvittavat muut kirjastot.

Selenium- kirjaston voi asentaa esimerkiksi komennolla, joka päivittää Selenium- kirjaston ja Robot Frameworkin uusimpiin versioihin.

```
pip install --upgrade robotframework-seleniumlibrary
```
Lisäksi tulee asentaa käyttävän selaimen ajuri (BrowserDriver) hakemistoon, joka on ympäristömuuttujassa. Esimerkiksi Cromelle asennetaan chromedriver.

Visual Studio Codeen voi myös asentaa kehitysympäristöksi esimerkiksi Robot Code- laajennuksen. Tarkemmat ohjeet löytää [robotframework.org](https://docs.robotframework.org/docs/getting_started/ide)- sivuilta.

## Testien kirjoittaminen

Testitapaukset kirjoitetaan testitapaustiedostoihin, joita kutsutaan nimellä *test suite files*. Suositeltu määrä testejä on alle kymmenen tiedostoa kohti, mutta määrää ei ole teknisesti rajoitettu. Tiedoston pääte on tyypillisesti .robot.

Robot Frameworkin koodi kirjoitetaan osioihin, jotka ilmaistaan \*\*\*- merkkien sisällä. Esimerkiksi asetukset kirjataan \*\*\* Settings \*\*\*- osion sisään ja testitapaukset \*\*\* Test cases \*\*\*- osion sisään.

Tiedoston koodi kirjoitetaan avainsanoilla (keywords), jotka ovat loppupeleissä metodeita. Avainsanat ovat helposti ymmärrettäviä, luonnollisen kielen sanoja, kuten **Open Browser**. Avainsanat ja argumentit erotellaan joko väleillä ja/tai |- merkeillä. Robot Frameworkin standardikirjasto avainsanoineen on automaattisesti käytettävissä, mutta muut kirjastot tulee importoida Settings- osiossa

Netistä löytyy myös ohjeita siihen, kuinka [hyviä testitapauksia](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst) kirjoitetaan.

## Seminaarityön testaukset

Tässä työssä halusin perehtyä jonkun julkisesti saatavailla olevan verkkosivun testaukseen. Ensin pyrinkin etsimään sellaisen sivun, jonka testaaminen tuntuisi aloittelijalle mielekkäältä. Netistä löytyikin erityisesti testausta varten kehitettyjä verkkosivuja.

Osa sivuista oli tehty niin, että niiden oli tarkoitus olla ominaisuuksiltaan oikeiden sovellusten kaltaisia. Selailin erilaisia vaihtoehtoisia [testisivumahdolisuuksia](https://ultimateqa.com/dummy-automation-websites/). Tutkin tarkemmin muutamaa sivua, mutta en saanut välttämättä käsitystä siitä, mikä sivuista olisi sellainen, millä aloittelija pääsee järkevästi alkuun.

Valitsin lopulta ensimmäiseksi testikohteeksi [sivuston](https://ultimateqa.com/simple-html-elements-for-automation/), joka ei varsinaisesti vastaa mitään oikeanlaista sivustoa, mutta tarjoaa testattavaksi erilaisia HTML- elementtejä, kuten buttoneita, linkkejä, valikoita ja listoja.

Aloitin testien kirjoittamisen buttons.robot- tiedostoon määrittelemällä ensin Settings- osioon Selenium- kirjaston, jotta sain sen avainsanat testitapausten käyttöön. Variables- osioon määrittelin testattavan sivun URL:n ja käytettävän selaimen. Testitapaukset määrittelin Test Cases- osioon. 

Ensimmäisessä testitapauksessa pyrin testaamaan, että saan kaiken toimimaan. Tapauksessa avattiin selaimessa testisivu antamalla Open Browser- avainsanalle attribuuteiksi URL ja käytetty selain. Lisäksi loin **Page Should Contain**- testitapauksen, joka tarkistaa, että sivulta löytyy joku siellä oleva teksti. Lopuksi lisäsin avainsanan **Teardown**. Teardown (suomeksi merkitys lienee testin purkaminen) ajetaan testin lopuksi ja se suoritetaan, vaikka testitapaus epäonnistuisi, jolloin sillä voidaan suorittaa puhdistavia toimenpiteitä.

Yritin ajaa testin [ohjeen mukaisesti](https://dev.to/juperala/how-to-run-robot-framework-test-from-command-line-5aa) komentoriviltä komennolla 
```
robot . 
```
Komento ei kuitenkaan toiminut, vaan tuotti virheilmoituksen _'robot' is not recognized as an internal or external command_. En saanut ongelmaa vielä ratkottua, mutta [löysin stackoverflowsta](https://stackoverflow.com/questions/56838851/robot-command-not-found-if-installing-robotframework-with-pip-user) alla olevan komennon, joka toimii, joten etenin toistaiseksi sillä.

```
python -m robot .
```
Kun ensimmäinen testi onnistui niin, että komentotulkissa luki testin kohdalla **PASS**, tiesin, että perusasiat on kunnossa ja voin jatkaa eteenpäin.

Halusin ensin kokoeilla sivuilla olevia Click Me- buttoneita. Testaaminen osoittautui yllättävän haastavaksi, koska yksi buttoneista olikin buttoniksi naamioitu linkki ja yksi buttoneista oli muotoiltu niin, että se näytti sivulla vain linkkitekstiltä. Lisäksi kolmessa paikassa oli lähes sama Click Me- alkuinen teksti, joten tekstin hyödyntäminen saattoi johtaa väärän kohteen klikkaamiseen. Jotta sain tarkasti selville, mitä olen testaamassa, avasin selaimen Developer Toolin ja etsin sitä kautta oikeat elementit. Lisäksi hyödynsin testitapauksissa Sleep- avainsanaa, jolle määrittelin muutaman sekunnin ajan. Näin ehdin nähdä, tapahtuuko klikkaaminen oikeassa paikassa tai avautuuko oikea sivu.

Selenium- kirjaston avainsanoille, joilla ohjataan sivuilla olevia elementtejä (esim tässä: Click Button tai Click Link), voi antaa locator- argumentin, jossa tarkennetaan, kuinka elementti löytyy sivulta. Argumentti voi perustua esimerkiksi elementin id- attribuuttiin tai XPath- lauseeseen.

Kun paikallistin buttonia ja linkkiä sivulta, päädyin lopulta erottamaan elementit toisistaan XPathin avulla kertomalla ensin, kumpi elementti on kyseessä (//button tai //a), minkä jälkeen niille saattoi antaa saman tekstisisällön (contains text(), "Click Me"). Yhden linkin paikallistin käyttämällä linkkitekstiä link- locatorin kanssa (link: linkkiteksti).

Tarkistin testien lopputulokset **Page Should Contain**- avainsanalla. Tarkastin yhdessä tapauksessa myös avautuvan sivun URLin.

Testejä ajaessa huomasi, että oli varsin hyödyllistä, kun testit oli kuvattu niin, että niiden nimestä pystyi päättelemään mitä missäkin tapauksessa testataan. Jos joku testi ei mennyt läpi, oli helppoa heti paikallistaa testi ja keksiä, missä vika.

Tein ensimmäiset testitapaukset niin, että jokainen testi avasi selaimen, suoritti omat tapaukset ja sulki selaimen. Seuraavaksi halusin kokeilla testisivua (dropdown.robot) niin, että \*\*\* Keywords \*\*\*- lohkossa loin testitapauksille kuvaavat nimet ja niiden mukaiset suoritukset, jolloin \*\*\* Test Cases \*\*\*- lohkossa pystyin avaamaan selaimen kerran, suorittamaan kaikki testit käyttämällä KeyWords- lohkon avainsanoja ja lopuksi sulkemaan selaimen. Dropdown- valikon testi ei kuitenkaan vielä toimi, vaan antaa ilmoituksen "Cannot locate option with value...".

## Pohdiskelua

Suurin osa seminaarityöhön käyttämästäni ajasta kului materiaalien lukemisessa tai haasteiden selvittelyssä. Työn aikana opin mielestäni perusaisoita siitä, miten Selenium- kirjastoa ja Robot Frameworkiä hyödynnetään nettisivujen automaatiotestauksessa. Työ jäi  kuitenkin hyvin keskeneräiseksi ja esimerkiksi raportteihin en ehtinyt perehtymään lainkaan. Ylipäätään aiheesta löytyi valtavasti materiaalia, jota en tässä työssä ehtinyt tutkimaan.

Robot Frameworkista löytyi maininta, että sitä voidaan hyödyntää esimerkiksi osana hyväksymistestausta. Sillä voidaan tavallaan suorittaa loppukäyttäjien testausta systemaattisesti ja niin usein kuin tarve vaatii. Testeillä voi samalla varmistaa, että jo toimivat sovelluksen osiot eivät mene rikki kun uusia osia lisätään tuotteeseen.


### Lähteitä

[BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)

[Robot Framework.org](https://robotframework.org/)

[Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#files-and-directories)

[SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#List%20Selection%20Should%20Be)

[ULTIMATE QA. Testisivu](https://ultimateqa.com/simple-html-elements-for-automation/)


