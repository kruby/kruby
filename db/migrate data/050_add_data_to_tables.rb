# -*- encoding : utf-8 -*-
class AddDataToTables < ActiveRecord::Migration
def self.up
Menu.create( :name => 'Menus', :title => 'Menus', :body => '

Link til Menus
', :active => 'true' )
Content.update(1, {:controller_name => 'menus', :category => 'Admin', :position => '90', :active => 'true'})
Menu.create( :name => 'Contents', :title => 'Contents', :body => '

Link til Contents
', :active => 'true' )
Content.update(2, {:controller_name => 'contents', :category => 'Admin', :position => '100', :active => 'true'})
Menu.create( :name => 'Products', :title => 'Products', :body => '

Link til Products
', :active => 'true' )
Content.update(3, {:controller_name => 'products', :category => 'Editor', :position => '110', :active => 'true'})
Menu.create( :name => 'Recipes', :title => 'Recipes', :body => '

Link til Recipes
', :active => 'true' )
Content.update(4, {:controller_name => 'recipes', :category => 'Editor', :position => '120', :active => 'true'})
Menu.create( :name => 'Newsarchives', :title => 'Newsarchives', :body => '

Link til Newsarchives
', :active => 'true' )
Content.update(5, {:controller_name => 'newsarchives', :category => 'Editor', :position => '130', :active => 'true'})
Menu.create( :name => 'Users', :title => 'Users', :body => '

Link til Users
', :active => 'true' )
Content.update(6, {:controller_name => 'users', :category => 'Admin', :position => '140', :active => 'true'})
Menu.create( :name => 'Pages', :title => 'Pages', :body => '

Link til Pages
', :active => 'true' )
Content.update(7, {:controller_name => 'pages', :category => 'Admin', :position => '120', :active => 'true'})
Menu.create( :name => 'Posts', :title => 'Posts', :body => '

Link til Posts
', :active => 'true' )
Content.update(8, {:controller_name => 'posts', :category => 'Admin', :position => '131', :active => 'true'})
Menu.create( :name => 'Bloggen', :title => 'Bloggen', :body => '

Link til bloggen
', :active => 'true' )
Content.update(9, {:controller_name => 'bloggen', :category => 'User', :position => '132', :active => 'true'})
Menu.create( :name => 'Relations', :title => 'Relations', :body => '

Link til Relationer
', :active => 'true' )
Content.update(10, {:controller_name => 'relations', :category => 'Editor', :position => '133', :active => 'true'})
Page.create( :name => 'Forside', :title => 'Velkommen til Jungle Juice', :body => 'Jungle Juice specialiserer sig i at give dig det allerbedste fra Brasiliens natur. Fuldt modnede bær der har fået tid til at opbygge det bedste af __vitaminer__ og __mineraler__, presses til den dejligste juice hvorefter det fryses ned til minus 70 grader. De vakuumpakkede 100 grams portioner, ligner mest af alt en lidt for stor sodavands is, og kan også sagtens nydes på denne måde en varm sommerdag. Den bedste smagsoplevelse får man dog ved at blende sine favorit smagsvarianter i det rigtig blandingsforhold. Mangler du inspiration, finder du til højre en lang række af vore lækre opskrifter. Vil du vide mere, så ring til os eller skrive en mail: <a href="/pages/4">Kontakt</a>', :headline => 'h1. Velkommen til Jungle Juice', :active => 'true', :image => 'forside_stor.gif', :image_class => 'foto_stort_1' )
Content.update(11, {:controller_name => 'viewer', :category => 'Admin', :position => '', :active => 'true'})
Page.create( :name => 'Produkter', :title => 'Produkter', :body => 'Vi ligger inde med rigtig mange produkter, som du kan bestille allesammen direkte ved at ringe til os. <a href="/pages/4">Kontakt</a> <br/> **Vi lagerførende med følgende produkter:**<br/> **Acai** **Cupuacu** **Mango** **Passion** **Ananas mint** **Acerola med appelsin**', :headline => 'h1. Lækre smagsoplevelser fra Brasilien!', :active => 'true', :image => 'forside.gif', :image_class => 'foto_lille' )
Content.update(12, {:controller_name => 'viewer', :category => 'Admin', :position => '', :active => 'true'})
Page.create( :name => 'Kontakt', :title => 'Kontakt', :body => 'Hvis du vil i kontakt med os kan du ringe på følgende numre: <br/><br/> **KOLDING** **Jacob Steen Hansen** + 45 28 26 74 76 Email: <notextile><a href="mailto:jacob@junglejuice.dk">jacob@junglejuice.dk</a></notextile> <br/><br/> **ODENSE** **Mikael Korsgaard** +45 20 74 42 11 Email: <notextile><a href="mailto:mikael@junglejuice.dk">mikael@junglejuice.dk</a></notextile> <br/><br/> **SILKEBORG** **Thomas Schmidt** +45 40 19 68 81 Email: <notextile><a href="mailto:thomas@junglejuice.dk">thomas@junglejuice.dk</a></notextile> p=(kontakt). Hvis der allerede er nogen på linien, så prøv mobilen!', :headline => 'h1. Kontakt information', :active => 'true', :image => 'kontakt_stor.gif', :image_class => 'foto_stort_1' )
Content.update(13, {:controller_name => 'pages', :category => 'Admin', :position => '', :active => 'true'})
Page.create( :name => 'Om os', :title => 'Om os', :body => 'Brasilien er stedet, hvor man kan smage de mest fantastiske frugtsafter takket være "verdens lunge" - Amazonas, den Brasilianske regnskov. JungleJuice er en nystartet dansk/brasiliansk importør af frugtsaft, med års erfaring indenfor dette felt. Vore samarbejdspartner i Brasilien sørger for, at kun den bedste kvalitet kommer til Danmark. Frugterne plukkes, frugtkød og saft presses og nedfryses ved minus 70 grader straks efter plukning. De vakuumpakkede 100 grams portioner kommer i frossen tilstand til Danmark i 1 kilos poser. Tager mand dem direkte fra fryseren og blender dem med vand, så har man en iskold velsmagende og fantastisk sund smoothie/juice. Der er langt fra Brasilien til Danmark, derfor skal kvaliteten og oplevelsen i vores produkter også være "den lange rejse værd". Prøv disse unikke smagsoplevelser og døm selv. ', :headline => 'h1. Hvem er vi?', :active => 'true', :image => 'forside_stor.gif', :image_class => 'foto_stort_1' )
Content.update(14, {:controller_name => 'viewer', :category => 'Admin', :position => '', :active => 'true'})
Page.create( :name => 'Opskrifter', :title => 'Opskrifter', :body => 'Her finder du rigtig mange lækre opskrifter på vore produkter.', :headline => 'Lækre opskrifter med Jungle Juice', :active => 'true', :image => '', :image_class => '' )
Content.update(15, {:controller_name => 'viewer', :category => 'Admin', :position => '', :active => ''})
Page.create( :name => 'Referencer', :title => 'Referencer', :body => 'Nedenfor vil du finde en lang række kunder der allerede handler med os.', :headline => 'Hvem køber hos os?', :active => 'true', :image => '', :image_class => '' )
Content.update(16, {:controller_name => 'viewer', :category => 'Admin', :position => '', :active => ''})
Page.create( :name => 'Acai næringsindhold', :title => 'Acai næringsindhold', :body => '<notextile> <table border="0" cellspacing="2" class="nutrition_table"> <tbody> <tr class="nutrition_table_header" > <td class="nutrition_text_header">Næring</td> <td class="nutrition_numbers_header">Mængde</td> <td class="nutrition_numbers_header">% AD</td> </tr> <tr> <td class="nutrition_text">Energi</td> <td class="nutrition_numbers" >48 kcal</td> <td class="nutrition_numbers" >2%</td> </tr> <tr> <td class="nutrition_text">Kulhydrater</td> <td class="nutrition_numbers" >0,2 g</td> <td class="nutrition_numbers" >0%</td> </tr> <tr> <td class="nutrition_text">Proteiner</td> <td class="nutrition_numbers" >1,1 g</td> <td class="nutrition_numbers" >1%</td> </tr> <tr> <td class="nutrition_text">Fedt</td> <td class="nutrition_numbers" >4,7 g</td> <td class="nutrition_numbers" >7%</td> </tr> <tr> <td class="nutrition_text">- Mættet</td> <td class="nutrition_numbers" >1,2 g</td> <td class="nutrition_numbers" >7%</td> </tr> <tr> <td class="nutrition_text">- Umættet</td> <td class="nutrition_numbers" >2,9 g</td> <td class="nutrition_numbers" >8%</td> </tr> <tr> <td class="nutrition_text">- Polyumættet/Heraf flerumættet fedt</td> <td class="nutrition_numbers" >0,6 g</td> <td class="nutrition_numbers" >5%</td> </tr> <tr> <td class="nutrition_text">- Kolesterol</td> <td class="nutrition_numbers" >0 g</td> <td class="nutrition_numbers" >0%</td> </tr> <tr> <td class="nutrition_text">Kostfibre</td> <td class="nutrition_numbers" >5,9 g</td> <td class="nutrition_numbers" >20%</td> </tr> <tr> <td class="nutrition_text">Kalcium</td> <td class="nutrition_numbers" >48mg</td> <td class="nutrition_numbers" >5%</td> </tr> <tr> <td class="nutrition_text">Kalium</td> <td class="nutrition_numbers" >159 mg</td> <td class="nutrition_numbers" >5%</td> </tr> <tr> <td class="nutrition_text">Magnesium</td> <td class="nutrition_numbers" >21 mg</td> <td class="nutrition_numbers" >6%</td> </tr> <tr> <td class="nutrition_text">Natrium</td> <td class="nutrition_numbers" >8 mg</td> <td class="nutrition_numbers" >0%</td> </tr> <tr> <td class="nutrition_text">Jern</td> <td class="nutrition_numbers" >1 mg</td> <td class="nutrition_numbers" >10%</td> </tr> <tr> <td class="nutrition_text">A vitaminer</td> <td class="nutrition_numbers" >5 mcg</td> <td class="nutrition_numbers" >1%</td> </tr> <tr> <td class="nutrition_text">Anthocyanin</td> <td class="nutrition_numbers" >196 mg</td> <td class="nutrition_numbers" >--</td> </tr> <tr> <td colspan="3" >AD betyder Anbefalet dagligt </td> </tr> </tbody></table> </notextile> h3. AD står for anbefalet daglig dosis, her angivet i procent ', :headline => 'h1. Acai næringsindhold', :active => 'false', :image => 'no_image', :image_class => '' )
Content.update(17, {:controller_name => 'pages', :category => 'Admin', :position => '', :active => 'false'})
Page.create( :name => 'Acerola næringsindhold', :title => 'Acerola næringsindhold', :body => '<notextile> <table border="0" cellspacing="2" class="nutrition_table"> <tbody><tr class="nutrition_table_header" > <td class="nutrition_text_header">Næring</td> <td class="nutrition_numbers_header">Mængde</td> <td class="nutrition_numbers_header">% AD</td> </tr> <tr > <td class="nutrition_text">Energi</td> <td class="nutrition_numbers">27 kcal</td> <td class="nutrition_numbers">1%</td> </tr> <tr > <td class="nutrition_text">Kulhydrater</td> <td class="nutrition_numbers">4,4 g</td> <td class="nutrition_numbers">1%</td> </tr> <tr > <td class="nutrition_text">Proteiner</td> <td class="nutrition_numbers">0,6 g </td> <td class="nutrition_numbers">1%</td> </tr> <tr > <td class="nutrition_text">Fedt</td> <td class="nutrition_numbers">0,8 g</td> <td class="nutrition_numbers">1%</td> </tr> <tr > <td class="nutrition_text">- Mættet </td> <td class="nutrition_numbers">0,2 g</td> <td class="nutrition_numbers">1%</td> </tr> <tr > <td class="nutrition_text">- Umættet</td> <td class="nutrition_numbers">0,6 g</td> <td class="nutrition_numbers">1%</td> </tr> <tr > <td class="nutrition_text">- Kolesterol </td> <td class="nutrition_numbers">0 g</td> <td class="nutrition_numbers">0%</td> </tr> <tr > <td class="nutrition_text">Kostfibre</td> <td class="nutrition_numbers">1,9 g</td> <td class="nutrition_numbers">6%</td> </tr> <tr > <td class="nutrition_text">Kalcium</td> <td class="nutrition_numbers">8,7 mg</td> <td class="nutrition_numbers">1%</td> </tr> <tr > <td class="nutrition_text">Natrium</td> <td class="nutrition_numbers">3,6 mg</td> <td class="nutrition_numbers">0%</td> </tr> <tr > <td class="nutrition_text">Jern</td> <td class="nutrition_numbers">0,7 mg</td> <td class="nutrition_numbers">7%</td> </tr> <tr > <td class="nutrition_text">A vitaminer</td> <td class="nutrition_numbers">76,6 mcg</td> <td class="nutrition_numbers">8%</td> </tr> <tr > <td class="nutrition_text">C vitaminer</td> <td class="nutrition_numbers">1650 mg</td> <td class="nutrition_numbers">&gt; 100% </td> </tr> </tbody></table> </notextile> h3. AD står for anbefalet daglig dosis, her angivet i procent ', :headline => 'h1. Acerola næringsindhold', :active => 'false', :image => '', :image_class => '' )
Content.update(18, {:controller_name => 'pages', :category => 'Admin', :position => '', :active => 'false'})
Page.create( :name => 'Mango næringsindhold', :title => 'Mango næringsindhold', :body => '<notextile><table border="0" cellspacing="2" width="100%" class="nutrition_table"> <tbody> <tr class="nutrition_table_header" > <td class="nutrition_text_header">Næring</td> <td class="nutrition_numbers_header" >Mængde</td> <td class="nutrition_numbers_header" >% AD</td> </tr> <tr> <td class="nutrition_text">Energi</td> <td class="nutrition_numbers" >59 kcal</td> <td class="nutrition_numbers" >2%</td> </tr> <tr> <td class="nutrition_text">Kulhydrater</td> <td class="nutrition_numbers" >15,4 g </td> <td class="nutrition_numbers" >4%</td> </tr> <tr> <td class="nutrition_text">Proteiner</td> <td class="nutrition_numbers" >0,5 g </td> <td align="right" width="20%">1%</td> </tr> <tr> <td class="nutrition_text">Fedt</td> <td class="nutrition_numbers" >0,2 g</td> <td class="nutrition_numbers" >0%</td> </tr> <tr> <td class="nutrition_text">- Mættet</td> <td class="nutrition_numbers" >0 g</td> <td class="nutrition_numbers" >0%</td> </tr> <tr> <td class="nutrition_text">- Umættet</td> <td class="nutrition_numbers" >0,2 g</td> <td class="nutrition_numbers" >0%</td> </tr> <tr> <td class="nutrition_text">- Kolesterol</td> <td class="nutrition_numbers" >0 g</td> <td class="nutrition_numbers" >0%</td> </tr> <tr> <td class="nutrition_text">Kostfibre</td> <td class="nutrition_numbers" >0,8 g</td> <td class="nutrition_numbers" >3%</td> </tr> <tr> <td class="nutrition_text">Kalcium</td> <td class="nutrition_numbers" >12 mg</td> <td class="nutrition_numbers" >2%</td> </tr> <tr> <td class="nutrition_text">Magnesium</td> <td class="nutrition_numbers" >9 mg</td> <td class="nutrition_numbers" >3%</td> </tr> <tr> <td class="nutrition_text">Natrium</td> <td class="nutrition_numbers" >14,1 mg</td> <td class="nutrition_numbers" >1%</td> </tr> <tr> <td class="nutrition_text">Jern</td> <td class="nutrition_numbers" >0,8 mg</td> <td class="nutrition_numbers" >8%</td> </tr> <tr> <td class="nutrition_text">A vitaminer</td> <td class="nutrition_numbers" >220 mcg</td> <td class="nutrition_numbers" >22%</td> </tr> <tr> <td class="nutrition_text">B2 vitaminer</td> <td class="nutrition_numbers" >56 mcg</td> <td class="nutrition_numbers" >4%</td> </tr> <tr> <td class="nutrition_text">B6 vitaminer</td> <td class="nutrition_numbers" >0,2 mg</td> <td class="nutrition_numbers" >13%</td> </tr> <tr> <td class="nutrition_text">C vitaminer</td> <td class="nutrition_numbers" >43 mg</td> <td class="nutrition_numbers" >28% </td> </tr> <tr> <td class="nutrition_text">E vitaminer</td> <td class="nutrition_numbers" >1,2 mg</td> <td class="nutrition_numbers" >9% </td> </tr> <tr> <td class="nutrition_text">Nicotinsyre</td> <td class="nutrition_numbers" >0,5 mg </td> <td class="nutrition_numbers" >4%</td> </tr> </tbody></table> </notextile> h3. AD står for anbefalet daglig dosis, her angivet i procent', :headline => 'h1. Mango næringsindhold', :active => 'false', :image => 'no_image', :image_class => '' )
Content.update(19, {:controller_name => 'pages', :category => 'Admin', :position => '', :active => 'false'})
Page.create( :name => 'Passion næringsindhold', :title => 'Passion næringsindhold', :body => '<notextile> <table border="0" cellspacing="2" width="100%" class="nutrition_table"> <tbody><tr class="nutrition_table_header"> <td class="nutrition_text_header">Næring</td> <td class="nutrition_numbers_header">Mængde</td> <td class="nutrition_numbers_header">% AD</td> </tr> <tr> <td class="nutrition_text">Energi</td> <td class="nutrition_numbers">90 kcal</td> <td class="nutrition_numbers">4%</td> </tr> <tr> <td class="nutrition_text">Kulhydrater</td> <td class="nutrition_numbers">21,5 g </td> <td class="nutrition_numbers">6%</td> </tr> <tr> <td class="nutrition_text">Proteiner</td> <td class="nutrition_numbers">2,2 g </td> <td class="nutrition_numbers">4%</td> </tr> <tr> <td class="nutrition_text">Fedt</td> <td class="nutrition_numbers">0,7 g</td> <td class="nutrition_numbers">1%</td> </tr> <tr> <td class="nutrition_text">- Mættet </td> <td class="nutrition_numbers">0,2 g</td> <td class="nutrition_numbers">1%</td> </tr> <tr> <td class="nutrition_text">- Umættet</td> <td class="nutrition_numbers">0 g</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">- Kolesterol </td> <td class="nutrition_numbers">0 g</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">Kostfibre</td> <td class="nutrition_numbers">0,7 g</td> <td class="nutrition_numbers">2%</td> </tr> <tr> <td class="nutrition_text">Kalcium</td> <td class="nutrition_numbers">13 mg</td> <td class="nutrition_numbers">2%</td> </tr> <tr> <td class="nutrition_text">Magnesium</td> <td class="nutrition_numbers">29 mg</td> <td class="nutrition_numbers">8%</td> </tr> <tr> <td class="nutrition_text">Natrium</td> <td class="nutrition_numbers">29 mg</td> <td class="nutrition_numbers">1%</td> </tr> <tr> <td class="nutrition_text">Jern</td> <td class="nutrition_numbers">1,6 mg</td> <td class="nutrition_numbers">16%</td> </tr> <tr> <td class="nutrition_text">Phosphor</td> <td class="nutrition_numbers">68 mg </td> <td class="nutrition_numbers">10%</td> </tr> <tr> <td class="nutrition_text">A vitaminer</td> <td class="nutrition_numbers">70 mcg</td> <td class="nutrition_numbers">7%</td> </tr> <tr> <td class="nutrition_text">B2 vitaminer</td> <td class="nutrition_numbers">0,2 mg</td> <td class="nutrition_numbers">14%</td> </tr> <tr> <td class="nutrition_text">C vitaminer</td> <td class="nutrition_numbers">43 mg</td> <td class="nutrition_numbers">28% </td> </tr> <tr> <td class="nutrition_text">Nicotinsäure</td> <td class="nutrition_numbers">1,6 mg </td> <td class="nutrition_numbers">10%</td> </tr> </tbody></table> </notextile> h3. AD står for anbefalet daglig dosis, her angivet i procent ', :headline => 'h1. Passion næringsindhold', :active => 'false', :image => 'no_image', :image_class => '' )
Content.update(20, {:controller_name => 'pages', :category => 'Admin', :position => '', :active => 'false'})
Page.create( :name => 'Ananas Mint næringsindhold', :title => 'Ananas Mint næringsindhold', :body => '<notextile> <table border="0" cellspacing="2" width="100%" class="nutrition_table"> <tbody><tr class="nutrition_table_header"> <td class="nutrition_text_header">Næring</td> <td class="nutrition_numbers_header">Mængde</td> <td class="nutrition_numbers_header">%AD</td> </tr> <tr> <td class="nutrition_text">Energi</td> <td class="nutrition_numbers">52 kcal</td> <td class="nutrition_numbers">2%</td> </tr> <tr> <td class="nutrition_text">Kulhydrater</td> <td class="nutrition_numbers">13,7g</td> <td class="nutrition_numbers">4%</td> </tr> <tr> <td class="nutrition_text">Proteiner</td> <td class="nutrition_numbers">0,4g</td> <td class="nutrition_numbers">1%</td> </tr> <tr> <td class="nutrition_text">Fedt</td> <td class="nutrition_numbers">0,2g</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">- Mættet</td> <td class="nutrition_numbers">0g</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">- Umættet</td> <td class="nutrition_numbers">0g</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">- Kolesterol</td> <td class="nutrition_numbers">0g</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">Kostfibre</td> <td class="nutrition_numbers">0,4g</td> <td class="nutrition_numbers">1%</td> </tr> <tr> <td class="nutrition_text">Kalcium</td> <td class="nutrition_numbers">18mg</td> <td class="nutrition_numbers">2%</td> </tr> <tr> <td class="nutrition_text">Jern</td> <td class="nutrition_numbers">0,5mg</td> <td class="nutrition_numbers">5%</td> </tr> <tr> <td class="nutrition_text">Magnesium</td> <td class="nutrition_numbers">14 mg</td> <td class="nutrition_numbers">5%</td> </tr> <tr> <td class="nutrition_text">Natrium</td> <td class="nutrition_numbers">31,5 mg</td> <td class="nutrition_numbers">1%</td> </tr> <tr> <td class="nutrition_text">A vitaminer</td> <td class="nutrition_numbers">5 mcg</td> <td class="nutrition_numbers">1%</td> </tr> <tr> <td class="nutrition_text">B1 vitaminer</td> <td class="nutrition_numbers">80 mcg</td> <td class="nutrition_numbers">7%</td> </tr> <tr> <td class="nutrition_text">C vitaminer</td> <td class="nutrition_numbers">27,2 mg</td> <td class="nutrition_numbers">27%</td> </tr> <tr> <td class="nutrition_text">Nicotinsyre</td> <td class="nutrition_numbers">0,82 mg</td> <td class="nutrition_numbers">5%</td> </tr> </tbody></table> </notextile> h3. AD står for anbefalet daglig dosis, her angivet i procent ', :headline => 'h1. Ananas Mint næringsindhold', :active => 'false', :image => '', :image_class => '' )
Content.update(21, {:controller_name => 'pages', :category => 'Admin', :position => '', :active => 'false'})
Page.create( :name => 'Cupuacu Næringsindhold', :title => 'Cupuacu Næringsindhold', :body => '<notextile> <table border="0" cellspacing="2" width="100%" class="nutrition_table"> <tbody><tr class="nutrition_table_header"> <td class="nutrition_text_header">Næring</td> <td class="nutrition_numbers_header">Mængde</td> <td class="nutrition_numbers_header">%AD</td> </tr> <tr> <td class="nutrition_text">Energi</td> <td class="nutrition_numbers">72 kcal</td> <td class="nutrition_numbers">3%</td> </tr> <tr> <td class="nutrition_text">Kulhydrater</td> <td class="nutrition_numbers">ingen</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">Proteiner</td> <td class="nutrition_numbers">1,7g</td> <td class="nutrition_numbers">3%</td> </tr> <tr> <td class="nutrition_text">Fedt</td> <td class="nutrition_numbers">ingen</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">- Mættet</td> <td class="nutrition_numbers">ingen</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">- Umættet</td> <td class="nutrition_numbers">ingen</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">- Kolesterol</td> <td class="nutrition_numbers">ingen</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">Kostfibre</td> <td class="nutrition_numbers">0,5g</td> <td class="nutrition_numbers">1,5%</td> </tr> <tr> <td class="nutrition_text">Kalcium</td> <td class="nutrition_numbers">23mg</td> <td class="nutrition_numbers">2,5%</td> </tr> <tr> <td class="nutrition_text">Jern</td> <td class="nutrition_numbers">2,6mg</td> <td class="nutrition_numbers">26%</td> </tr> <tr> <td class="nutrition_text">Magnesium</td> <td class="nutrition_numbers">ingen</td> <td class="nutrition_numbers">0%</td> </tr> <tr> <td class="nutrition_text">Phosphor</td> <td class="nutrition_numbers">2,6 mg</td> <td class="nutrition_numbers">0,5%</td> </tr> <tr> <td class="nutrition_text">B1 vitaminer</td> <td class="nutrition_numbers">0,4 mg</td> <td class="nutrition_numbers">3%</td> </tr> <tr> <td class="nutrition_text">B2 vitaminer</td> <td class="nutrition_numbers">0,4 mg</td> <td class="nutrition_numbers">28%</td> </tr> <tr> <td class="nutrition_text">C vitaminer</td> <td class="nutrition_numbers">18 mg</td> <td class="nutrition_numbers">12%</td> </tr> <tr> <td class="nutrition_text">Nicotinsäure</td> <td class="nutrition_numbers">0,5 mg</td> <td class="nutrition_numbers">4%</td> </tr> </tbody></table> </notextile> h3. AD står for anbefalet daglig dosis, her angivet i procent ', :headline => 'h1. Cupuacu Næringsindhold', :active => 'false', :image => '', :image_class => '' )
Content.update(22, {:controller_name => 'pages', :category => 'Admin', :position => '', :active => 'false'})
Product.create( :name => 'Acai', :headline => 'h1. Acai - verdens sundeste spise!', :description => '

Stammer fra den nordlige del af den brasilianske regnskov, hvor dette specielle bær i århundreder er blevet spist samt drukket som saft af de indfødte indianere i Amazon regnskoven.

Acai er proppet med antioxydanter og er særdeles rig på vitaminer og mineraler. Bærret er violet i farven og vokser i toppen på de meget høje acaipalmer.

Acai har i mange år været værdsat over hele Brasilien. I de senere år er acai også blevet kendt ud over Brasiliens grænser, ofte introduceret af sportsfolk, som har stiftet
bekendtskab med bærret som et
både velsmagende og supersundt bær.

I USA har man kåret Acai bærret, som det absolut sundeste du overhovedet kan spise.

Næringsindhold
', :kind => '', :cost_price => '', :sales_price => '', :purchase_quantity => '', :stock_in => '', :stock_out => '', :stock => '', :created_at => 'Mon Jun 30 18:29:33 +0200 2008', :updated_at => 'Mon Nov 03 21:25:41 +0100 2008', :active => '1', :image => 'acai_ani.gif', :title => 'Acai', :image_class => '' )
Content.update(23, {:controller_name => 'products', :category => 'Admin', :position => '', :parent_id => '12', :active => 'true'})
Product.create( :name => 'Acerola', :headline => 'h1. Acerola - 120 gange mere C-vitamin<br/>end i en appelsin', :description => '

Kendes i Brasilien også under navnet Barbados kirsebær.

Den let syrlige og samtidig bløde smag, som acerola får, når den blandes med appelsin, er en af de mest populære frugtdrikke i Brasilien.

Den store interesse for acerola startede i begyndelsen af 40´erne, da videnskabsmænd fandt ud af, at bærret er en sand c-vitaminbombe.

Acerola er det bær i verden der indeholder mest c-vitamin. Ca. 100 gange mere c-vitamin, sammenlignet med appelsin og citron. Acerola fåes også i pilleform overalt i verden og bruges som naturmedicin til forebyggelse samt helbredelse af bl.a. influenza, forkølelse, ledsmerter og muskelsmerter.

Næringsindhold

', :kind => '', :cost_price => '', :sales_price => '', :purchase_quantity => '', :stock_in => '', :stock_out => '', :stock => '', :created_at => 'Mon Jun 30 18:33:25 +0200 2008', :updated_at => 'Mon Nov 03 21:26:04 +0100 2008', :active => '1', :image => 'acerola_ani.gif', :title => 'Acerola', :image_class => '' )
Content.update(24, {:controller_name => 'products', :category => 'Admin', :position => '', :parent_id => '12', :active => 'true'})
Product.create( :name => 'Brasiliansk mango', :headline => 'h1. Mango - "Frugtens konge"', :description => '

Mango er en velkendt og værdsat frugt overalt i verden. Den går også under navnet " frugtens konge"

Mango træet vokser mange steder i Brasilien.
Man ser den i baghaver, langs veje og på marker.

Der findes mange forskellige typer af mango i verden , selv indenfor Brasiliens egne grænser.
I Brasilien og i troperne gernerelt, er mangoen en vigtig del af kosten, da den er fuld af vigtige mineraler og vitaminer.

Mangofrugten har det allerhøjeste indhold af A-vitamin blandt samtlige verdens frugter. Mangoen indeholder også meget C-vitamin samt mineraler som fosfor,jern og calcium.

Vores gule mango er fra et område i Brasilien ( Minas Gerais) der netop er kendt for meget smagfulde og søde mangoer.

Næringsindhold
', :kind => '', :cost_price => '', :sales_price => '', :purchase_quantity => '', :stock_in => '', :stock_out => '', :stock => '', :created_at => 'Wed Jul 02 19:05:50 +0200 2008', :updated_at => 'Fri Nov 07 13:22:05 +0100 2008', :active => '1', :image => '', :title => 'Brasiliansk mango', :image_class => '' )
Content.update(25, {:controller_name => 'products', :category => 'Admin', :position => '', :parent_id => '12', :active => 'true'})
Product.create( :name => 'Cupuacu', :headline => 'h1. Cupuacu - En skat fra den <br/>Brasilianske Amazon region!', :description => '

Denne cremede og lækre frugt har sit navn fra de indfødte indianere, som hurtigt lærte at værdsætte denne fortrinlige frugt.

Den er ofte blevet kaldt " the pharmacy og the Amazon",hvilket giver et godt billede af frugtens kompleksitet.

Den er supersund med mange vitaminer, mineraler samt en høj koncentration af antioxidanter. Den er derfor udnævnt som "superfrugt", hvilket kun gælder for et fåtal af verdens frugter!

Den bliver også brugt i skønhedsindustrien som aktiv ingrediens i antirynkecremer, da frugten skønnes at have en udglattende virkning på huden.

I nydelsesindustrien indgår den i Brasilien som fyld i chokolader, som vi kender det herhjemme med mint. Faktisk er cupuacu arten i familien med kakao planten!!

Cupuacu er smagsmæssig en dejlig cremet og forfriskende oplevelse. Den er let syrlig i smagen.

Næringsindhold
', :kind => '', :cost_price => '', :sales_price => '', :purchase_quantity => '', :stock_in => '', :stock_out => '', :stock => '', :created_at => 'Wed Jul 02 19:24:57 +0200 2008', :updated_at => 'Mon Nov 03 21:26:27 +0100 2008', :active => '1', :image => '', :title => 'Cupuacu', :image_class => '' )
Content.update(26, {:controller_name => 'products', :category => 'Admin', :position => '', :parent_id => '12', :active => 'true'})
Product.create( :name => 'Ananas med mint', :headline => 'h1. Ananas med mint', :description => '

Ananas mint kan være stærkt vanedannende! Har man først en gang smagt denne dejlige drik er man ”solgt”. Mint og ananas passer fortrinligt sammen.

De brasilianske ananas er kendt for at være meget store og saftige.

Udover en smagsmæssig oplevelse vil man også få frugtens ganske høje procentdel af A-, B- og C-vitaminer samt dens mineraler.

Mint er kendt for sine antibakterielle egenskaber og indeholder desuden et enzym kaldet bromelina, der er med til at omforme protein til aminosyre, så kroppen kan gøre brug af det.

Næringsindhold

', :kind => '', :cost_price => '', :sales_price => '', :purchase_quantity => '', :stock_in => '', :stock_out => '', :stock => '', :created_at => 'Fri Sep 12 23:52:12 +0200 2008', :updated_at => 'Mon Nov 03 21:26:32 +0100 2008', :active => '1', :image => 'ananas_ani.gif', :title => 'Ananas med mint', :image_class => '' )
Content.update(27, {:controller_name => 'products', :category => 'Admin', :position => '', :parent_id => '12', :active => 'true'})
Product.create( :name => 'Passionsfrugt', :headline => 'h1. Passionsfrugt', :description => '

Indianerne introducerede maracuja frugten til Jesuitterne, der straks blev vilde med smagen og dens ekstraordinære friske og afslappende virkning.

Jesuitterne kunne også bruge den farverige frugt til at forklare Jesus historie. I frugten fandt de symboler på den tornede krone, korset og Jesu blod.
På denne måde fik maracuja navnet passionsfrugt.

Den gule brasilianske passionsfrugt er mere syrlig i smagen end andre passionsfrugter. Det er den dejlige aroma og friske syrlighed der gør frugten nærmest perfekt som juice og til
frugtsaftblandinger.

Frugten er rig på A og C vitaminer, mineraler og fibre.

Næringsindhold
', :kind => '', :cost_price => '', :sales_price => '', :purchase_quantity => '', :stock_in => '', :stock_out => '', :stock => '', :created_at => 'Sat Sep 13 07:58:48 +0200 2008', :updated_at => 'Mon Nov 03 21:26:36 +0100 2008', :active => '1', :image => 'passion_ani.gif', :title => 'Passionsfrugt', :image_class => '' )
Content.update(28, {:controller_name => 'products', :category => 'Admin', :position => '', :parent_id => '12', :active => 'true'})
Newsarchive.create( :title => 'Acai, verdens sundeste spise!', :text => '

Hvis du vil spise noget sundt, skal du spise Acai.
', :author => 'TKS', :link => '', :created_at => 'Mon Jun 30 17:32:29 +0200 2008', :updated_at => 'Mon Oct 27 14:48:42 +0100 2008', :active => '', :name => 'Acai', :image => '' )
Newsarchive.create( :title => 'Ny hjemmeside i luften', :text => '

Så er den nye hjemmeside gået i luften.
', :author => 'TKS', :link => '', :created_at => 'Sat Sep 13 08:07:11 +0200 2008', :updated_at => 'Mon Oct 27 14:45:06 +0100 2008', :active => '', :name => 'Ny hjemmeside', :image => '' )
Newsarchive.create( :title => 'Frossen frugt sundest!', :text => '

Fuldt modnede frugt og grønsager er sundere, end såkaldt "frisk frugt", der er plukket for tidligt og istedet modner under transporten.
', :author => 'TKS', :link => '', :created_at => 'Mon Oct 27 14:46:41 +0100 2008', :updated_at => 'Mon Oct 27 14:48:21 +0100 2008', :active => 'true', :name => 'Frossen frugt sundest!', :image => '' )
Post.create( :title => 'Skriv i bloggen', :body => '

Hvis I har noget interessant at sige, eller bare noget vi skal huske, så skriv det ind her.

Hilsen Thomas
', :author => 'TKS', :priority => '1', :created_at => 'Mon Sep 29 12:07:52 +0200 2008', :updated_at => 'Wed Nov 05 10:12:57 +0100 2008', :parent_id => '', :user_id => '1' )
Post.create( :title => 'Møde', :body => '

Vi skal snarest muligt have datosat et nyt møde, så vi kan planlægge aktiviteter fremover.
', :author => 'TKS', :priority => '1', :created_at => 'Mon Sep 29 12:08:33 +0200 2008', :updated_at => 'Wed Nov 05 10:13:07 +0100 2008', :parent_id => '', :user_id => '1' )
Post.create( :title => 'God ide', :body => '

jeg synes det er en god ide at vi skriver her. Så afløser det lighthouse, ikke sandt. Så har vi det hele samlet et sted :-)
Jacob
', :author => 'JSH', :priority => '1', :created_at => 'Tue Sep 30 18:59:41 +0200 2008', :updated_at => 'Wed Nov 05 10:14:51 +0100 2008', :parent_id => '', :user_id => '2' )
Post.create( :title => 'Smooth Ice konceptet', :body => '

Vi skal have etableret de kombinationer af produkter vi ønsker at lancere som Smooth Ice/Slush Ice specielt i forhold til Givskud Løvepark.
Nu var Smooth Ice bare noget jeg lige fandt på, fordi vi skal adskille os fra det gængse Slush Ice koncept, da vore produkter jo er langt sundere.
Så med Smooth Ice glider det hele lidt nemmere ned også for forældrene, der giver deres børn noget sundt at drikke/spise.
', :author => 'TKS', :priority => '1', :created_at => 'Sun Oct 12 19:27:22 +0200 2008', :updated_at => 'Wed Nov 05 10:15:12 +0100 2008', :parent_id => '', :user_id => '1' )
Post.create( :title => 'Arbejdspunkter', :body => '

Nedenstående er et forslag til de vigtige emner vi bør tale om meget hurtigt for at få projektet på skinner.

**Oplæg til arbejdspunkter**

**1 - Møde rutiner**
Vi skal afgøre hvor ofte vi skal mødes/tale sammen for at gøre status på de ting vi har sat igang. Vi skal også have en fast måde vi holder møderne på, f.eks. med en dagsorden. Generelt skal der selvfølgelig også være plads til at ordet er frit, men bloggen kan sagtens bruges til at skrive ideer ned vedr. mødet.

**2 - Arbejds- og opgavefordeling**
Hvor meget tid kan vi hver især give til projektet på ugentlig basis.
Hvem tager sig af hvad og hvornår kan vi forvente det færdigt.
Det er vigtigt at vi udnytter vore resourcer bedst muligt.

**3 - Salgsstrategi**
Hvilke målgrupper skal vi satse på her og nu?
Der er rigtig mange målgrupper, men hvilke skal vi satse på, for at opnå et konstant og tilbagevendende salg.
Skal vi på længere sigt entrere med et catering firma, der kan overtage de kunder vi selv har skaffet?

**4 - Konkrete kundemner**
Der skal udarbejdes en konkret liste over de kundemner der skal besøges.

**5 - Salgsaktiviteter**
Vi skal udover stepperne salgsmæssigt.
Er det muligt at ansætte en sælger deltids og samtidigt aflønne ham fornuftigt.
Jacob nævner naboen der kan arbejde for os indtil 1. januar.
Han skal aflønnes både med hensyn til kørsel, men også i forhold til det salg der kommer efter han har forladt skuden. F.eks. provision af salg til hans kunder i de 6 efterfølgende måneder.

**6 - Salg til private**
Er det noget vil skal igangsætte nu, set i forhold til omsætningen her og arbejdet forbundet med det.
Forslaget med hensyn til "Startpakken" giver mere arbejde, men er nødvendig for at slutbrugeren får den rigtige oplevelse første gang, og dermed kommer tilbage igen.
Vi skal leve af mund til mund, og mange vil blot "have de der sunde bær fra Brasilien, som smager så godt!"

**7 - Ordrestyring vedr. B2B kunder**
Skal vi her og nu indrette hjemmesiden sådan at B2B kunder kan gå ind og bestille direkte herfra, se status på ordre og statistik på tidligere køb.
Når/hvis man bygger dette, er næste logisk skridt, at man også online kan fakturere kunden direkte, se statistik, registrere betaling etc.

**8 - Distribution**
Vi skal kigge på, hvordan vi optimerer distributionen, så vi ikke bruger for meget tid på levering.
', :author => 'TKS', :priority => '1', :created_at => 'Thu Oct 16 10:00:07 +0200 2008', :updated_at => 'Wed Nov 05 10:15:21 +0100 2008', :parent_id => '', :user_id => '1' )
Post.create( :title => 'Ang. oplæg.', :body => '

Jeg er enig i, at disse punkter er nogle som vi skal have styr på - jo før jo bedre!
Lad os hurtig vende hvordan og hvorledes. Især med min genbo, hvis vi skal gøre brug af ham. Han har jo kun til max 1.1
Jeg ringer til Paulo imorgen og får gang i nogle priser på levering samt det med økologiske varer.
jacob
', :author => 'JSH', :priority => '1', :created_at => 'Thu Oct 16 22:32:30 +0200 2008', :updated_at => 'Wed Nov 05 10:15:33 +0100 2008', :parent_id => '', :user_id => '2' )
Post.create( :title => 'Comwell kæden', :body => '

Blev idag ringet op af Thomas Christensen fra Catering Engros.
Hans kunde er Comwell Hotellet i bl.a. Snekkersten på Sjælland, der efterspørger Acai og Acerola.
Han vil aftale møde med kokken Peter, hvorefter vi dukker op for at demo produkterne.
Herefter kunne vi tage en snak med salgschefen for Catering Engros om et evt. samarbejde.
En lager på Sjælland vil jo ikke være så dårligt.
Catering Engros har hele Comwell kæden samt bl.a. Scandic kæden.
', :author => 'TKS', :priority => '1', :created_at => 'Wed Oct 22 15:28:36 +0200 2008', :updated_at => 'Wed Nov 05 10:15:40 +0100 2008', :parent_id => '', :user_id => '1' )
Post.create( :title => 'A5 kort', :body => '

Hej Thomas.
Husk A5 kort på vores produkter.
', :author => 'JSH', :priority => '1', :created_at => 'Thu Oct 23 21:43:39 +0200 2008', :updated_at => 'Wed Nov 05 10:15:59 +0100 2008', :parent_id => '', :user_id => '2' )
Post.create( :title => 'medio marts', :body => '

Årøsund badehotel vil gerne betille vores produkter fra medio marts. Så det er lige en reminder så vi ikke glemmer dette.
jacob
', :author => 'JSH', :priority => '1', :created_at => 'Fri Oct 24 14:18:14 +0200 2008', :updated_at => 'Wed Nov 05 10:16:35 +0100 2008', :parent_id => '', :user_id => '2' )
Recipe.create( :name => 'acai og æble smoothie', :text => '

100 gram acai pulp,
150 ml æblejuice,
2 teskefulde honning,
½ banan.
Blend
', :active => 'true', :type => '', :image => '', :title => 'acai og æble smoothie' )
Recipe.create( :name => 'acai og mango', :text => '

50 gram acai pulp,
50 gram mango pulp,
150 ml æblejuice,
evt. 2 jordbær.
Blend
', :active => 'true', :type => '', :image => '', :title => 'acai og mango' )
Recipe.create( :name => 'acai og mango bowle', :text => '

100 gram acai pulp,
100 gram mango pulp,
150 ml æblejuice,
½ banan,
en smule honning som afrunding.
blend
', :active => 'true', :type => '', :image => '', :title => 'acai og mango bowle' )
Recipe.create( :name => 'acai med forskellige bær', :text => '

100 gram acai pulp, 150 ml. æble juice,2 x jordbær, 5 x raspberries, 5 x blåbær. Blend
', :active => 'true', :type => '', :image => '', :title => 'acai med forskellige bær' )
Recipe.create( :name => 'acai med solbær', :text => '

en håndfuld solbær, 100 gram acai pulp, 150 ml. appelsin juice, 2 skefulde yoghurt. Blend
', :active => 'true', :type => '', :image => '', :title => 'acai med solbær' )
Recipe.create( :name => 'acai og yoghurt smoothie', :text => '

100 gram acai pulp, 100 ml. yoghurt natural, 1 lille banan, 50 ml. vand, en smule honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acai og yoghurt smoothie' )
Recipe.create( :name => 'acai natural', :text => '

100 gram acai pulp,
100 ml mælk eller vand,
evt. en smule honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acai natural' )
Recipe.create( :name => 'acai og banan', :text => '

100 gram acai pulp, 100 ml mælk, en lille banan, evt. lidt honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acai og banan' )
Recipe.create( :name => 'acai og jordbær', :text => '

100 gram acai pulp, 100 ml mælk ( eller vand) 3 - 5 jordbær, evt lidt honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acai og jordbær' )
Recipe.create( :name => 'acai og acerola', :text => '

100 gram acai pulp, 100 gram acerola/ appelsin pulp, 200 ml vand, evt. honning. Blend
', :active => 'true', :type => '', :image => '', :title => 'acai og acerola' )
Recipe.create( :name => 'acai na tigela', :text => '

200 gram acai pulp, 1 banan, 1 skefuld honning,200 ml æblejuice.Blend.Müsli drysses på toppen. Værsgo og spis!
', :active => 'true', :type => '', :image => '', :title => 'acai na tigela' )
Recipe.create( :name => 'acai na tigela med appelsin', :text => '

200 gram acai pulp, 100 ml. appelsinjuice, 2 skefulde honning, 2-3 skiver banan. Blend. Müsli drysses på. Værsgo og spis!
', :active => 'true', :type => '', :image => '', :title => 'acai na tigela med appelsin' )
Recipe.create( :name => 'acai energidrik', :text => '

200 gram acai pulps, 100 gram acerola/ appelsinpulp,100 gram ananas med mint pulp,150 ml. vand, 4 jordbær, ½ banan, 2 skefulde honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acai energidrik' )
Recipe.create( :name => 'acerola/appelsin', :text => '

2 pulps af acerola/appelsin, 200 ml vand.2-3 skefulde sukker eller honning.Blend!
', :active => 'true', :type => '', :image => '', :title => 'acerola/appelsin ' )
Recipe.create( :name => 'acerola/appelsin milkshake', :text => '

1 pulp acerola/appelsin, 150 ml mælk,1-2 skefuld honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acerola/appelsin milkshake' )
Recipe.create( :name => 'acerola/appelsin og yoghurt ', :text => '

1 pulp acerola/apppelsin,70 ml. vand, 50 ml. yoghurt natural, 1-2 skefuld honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acerola/appelsin og yoghurt' )
Recipe.create( :name => 'acerola/appelsin og jordbær', :text => '

2 pulps med acerola/appelsin,5 jordbær,100 ml vand. 1-2 skefulde sukker.Blend
', :active => 'true', :type => '', :image => '', :title => 'acerola/appelsin og jordbær' )
Recipe.create( :name => 'acerola/appelsin med ananas og mint', :text => '

1 pulp med acerola/ appelsin, 1 pulp med ananas med mint, 200 ml vand.1-3 skefulde honning eller sukker efter behag.Blend
', :active => 'true', :type => '', :image => '', :title => 'acerola/appelsin med ananas med mint' )
Recipe.create( :name => 'acerola/appelsin og acai', :text => '

1 pulp acerola/appelsin, 1 pulp acai, 200 ml vand. Evt.1-2 skefulde honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'acerola/appelsin og acai' )
Recipe.create( :name => 'mango', :text => '

1 pulp mango, 150 ml vand, evt lidt honning eller sukker/andet sødemiddel. Blend
', :active => 'true', :type => '', :image => '', :title => 'mango' )
Recipe.create( :name => 'mango og acai', :text => '

1 pulp mango, 1 pulp acai,150 ml æblejuice, 4 jordbær. Evt honning. blend
', :active => 'true', :type => '', :image => '', :title => 'mango og acai ' )
Recipe.create( :name => 'mango og acai bowle', :text => '

1 pulp acai, 1 pulp mango, 150 ml æblejuice, ½ banan, lidt honning,Blend
', :active => 'true', :type => '', :image => '', :title => 'mango og acai bowle' )
Recipe.create( :name => 'mango og kokos', :text => '

1 pulp mango,50 gram kokosnød,100ml vand,2 skefulde yoghurt natural.blend
', :active => 'true', :type => '', :image => '', :title => 'mango og kokos' )
Recipe.create( :name => 'mango og vanille', :text => '

1 pulp mango, 3 skefulde vanille yoghurt eller vanilleis, 75-100 ml vand.blend
', :active => 'true', :type => '', :image => '', :title => 'mango og vanille' )
Recipe.create( :name => 'mango og appelsin', :text => '

1 mango pulp, 175 ml friskpresset appelsinsaft,lidt limesaft.Blend
', :active => 'true', :type => '', :image => '', :title => 'mango og appelsin' )
Recipe.create( :name => 'mango, kokos og banan', :text => '

50 gram mango ( ½ mango pulp), 50 gram kokossaft, 150 ml. vand, 2 skefulde yoghurt, en smule honning.Blend
', :active => 'true', :type => '', :image => '', :title => 'mango, kokos og banan ' )
Recipe.create( :name => 'mango og passionsfrugt', :text => '

1 pulp mango, 1 pulp passionsfrugt, 200l vand.Tilsæt sukker eller honning efter smag. Blend
', :active => 'true', :type => '', :image => '', :title => 'mango og passionsfrugt' )
Recipe.create( :name => 'mango og yoghurt ', :text => '

1 pulp mango, 150 ml. yoghurt natural, honning efter behag.Blend
', :active => 'true', :type => '', :image => '', :title => 'mango og yoghurt' )
Recipe.create( :name => 'mango og æble', :text => '

1 pulp mango, 150 ml. æblejuice. Blend
', :active => 'true', :type => '', :image => '', :title => 'mango og æble' )
Recipe.create( :name => 'passionsfrugt', :text => '

1 pulp passionsfrugt, 100 ml. vand, tilsæt 1-2 skefulde honning, sukker eller andet sødemiddel.Blend
', :active => 'true', :type => '', :image => '', :title => 'passionsfrugt' )
Recipe.create( :name => 'passions og mangofrugt', :text => '

½ pulp mango, ½ pulp passionsfrugt, 120 ml vand, evt.honning eller andet sødemiddel efter behov.Blend
', :active => 'true', :type => '', :image => '', :title => 'passions og mangofrugt' )
Recipe.create( :name => 'passions og kokos smoothie', :text => '

½ pulp passionsfrugt, 50 gram kokos,100ml. vand, ½ banan, 2 skefulde yoghurt natural.Blend
', :active => 'true', :type => '', :image => '', :title => 'passions og kokos smoothie' )
Recipe.create( :name => 'passions og mango smoothie', :text => '

½ pulp passionfrugt,½ pulp mango,100 ml. vand, ½ banan,2 skefulde yoghurt natural.Blend
', :active => 'true', :type => '', :image => '', :title => 'passion og mango smoothie' )
Recipe.create( :name => 'passion, mango og kokos smoothie ', :text => '

½ pulp passionsfrugt,½pulp mango,50 gram kokos,100ml. vand,½ banan,2 skefulde yoghurt natural.Blend
', :active => 'true', :type => '', :image => '', :title => 'passions,mango og kokos smoothie' )
Relation.create( :company => 'Bella Vista', :address => '', :postno => '8600', :city => 'Silkeborg', :log => '170908 Er en stor virksomhed der sælger hår produkter og frisør udstyr til alle Danmarks frisører. De har mange kursister og har selv kantineordning. De har fået en pose Ananas/Mint og en pose Acerola. Har talt med Dorte Kierkegaard og Lars Bramming', :category => 'Kontakt', :responsible => 'TKS', :phone => '' )
Relation.create( :company => 'Kasper & Co. ApS', :address => 'Holmetoften 17', :postno => '2970', :city => 'Hørsholm', :log => 'email: kontakt@kasperco.dk CVR-nummer: 27438407 Lars Bo er kontakt person. 61 65 03 61 Har tilbudt ham at få en reklame med på vores hjemmeside. ', :category => 'Leverandør', :responsible => 'TKS', :phone => 'Hovednr. 45 76 44 96 Fax.: 45764492 ' )
Relation.create( :company => 'Catering Engros', :address => 'Stamholmen 175', :postno => '2650', :city => 'Hvidovre', :log => 'Thomas Christensen henvendte sig på vegne af en af sine kunder, Comwell hotellerne der i Snekkersten har en hel wellness ting igang. ', :category => 'Kontakt', :responsible => 'TKS', :phone => '70 80 80 80 Hovednr. 25 59 09 93 Thomas Christensen' )
User.create( :login => 'thomas', :email => 'ts@korsgaard-freelance.dk', :crypted_password => '56c10a4393984f783def3a58fd76833879f261d3', :salt => 'adc712d00c4da3e33326f2edb9286c24de85dc0a', :created_at => 'Wed Oct 15 23:11:29 +0200 2008', :updated_at => 'Fri Nov 07 17:04:42 +0100 2008', :admin => '', :active => 'true', :category => 'Admin', :blogname => 'TKS' )
User.create( :login => 'jacob', :email => 'jacob.copacabana@gmail.dk', :crypted_password => 'e76fff378850a15141d179c48e1db2d2f066b99c', :salt => '418069793b66ba9ed58b22572d88a1ef0c711e89', :created_at => 'Wed Oct 15 23:25:59 +0200 2008', :updated_at => 'Wed Nov 05 12:09:59 +0100 2008', :admin => '', :active => 'false', :category => 'Editor', :blogname => 'JSH' )
User.create( :login => 'mikael', :email => 'vmiks@hotmail.dk', :crypted_password => 'e862fb1edb49d1e47de7d26610b0e110801a6711', :salt => 'fce802a7fd10c1aeb18160a6eac5312d438c4be5', :created_at => 'Wed Oct 22 13:55:23 +0200 2008', :updated_at => 'Wed Nov 05 12:10:06 +0100 2008', :admin => '', :active => 'false', :category => 'Editor', :blogname => 'MKS' )
end
def self.down
ActiveRecord::Base.connection.execute('TRUNCATE menus')
ActiveRecord::Base.connection.execute('TRUNCATE newsarchives')
ActiveRecord::Base.connection.execute('TRUNCATE pages')
ActiveRecord::Base.connection.execute('TRUNCATE posts')
ActiveRecord::Base.connection.execute('TRUNCATE products')
ActiveRecord::Base.connection.execute('TRUNCATE recipes')
ActiveRecord::Base.connection.execute('TRUNCATE relations')
ActiveRecord::Base.connection.execute('TRUNCATE users')
end
end
