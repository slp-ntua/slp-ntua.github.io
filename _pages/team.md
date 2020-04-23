---
title: "NTUA/SLP group - Team"
layout: gridlay
excerpt: "SLP group: Team members"
sitemap: false
permalink: /team/
---

# Group Members

 **We are  looking for new PhD students and Postdocs to join the team. We also offer Diploma Thesis projects.** [(see openings)]({{ site.url }}{{ site.baseurl }}/vacancies) **!**

## Staff
{% assign number_printed = 0 %}
{% for member in site.data.team_members %}

{% assign even_odd = number_printed | modulo: 2 %}

{% if even_odd == 0 %}
<div class="row">
{% endif %}

<div class="col-sm-6 clearfix">
  <img src="{{ site.url }}{{ site.baseurl }}/images/teampic/{{ member.photo }}" class="img-responsive" width="25%" style="float: left" />
  <h4>{{ member.name }}</h4>
  <i>{{ member.info }}<br>email: <{{ member.email }}></i>
  <ul style="overflow: hidden">
  
  {% if member.number_educ == 1 %}
  <li> {{ member.education1 }} </li>
  {% endif %}
  
  {% if member.number_educ == 2 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  {% endif %}
  
  {% if member.number_educ == 3 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  <li> {{ member.education3 }} </li>
  {% endif %}
  
  {% if member.number_educ == 4 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  <li> {{ member.education3 }} </li>
  <li> {{ member.education4 }} </li>
  {% endif %}
 
  {% if member.number_educ == 5 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  <li> {{ member.education3 }} </li>
  <li> {{ member.education4 }} </li>
  <li> {{ member.education5 }} </li>
  {% endif %}
  
  </ul>
</div>

{% assign number_printed = number_printed | plus: 1 %}

{% if even_odd == 1 %}
</div>
{% endif %}

{% endfor %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}


## Students
<table align="center" style="width:100%">
<tr><th>Current</th>
    <th>Alumni</th> 
  </tr>
  <tr>
    <td>Konstantinos Klapsas</td>
    <td>Filippos Kokkinos</td>
  </tr>
  <tr>
    <td>Lena Fotaki</td>
    <td>Giannis Karamanolakis</td>
  </tr>
  <tr>
    <td>Danai Ksezonaki</td>
    <td>Aggelina Chatziagapi</td>
  </tr>
  <tr>
    <td>Konstantinos Karouzos</td>
    <td>Pinelopi Papalampidi </td>
  </tr>
  <tr>
    <td>Giannis Daras</td>
    <td>Efthymios Tzinis</td>
  </tr>
  <tr>
    <td>Georgios Chochlakis</td>
    <td>Eleftheria Briakou</td>
  </tr>
  <tr>
    <td>Nikolas Loukas</td>
    <td>Nikolaos Athanasiou</td>
  </tr>
  <tr>
    <td>Nikitas Theodoropoulos</td>
    <td>Malvina Nikandrou</td>
  </tr>
  <tr>
    <td>Eliza Milioni</td>
    <td>Alexandra Chronopoulou</td>
  </tr>
  <tr>
    <td>Dimitrios Sotiriou</td>
    <td>Katerina Margatina</td>
  </tr>
  <tr>
    <td>Christina Kypraiou</td>
    <td>Georgios Pantazopoulos</td>
  </tr>
  <tr>
    <td></td>
    <td>Nikolaos Pantelaios</td>
  </tr>

</table>

