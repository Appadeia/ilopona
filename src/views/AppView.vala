/*
* Created 2019  Carson Black <uhhadd@gmail.com>
* 
* This is free and unencumbered software released into the public domain.
* 
* Anyone is free to copy, modify, publish, use, compile, sell, or
* distribute this software, either in source code form or as a compiled
* binary, for any purpose, commercial or non-commercial, and by any
* means.
* 
* In jurisdictions that recognize copyright laws, the author or authors
* of this software dedicate any and all copyright interest in the
* software to the public domain. We make this dedication for the benefit
* of the public at large and to the detriment of our heirs and
* successors. We intend this dedication to be an overt act of
* relinquishment in perpetuity of all present and future rights to this
* software under copyright law.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
* 
* For more information, please refer to <http://unlicense.org>
*/

using IloPona.Configs;
using IloPona.Widgets;

using Hdy;
using Gdk;

namespace IloPona.Views {


    public class Entry {
        public string word;
        public string n;
        public string mod;
        public string sep;
        public string vt;
        public string vi;
        public string interj;
        public string prep;
        public string conj;
        public string kama;
        public string cont;
        public string oth;

        public Entry(string  word, 
                     string? n = null,
                     string? mod = null,
                     string? sep = null,
                     string? vt = null,
                     string? vi = null,
                     string? interj = null,
                     string? prep = null,
                     string? conj = null,
                     string? kama = null,
                     string? cont = null,
                     string? oth = null) {
            this.word = word;
            this.n = n;
            this.mod = mod;
            this.sep = sep;
            this.vt = vt;
            this.vi = vi;
            this.interj = interj;
            this.prep = prep;
            this.conj = conj;
            this.kama = kama;
            this.cont = cont;
            this.oth = oth;
        }
    }
    /**
     * The {@code AppView} class.
     *
     * @since 1.0.0
     */
    public class AppView : Gtk.Box {

        public Gtk.Stack stack;
        public Entry[] dictionary;
        public Hdy.Leaflet leaflet;
        public Gtk.StackSidebar sidebar;
        public Gtk.Box sidebarcontainer;
        public Gtk.Window window;
        public Hdy.SearchBar searchbar;

        public void filter(string query) {
            this.leaflet.set_visible_child(this.sidebarcontainer);
            for(int i = 0; i < this.stack.get_children().length(); i++) {
                print(this.dictionary[i].word);
                print("\t" + query + "\n");
                if(this.dictionary[i].word.contains(query)) {
                    print("\t contains the query\n");
                    this.stack.get_children().nth_data(i).show();
                } else {
                    print("\t does not contain the query\n");
                    this.stack.get_children().nth_data(i).hide();
                }
            }
        }
        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView () {
            this.leaflet = new Hdy.Leaflet();
            this.leaflet.vexpand = true;
            this.leaflet.hexpand = true;

            this.dictionary = {
                //        word n mod sep vt vi interj prep conj kama cont oth
                new Entry("o", null, null, null, null, null, "Ah! Ha! Oh! Ooh! Aw! (emotion word)"),
                new Entry("akesi", "Non-cute animal, reptile, amphibian, dinosaur, monster"),
                new Entry("ala", "Nothingness, negation, zero", "No, not, none, un-", null, null, null, "No!"),
                new Entry("ali (ale)", "Everything, anything, life, the universe", "All, every, complete, whole"),
                new Entry("anpa", "Bottom, down, under, below, floor, beneath", "Low, lower, bottom", null, "Lower, down, defeat, overcome"),
                new Entry("ante", "Difference", "Different", "Otherwise, or else", null, "Change, alter, modify"),
                new Entry("anu", null, null, null, null, null, null, null, "or"),
                new Entry("awen", null, "Remaining, stationary, permanent, sedentary", null, "Keep", "Stay, wait, remain"),
                new Entry("e", null, null, "(Introduces a direct object)"),
                new Entry("en", null, null, null, null, null, null, null, "And (used to coordinate head nouns)"),
                new Entry("ijo", "Thing, something, stuff, anything, object", "Of something", null, "Objectify"),
                new Entry("ike", "Negativity, evil, badness", "Bad, evil, wrong, overly complex, (figuratively) unhealthy", null, "To make bad, to worsen, to have a negative effect upon", "To be bad, to suck", "Oh dear! Woe! Alas!"),
                new Entry("ilo", "Tool, device, machine, thing used for a specific purpose"),
                new Entry("insa", "Inside, inner world, centre, stomach", "Internal, central"),
                new Entry("jaki", "Dirt, pollution, filth", "Dirty, gross, filthy", null, "Pollute, dirty", null, "Ew! Yuck!"),
                new Entry("jan", "Person, people, human, being, somebody, anybody", "Personal, human, somebody's, of people", null, "Personify, humanise, personalise"),
                new Entry("jelo", null, "Yellow, light green"),
                new Entry("jo", "Having", null, null, "Have, contain", null, null, null, null, "Receive, get, take, obtain"),
                new Entry("kala", "Fish, sea creature")
            };

            this.sidebarcontainer = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            this.sidebarcontainer.vexpand = true;
            this.sidebarcontainer.width_request = 200;
            this.searchbar = new Hdy.SearchBar();
            var searchentry = new Gtk.SearchEntry();
            searchbar.add(searchentry);
            searchbar.connect_entry(searchentry);
            searchentry.search_changed.connect(() => {
                this.filter(searchentry.text);
            });

            this.sidebar = new Gtk.StackSidebar();
            this.sidebar.width_request = 200;
            this.sidebar.vexpand = true;
            this.stack = new Gtk.Stack();
            this.stack.width_request = 200;
            this.stack.transition_type = Gtk.StackTransitionType.SLIDE_UP_DOWN;
            this.stack.hexpand = true;

            this.stack.notify.connect((s, p) => {
                if (p.name == "visible-child") {
                    leaflet.set_visible_child(this.stack);
                }
            });
            this.leaflet.notify.connect((s, p) => {
                if (this.leaflet.folded) {
                    this.leaflet.get_style_context().add_class("folded");
                    this.stack.transition_type = Gtk.StackTransitionType.NONE;
                } else {
                    leaflet.get_style_context().remove_class("folded");
                    this.stack.transition_type = Gtk.StackTransitionType.SLIDE_UP_DOWN;
                }
            });

            this.leaflet.set_visible_child(this.stack);
            this.leaflet.child_transition_type = Hdy.LeafletChildTransitionType.OVER;
            this.leaflet.mode_transition_type = Hdy.LeafletModeTransitionType.SLIDE;
            
            this.sidebar.stack = this.stack;

            for (int i = 0; i < this.dictionary.length; i++) {
                var entry = this.dictionary[i];

                var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
                box.margin_left = 20;
                box.margin_top = 20;
                box.margin_right = 20;
                box.margin_bottom = 20;

                var wordbox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
                var defbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
                defbox.width_request = 100;

                var word = new Gtk.Label(entry.word);
                word.get_style_context().add_class("h1");
                word.xalign = 0;

                wordbox.add(word);

                box.add(wordbox);
                box.add(defbox);

                if (entry.n != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>n</i>\t" + entry.n);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.mod != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>mod</i>\t" + entry.mod);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.sep != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>sep</i>\t" + entry.sep);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.vt != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>vt</i>\t" + entry.vt);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.vi != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>vi</i>\t" + entry.vi);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.interj != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>interj</i>\t" + entry.interj);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.prep != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>prep</i>\t" + entry.prep);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.conj != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>conj</i>\t" + entry.conj);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.kama != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>kama</i>\t" + entry.kama);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.cont != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>cont</i>\t" + entry.cont);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }
                if (entry.oth != null) {
                    var item = new Gtk.Label(null);
                    item.set_markup("<i>oth</i>\t" + entry.oth);
                    item.xalign = 0;
                    item.get_style_context().add_class("h2");
                    item.wrap = true;
                    item.max_width_chars = 40;
                    defbox.add(item);
                }

                this.stack.add_titled(box, dictionary[i].word, dictionary[i].word);
            }

            this.sidebarcontainer.add(this.searchbar);
            this.sidebarcontainer.add(this.sidebar);
            this.leaflet.add(this.sidebarcontainer);
            this.leaflet.add(this.stack);
            
            this.add(this.leaflet);
        }
    }
}
