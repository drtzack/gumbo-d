EXAMPLES = find_links find_links_capi get_title

all:
	dmd -I../source ../libgumbo-d.a `pkg-config --variable=libdir  gumbo`/libgumbo.a find_links.d
	dmd -I../source ../libgumbo-d.a `pkg-config --variable=libdir  gumbo`/libgumbo.a find_links_capi.d
	dmd -I../source ../libgumbo-d.a `pkg-config --variable=libdir  gumbo`/libgumbo.a get_title.d

clean:
	rm -f *.o $(EXAMPLES)
