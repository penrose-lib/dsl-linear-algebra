# Penrose Domain Specific Language (DSL): Linear Algebra

![assets/img/penrose-logo.png](assets/img/penrose-logo.png)

This is a domain specific language (DSL) repository that is part of [the penrose library](https://www.github.com/penrose-lib/) and is intended for install in [penrose](https://penrose.github.io). 
It includes the domain specific language (DSL) file(s)
for the Linear Algebra domain. The visual portion of the site is meant to be human 
friendly, while the API served at `/api.json` is a programmatically accessible endpoint
to retrieve the style.

## Setup

 1. Install [Jekyll](https://jekyllrb.com/docs/installation/) locally. For Ruby, I recommend [rbenv](https://github.com/rbenv/rbenv).
 2. Install Jekyll dependencies with `bundle install`
 3. To serve the development server run `bundle exec jekyll serve`

## Folders Included
If you aren't familiar with the structure of a Jekyll site, here is a quick overview:

### Design Files
The design file trios refer to substance, domain specific language (dsl) and style files 
that can be used to generate diagrams.

 - [_dsl](_src): includes files that are used in "production" examples. Previous versions coincide with commits. These files get rendered into the static API, and each design has its own page for images, documentation and example usage.
 - [_dev](_dev): Any "work in progress" files.
 - [_examples](_examples) is a collection of subfolders (a grouping of designs) from other penrose-lib repositories to exemplify the usage of this dsl.

### Documentation and Site

 - [_config.yml](_config.yml) is the primary configuration file for the site. Variables in this file render as `{{ site.var }}` in the various html includes and templates.
 - [_layouts](_layouts) are base html templates for pages
 - [_includes](_includes) are snippets of html added to layouts
 - [pages](pages) are generic pages that aren't considered docs
 - [assets](assets) includes all static assets

## How Do I...

### Develop new style, substance, or domain specific language files?

You can use the folder [_dev](_dev) to keep these works in progress. They
won't be rendered into the API. 

### Add a new style or domain specific language?

#### 1. Add source files

The production dsls are under [_dsl](_dsl).


#### 2. Add a domain page
Each file that ends with dsl should
have a corresponding markdown file to describe it. Here is an example of
the frontend matter for the linear-algebra.dsl:

```markdown
---
title: Linear Algebra
category: dsl
order: 1

dsl: linear-algebra.dsl
branch: master
---

## Usage

...
```

The notes that you add to this file are important for users to understand
usage, although not required for the API. It's a content area that renders
markdown, so you should feel free to write as much as you think is useful.

#### 3. Update the changelog

The files in [_posts](_posts) render into the repository changelog. Please add a new
entry with meaningful information when you add, remove, or otherwise change content.
This isn't a perfect way to track changes, but it's a best effort


**Special Attributes**

We have some special attributes, in case they are needed. You can optionally
add the following to the page frontend matter:

 - **hidden**: If you have a design trio that was considered production and you need to hide it from the API for some reason (you can imagine an emergency fix is needed and you want to take it offline, but perhaps not completely remove it from the documentation pages) you can add "hidden: true" to the frontend matter. It will render (for a human) on the site, but not be available via the API.


### API Interaction

The above details how to add content, and by simply adding files to [_dsl](_dsl).
They will automatically be added to the API. But where is it? You can find the API
at the /api.json endpoint served by the repository, and linked from the main
page. If I'm running a local server, here is how to access it via python:

```python
import requests
url = "http://localhost:4000/dsl-linear-algebra/api.json"
response = requests.get(url)
```

Did we get a 200 (successful) response?

```python
response
<Response [200]>

response.status_code
200
```

Let's look at our data.

```python
results = response.json()
```

There are keys for a unique id (the Github repository url), a set of links,
and then the data (each trio that has been added).

```python
results.keys()
# dict_keys(['id', 'links', 'data'])
```

Here is the complete data:

```python
{
    "id": "penrose-lib/dsl-linear-algebra",
    "links": {
        "self": "http://localhost:4000/dsl-linear-algebra/api.json",
        "url": "https://www.github.com/penrose-lib/dsl-linear-algebra"
    },
    "data": [
        {
            "name": "dsl/linear-algebra",
            "id": "penrose-lib/dsl-linear-algebra:dsl/linear-algebra",
            "dsl": "http://localhost:4000/dsl-linear-algebra/dsl/linear-algebra.dsl",
            "dsl_raw": "https://raw.githubusercontent.com/penrose-lib/dsl-linear-algebra/master/dsl/linear-algebra.dsl",
            "dsl_url": "https://raw.githubusercontent.com/penrose-lib/dsl-linear-algebra/<VERSION>/dsl/linear-algebra.dsl",
            "group": "dsl"
        }
    ]
}
```


Let's walk through each component.

#### The Unique Resource Identifier

```python
results['id']
'penrose-lib/dsl-linear-algebra'
```

This is the unique resource identifier for the dsl file. It is in reference 
to the Github organization (penrose-lib) and the repository name
(dsl-linear-algebra). We can have confidence that the metadata to learn more about
the dsl file will always be served at the Github Pages for that site,
at https://penrose-lib.github.io/dsl-linear-algebra/api.json.

#### Links

Per the [json API](https://jsonapi.org/) specification, we add a set of links so 
if a user saves the endpoint data as json or other, he or she can return to find the original
source. 

```python
results['links']
{'self': 'http://localhost:4000/domain-linear-algebra/library.json',
 'url': 'https://www.github.com/penrose/domain-linear-algebra'}
```

The reason that we see localhost in this example is because we are running
the Jekyll server locally.

#### Data

Finally, the data itself! This is where the user finds the link to the DSL file (the "dsl" attribute),
 along with a dsl_url that can have `<VERSION>` substituted for a particular commit.
When tools are using this repository and looking for a particular version or branch, that string
should be replaced with the version or branch to reference the file.

```python
results['data'][0]
{'dsl': 'http://localhost:4000/dsl-linear-algebra/dsl/linear-algebra.dsl',
 'dsl_raw': 'https://raw.githubusercontent.com/penrose-lib/dsl-linear-algebra/master/dsl/linear-algebra.dsl',
 'dsl_url': 'https://raw.githubusercontent.com/penrose-lib/dsl-linear-algebra/<VERSION>/dsl/linear-algebra.dsl',
 'group': 'dsl',
 'id': 'penrose-lib/dsl-linear-algebra:dsl/linear-algebra',
 'name': 'dsl/linear-algebra'}
```

**dsl**

This is the production URL for the dsl file, served from Github pages.

**dsl_raw** 

This is the link to the raw file served by raw.githubusercontent.com. You'll
notice a branch (master) rendered into the url, and this is specified in the markdown
metadata by the creator to indicate the raw file is served from the master branch.
Serving production from master branch is a standard that should be upheld.

**dsl_url** 

This is the same URL, but "master" has been replaced with a string "<VERSION>"
that a client is intended to replace with a branch, tag, or commit to get a direct
link to a specific version of the file.

**id**

Here is where we get the full URI for the dsl file:

```
penrose-lib/dsl-linear-algebra:dsl/linear-algebra'
```

The beginning portion refers to the repository URI (`penrose-lib/dsl-linear-algebra`)
and the second portion refers to the component type (`dsl`) and also the url where it's served
from. This is the formula for a Penrose Library URI:

```
<organization>/<repository>:<element>/<name>@<version>
```

The `<element>/<name>` together make up the namespace.

### Generate My Own Domain?

We will be generating a cookie cutter template to help you do this! See 
[penrose/cookiecutter-dsl](https://github.com/penrose/cookiecutter-dsl) to
get started.
