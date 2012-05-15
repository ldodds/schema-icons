SCHEMA.ORG ICON MAPPING
-----------------------

The Noun Project provides a number of openly licensed icons that can be reused in applications and content.

Schema.org is an attempt to provide a broadly useful vocabularly for describing things of interest.

This project is an attempt to provide a mapping between the [Schema.org][0]type hierarchy onto the icons provided by [The Noun Project][1]. 
The goal being to provide a default set of icons for representing things described using the Schema.org vocabulary.

This could provide a useful, and consistent starting point for anyone creating tools or visualisations using that data.

THE MAPPINGS
------------

The mappings are contained in a CSV containing 4 columns:

* Schema.org Type Name
* Schema.org Type Page
* Noun Project Icon Name
* Noun Project Icon Number
* Noun Project Icon URL
* Noun Project Icon Download Link

You could use that CSV file to spider the icons you need from the Noun Project site and create a local set of assets. Or just browse 
the site to download the individual icons you need. 

The project includes a simple Ruby script to build a local cache of icons.

MAPPING NOTES
-------------

The mapping defined here are going to be highly subjective: they're based on which icons I think are good representations of 
individual Schema.org types. However I've tried to be reasonably methodical about how I've gone about looking for and choosing 
mappings to at least give some indication about how the icons were selected. 

You are of course free to define your own mapping, or submit suggestions for tweaks or improvements that I can include here.

The basic process I went through was as follows:

First I searched the Noun Project site for the schema.org type name. If I got a direct hit then I chose that icon. If I didn't 
get an exact match I either tried various synonyms or used the type name as a tag and browsed the icon collection that way.

Where there were several icons for a given term, e.g. Book, I've erred towards selecting one that is simpler, clearer (at least 
to me) whilst also trying to avoid icons that might express some other bias (e.g. regional, religious, or age!). 

I've also erred towards icons that seem to have some existing usage, e.g. in mapping applications. I have also tried to avoid 
appropriating icons in confusing ways.

In the case where I couldn't find matches even with synonyms, in a few cases I've selected some reasonably representative or 
at least defensible choices. For example the "elephant" icon is associated with "zoo". 

I'm aware that this has still lead to choices that are likely to be controversial, like the "man" icon for "person", but I thought 
it better to choose something rather than have no mapping at all.

In a few cases I've re-used icons, but I've tried to select alternates where possible. E.g. there are several icons for 
"theater" and I've used those to map to slightly different location types.

The Schema.org type scheme is hierarchical so I've also tried to pick icons for high level types that are representative of that 
broadly defined class of items. The top level "Thing" type is associated with a question mark variant of the "information" icon. 
I felt that expressed the notion of some generic unknown "thing".

There are also a number of types which I've not yet successfully matched. There are possibilities for all of them, but I felt in a 
few cases that I might be stretching interpration too far. So, for example, none of the "Intangible" category is currently mapped.

My suggestion is that if you're displaying icons then you should use the icon explicitly associated with the type(s) and fallback 
to the parent type icon if no specific icon is available.

Please submit improvements if you think there are better options!

ATTRIBUTION
-----------

This mapping is in the public domain, but the Noun Project icons themselves have their own licensing. There are a mixture of 
public domain and creative commons licenses.

So, while it would be simple to spider the Noun Project site in order to collect the icons, PLEASE be aware that you may need to 
provide attribution. Read the [Noun Project attribution guidelines][2] to understand how to provide appropriate attribution and, 
most importantly, check the licensing of the individual icons.

I'll look at adding licensing notes to the mappings to make doing the Right Thing simpler.

CACHING
-------

The project includes a Ruby script to create a local cache of the icons listed in the mapping. The script shouldn't 
require anything more than a vanilla Ruby install.

Run the script from the directory containing the mapping file and it will create an "icons" sub-directory and download 
and unzip all of the SVG files into that location:

	ruby cache_icons.rb

The script also writes a simple index.html document that you can view in a browser.

Note: There's a 5 second sleep between each download to avoid hitting the Noun Project server too hard.

LICENSE
-------

This work is hereby released into the Public Domain.

To view a copy of the public domain dedication, visit http://creativecommons.org/licenses/publicdomain or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

[0]: http://schema.org
[1]: http://thenounproject.com
[2]: http://blog.thenounproject.com/post/12554806140/the-noun-projects-attribution-requirements
