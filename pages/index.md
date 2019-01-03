---
title: Welcome
permalink: /
---

Welcome! This is a domain specific language (dsl) page for the software 
<a href="https://penrose.github.io" target="_blank">Penrose</a>. This 

> Where can I find a programmatic endpoint for the source file?

This repository serves a static API (application programming interface) for 
you to find the domain specific language file for the {{ site.description }} 
Domain. You can find it here:

<a target="_blank" href="{{ site.baseurl }}/api.json"><button class="btn btn-primary">JSON</button></a>
<a target="_blank" href="{{ site.url }}{{ site.baseurl }}/dsl/linear-algebra.dsl"><button class="btn btn-primary">Download</button></a>

> Where do I go from here?

This is the Penrose {{ site.description }} domain. This repository
primarily serves associated dsl files, and will also provide several examples to help
get you started. You can explore other source files (styles, dsl, and substance)
in the <a href="https://www.github.com/penrose-lib" target="_blank">Penrose Library</a>.

<ul>{% assign grouped = site.examples | group_by: 'category' %}{% for group in grouped %}<li class="nav-item top-level {% if group.name == page.category %}current{% endif %}">{% assign items = group.items | sort: 'order' %}<a href="{{ site.baseurl }}{{ items.first.url }}">{{ group.name }}</a>
							<ul>{% for item in items %}
							    <li class="nav-item {% if item.url == page.url %}current{% endif %}"><a href="{{ site.baseurl }}{{ item.url }}">{{ item.title }}</a></li>{% endfor %}
</ul>
</li>{% endfor %}
</ul>

<hr>

#### Support

We are here to help! If you have a question, or want to make a contribution, 
please open <a href="{{ site.github.repository_url }}/issues" target="_blank">an issue</a>.
