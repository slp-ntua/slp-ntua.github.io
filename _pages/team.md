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
    <td>Efthymios Tzinis</td>
    <td>Filippos Kokkinos, 2017</td>
  </tr>
  <tr>
    <td>Pinelopi Papalampidi</td>
    <td>Giannis Karamanolakis, 2017</td>
  </tr>
  <tr>
    <td>Nikolaos Athanasiou</td>
    <td>Aggelina Hatziagapi, 2017</td>
  </tr>
  <tr>
    <td>Eleftheria Briakou</td>
    <td></td>
  </tr>
  <tr>
    <td>Georgios Pantazopoulos</td>
    <td></td>
  </tr>
  <tr>
    <td>Nikolaos Pantelaios</td>
    <td></td>
  </tr>
  <tr>
    <td>Malvina Nikandrou</td>
    <td></td>
  </tr>
  <tr>
    <td>Alexandra Chronopoulou</td>
    <td></td>
  </tr>
  <tr>
    <td>Katerina Margatina</td>
    <td></td>
  </tr>
  <tr>
    <td>Konstantinos Klapsas</td>
    <td></td>
  </tr>
  <tr>
    <td>Christina Kypraiou</td>
    <td></td>
  </tr>
  <tr>
    <td>Theodoros Tavoulareas</td>
    <td></td>
  </tr>

</table>

