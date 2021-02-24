---
title: "NTUA/SLP group - Publications"
layout: gridlay
excerpt: "SLP group -- Publications."
sitemap: false
permalink: /publications/
---

## Full List

{% for year in site.data.publist_by_year %}

  <h2> {{ year[0] }} </h2>

  <ul>
  {% for pub in year[1] %}

    <li> {{ pub }} </li>

  {% endfor %}
  </ul>
{% endfor %}
