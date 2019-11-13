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
                new Entry("a",null,null,null,null,null,"Ah! ha! oh! ooh! aw! (emotion word)",null,null,null,null,null),
                new Entry("akesi","Non-cute animal, reptile, amphibian, dinosaur, monster",null,null,null,null,null,null,null,null,null,null),
                new Entry("ala","Nothingness, negation, zero","No, not, none, un-",null,null,null,"No!",null,null,null,null,null),
                new Entry("ali","Everything, anything, life, the universe","All, every, complete, whole",null,null,null,null,null,null,null,null,null),
                new Entry("anpa","Bottom, down, under, below, floor, beneath","Low, lower, bottom",null,"Lower, down, defeat, overcome",null,null,null,null,null,null,null),
                new Entry("ante","Difference","Different",null,"Change, alter, modify",null,null,null,null,null,"Otherwise, or else",null),
                new Entry("anu",null,null,null,null,null,null,null,"Or",null,null,null),
                new Entry("awen",null,"Remaining, stationary, permanent, sedentary",null,"Keep","Stay, wait, remain",null,null,null,null,null,null),
                new Entry("e",null,null,"(introduces a direct object)",null,null,null,null,null,null,null,null),
                new Entry("en",null,null,null,null,null,null,null,"And (used to coordinate head nouns)",null,null,null),
                new Entry("ijo","Thing, something, stuff, anything, object","Of something",null,"Objectify",null,null,null,null,null,null,null),
                new Entry("ike","Negativity, evil, badness","Bad, evil, wrong, evil, overly complex, (figuratively) unhealthy",null,"To make bad, to worsen, to have a negative effect upon","To be bad, to suck","Oh dear! woe! alas!",null,null,null,null,null),
                new Entry("ilo","Tool, device, machine, thing used for a specific purpose",null,null,null,null,null,null,null,null,null,null),
                new Entry("insa","Inside, inner world, centre, stomach","Internal, central",null,null,null,null,null,null,null,null,null),
                new Entry("jaki","Dirt, pollution, filth","Dirty, gross, filthy",null,"Pollute, dirty",null,"Ew! yuck!",null,null,null,null,null),
                new Entry("jan","Person, people, human, being, somebody, anybody","Personal, human, somebody's, of people",null,"Personify, humanize, personalize",null,null,null,null,null,null,null),
                new Entry("jelo",null,"Yellow, light green",null,null,null,null,null,null,null,null,null),
                new Entry("jo","Having",null,null,"Have, contain",null,null,null,null,"Receive, get, take, obtain",null,null),
                new Entry("kala","Fish, sea creature",null,null,null,null,null,null,null,null,null,null),
                new Entry("kalama","Sound, noise, voice",null,null,"Sound, ring, play (an instrument)","Make noise",null,null,null,null,null,null),
                new Entry("kama","Event, happening, chance, arrival, beginning","Coming, future",null,"Bring about, summon","Come, become, arrive, happen, pursue actions to arrive to (a certain state), manage to, start to",null,null,null,null,null,null),
                new Entry("kasi","Plant, leaf, herb, tree, wood",null,null,null,null,null,null,null,null,null,null),
                new Entry("ken","Possibility, ability, power to do things, permission",null,null,"Make possible, enable, allow, permit","Can, is able to, is allowed to, may, is possible",null,null,null,null,"It is possible that",null),
                new Entry("kepeken",null,null,null,"Use",null,null,"With",null,null,null,null),
                new Entry("kili","Fruit, pulpy vegetable, mushroom",null,null,null,null,null,null,null,null,null,null),
                new Entry("kin",null,"Also, too, even, indeed (emphasizes the word that follows)",null,null,null,null,null,null,null,null,null),
                new Entry("kiwen","Hard thing, rock, stone, metal, mineral, clay","Hard, solid, stone-like, made of stone or metal",null,null,null,null,null,null,null,null,null),
                new Entry("ko",null,"Air-like, ethereal, gaseous",null,null,null,null,null,null,null,null,null),
                new Entry("kon","Air, wind, odour, soul","Air-like, ethereal, gaseous",null,null,null,null,null,null,null,null,null),
                new Entry("kule","Color, paint","Colourful",null,"Color, paint",null,null,null,null,null,null,null),
                new Entry("kulupu","Group, community, society, company","Communal, shared, public, of the society",null,null,null,null,null,null,null,null,null),
                new Entry("kute",null,"Auditory, hearing",null,"Listen, hear",null,null,null,null,null,null,null),
                new Entry("la",null,null,"(between adverb or phrase of context and sentence)",null,null,null,null,null,null,null,null),
                new Entry("lape",null,"Sleeping, of sleep",null,null,null,null,null,null,null,null,null),
                new Entry("laso",null,"Blue, blue-green",null,null,null,null,null,null,null,null,null),
                new Entry("lawa","Head, mind","Main, leading, in charge",null,"Lead, control, rule, steer",null,null,null,null,null,null,null),
                new Entry("len","Clothing, cloth, fabric",null,null,null,null,null,null,null,null,null,null),
                new Entry("lete","Cold","Cold, uncooked",null,"Cool down, chill, freeze",null,null,null,null,null,null,null),
                new Entry("li",null,null,"(between any subject except mi and sina and its verb; also used to introduce a new verb for the same subject)",null,null,null,null,null,null,null,null),
                new Entry("lili",null,"Small, little, young, a bit, short, fes, less",null,"Reduce, shorten, shrink, lessen",null,null,null,null,null,null,null),
                new Entry("linja","Long, very thin, floppy thing, e.g. string, rope, hair, thread, cord, chain",null,null,null,null,null,null,null,null,null,null),
                new Entry("lipu","Flat and bendable thing, e.g. paper, card, ticket",null,null,null,null,null,null,null,null,null,null),
                new Entry("loje",null,"Red",null,null,null,null,null,null,null,null,null),
                new Entry("lon",null,null,null,null,"Be there, be present, be real/true, exist, be awake",null,"Be located in/at/on",null,null,null,null),
                new Entry("luka","Hand, arm","Five",null,null,null,null,null,null,null,null,null),
                new Entry("lukin",null,"Visual",null,"See, look at, watch, read","Look, watch out, pay attention",null,null,null,null,null,null),
                new Entry("lupa","Hole, orifice, window, door",null,null,null,null,null,null,null,null,null,null),
                new Entry("ma","Land, earth, country, (outdoor) area",null,null,null,null,null,null,null,null,null,null),
                new Entry("mama","Parent, mother, father","Of the parent, parental, maternal, fatherly",null,null,null,null,null,null,null,null,null),
                new Entry("mani","Money, material wealth, currency, dollar, capital",null,null,null,null,null,null,null,null,null,null),
                new Entry("meli","Woman, female, girl, wife, girlfriend","Female, feminine, womanly",null,null,null,null,null,null,null,null,null),
                new Entry("mi","I, we","My, our",null,null,null,null,null,null,null,null,null),
                new Entry("mije","Man, male, husband, boyfriend","Male, masculine, manly",null,null,null,null,null,null,null,null,null),
                new Entry("moku","Food, meal",null,null,"Eat, drink, swallow, ingest, consume",null,null,null,null,null,null,null),
                new Entry("moli","Death","Dead, deadly, fatal",null,"Kill","Die, be dead",null,null,null,null,null,null),
                new Entry("monsi","Back, rear end, butt, behind","Back, rear",null,null,null,null,null,null,null,null,null),
                new Entry("mu",null,null,null,null,null,"Woof! meow! moo! etc. (cute animal noise)",null,null,null,null,null),
                new Entry("mun","Moon","Lunar",null,null,null,null,null,null,null,null,null),
                new Entry("musi","Fun, playing, game, recreation, art, entertainment","Artful, fun, recreational",null,"Amuse, entertain","Play, have fun",null,null,null,null,null,null),
                new Entry("mute","Amount, quantity","Many, several, very, much, a lot, abundant, numerous, more",null,"Make many or much",null,null,null,null,null,null,null),
                new Entry("nanpa","Number",null,null,null,null,null,null,null,null,null,"-th (ordinal numbers)"),
                new Entry("nasa",null,"Silly, crazy, foolish, drunk, strange, stupid, weird",null,"Drive crazy, make weird",null,null,null,null,null,null,null),
                new Entry("nasin","Way, manner, custom, road, path, doctrine, system, method",null,null,null,null,null,null,null,null,null,null),
                new Entry("nena","Bump, hill, mountain, button, nose",null,null,null,null,null,null,null,null,null,null),
                new Entry("ni",null,"This, that",null,null,null,null,null,null,null,null,null),
                new Entry("nimi","Word, name",null,null,null,null,null,null,null,null,null,null),
                new Entry("noka","Leg, foot",null,null,null,null,null,null,null,null,null,null),
                new Entry("o",null,null,"O (vocative or imperative)",null,null,"Hey! (calling somebody's attention)",null,null,null,null,null),
                new Entry("oko","Eye",null,null,null,null,null,null,null,null,null,null),
                new Entry("olin","Love","Love",null,"To love (a person)",null,null,null,null,null,null,null),
                new Entry("ona","He, she, it, they","His, her, its, their",null,null,null,null,null,null,null,null,null),
                new Entry("open",null,null,null,"Open, turn on",null,null,null,null,null,null,null),
                new Entry("pakala","Blunder, accident, mistake, destruction, damage, breaking",null,null,"Screw up, fuck up, botch, ruin, break, hurt, injure, damage, bungle, spoil, ruin","Screw up, fall apart, break","Damn! fuck!",null,null,null,null,null),
                new Entry("pali","Activity, work, deed, projec","Active, work-related, operating, working",null,"Do, make, build, create","Act, work, function",null,null,null,null,null,null),
                new Entry("palisa","Long, mostly hard object, e.g. rod, stick, branch",null,null,null,null,null,null,null,null,null,null),
                new Entry("pana","Giving, transfer, exchange",null,null,"Give, put, send, place, release, emit, cause",null,null,null,null,null,null,null),
                new Entry("pi",null,null,"Of, belonging to",null,null,null,null,null,null,null,null),
                new Entry("pilin","Feelings, emotion, heart",null,null,"Feel, think, sense, touch","Feel",null,null,null,null,null,null),
                new Entry("pimeja","Darkness, shadows","Black, dark",null,"Darken",null,null,null,null,null,null,null),
                new Entry("pini","End, tip","Completed, finished, past, done, ago",null,"Finish, close, end, turn off",null,null,null,null,null,null,null),
                new Entry("pipi","Bug, insect, spider",null,null,null,null,null,null,null,null,null,null),
                new Entry("poka","Side, hip, next to","Neighboring",null,null,null,null,"In the accompaniment of, with",null,null,null,null),
                new Entry("poki","Container, box, bowl, cup, glass",null,null,null,null,null,null,null,null,null,null),
                new Entry("pona","Good, simplicity, positivity","Good, simple, positive, nice, correct, right",null,"Improve, fix, repair, make good",null,"Great! good! thanks! ok! cool! yay!",null,null,null,null,null),
                new Entry("sama",null,"Same, similar, equal, of equal status or position",null,null,null,null,"Like, as, seem",null,null,"Similarly, in the same way that",null),
                new Entry("seli","Fire, warmth, heat","Hot, warm, cooked",null,"Heat, warm up, cook",null,null,null,null,null,null,null),
                new Entry("selo","Outside, surface, skin, shell, bark, shape, peel",null,null,null,null,null,null,null,null,null,null),
                new Entry("seme",null,null,null,null,null,null,null,null,null,null,"What, which, wh- (question word)"),
                new Entry("sewi","High, up, above, top, over, on","Superior, elevated, religious, formal",null,null,null,null,null,null,null,null,null),
                new Entry("sijelo","Body, physical state",null,null,null,null,null,null,null,null,null,null),
                new Entry("sike","Circle, wheel, sphere, ball, cycle","Round, cyclical",null,null,null,null,null,null,null,null,null),
                new Entry("sin",null,"New, fresh, another, more",null,"Renew, renovate, freshen",null,null,null,null,null,null,null),
                new Entry("sina","You","Your",null,null,null,null,null,null,null,null,null),
                new Entry("sinpin","Front, chest, torso, wall",null,null,null,null,null,null,null,null,null,null),
                new Entry("sitelen","Picture, image",null,null,"Draw, write",null,null,null,null,null,null,null),
                new Entry("sona","Knowledge, wisdom, intelligence, understanding",null,null,"Know, understand, know how to","Know, understand",null,null,null,"Learn, study",null,null),
                new Entry("soweli","Animal, especially land mammal, lovable animal",null,null,null,null,null,null,null,null,null,null),
                new Entry("suli","Size","Big, tall, long, adult, important",null,"Enlarge, lengthen",null,null,null,null,null,null,null),
                new Entry("suno","Sun, light",null,null,null,null,null,null,null,null,null,null),
                new Entry("supa","Horizontal surface, e.g furniture, table, chair, pillow, floor",null,null,null,null,null,null,null,null,null,null),
                new Entry("suwi","Candy, sweet food","Sweet, cute",null,"Sweeten",null,null,null,null,null,null,null),
                new Entry("tan","Origin, cause",null,null,null,null,null,"From, by, because of, since",null,null,null,null),
                new Entry("taso",null,"Only, sole",null,null,null,null,null,"But",null,null,null),
                new Entry("tawa","Movement, transportation","Moving, mobile",null,"Move, displace","Go, leave, walk, travel, move",null,"To, in order to, towards, for, until",null,null,null,null),
                new Entry("telo","Water, liquid, juice, sauce",null,null,"Water, wash with water",null,null,null,null,null,null,null),
                new Entry("tenpo","Time, period of time, moment, duration, situation",null,null,null,null,null,null,null,null,null,null),
                new Entry("toki","Language, talking, speech, communication",null,null,"Say","Talk, chat, communicate","Hello! hi!",null,null,null,null,null),
                new Entry("tomo","Indoor constructed space, e.g. house, home, room, building","Urban, domestic, household",null,null,null,null,null,null,null,null,null),
                new Entry("tu","Duo, pair","Two",null,"Double, separate/cut/divide in two",null,null,null,null,null,null,null),
                new Entry("unpa","Sex, sexuality","Erotic, sexual",null,"Have sex with, sleep with, fuck","Have sex",null,null,null,null,null,null),
                new Entry("uta","Mouth","Oral",null,null,null,null,null,null,null,null,null),
                new Entry("utala","Conflict, disharmony, competition, fight, war, battle, attack, blow, argument, physical or verbal violence",null,null,"Hit, strike, attack, compete against",null,null,null,null,null,null,null),
                new Entry("walo","White thing/part, whiteness, lightness","White, light (colour)",null,null,null,null,null,null,null,null,null),
                new Entry("wan","Unit, element, particle, part, piece","One, a",null,"Unite, make one",null,null,null,null,null,null,null),
                new Entry("waso","Bird, winged animal",null,null,null,null,null,null,null,null,null,null),
                new Entry("wawa","Energy, strength, power","Energetic, strong, fierce, intense, sure, confident",null,"Strengthen, energize, empower",null,null,null,null,null,null,null),
                new Entry("weka","Absence","Away, absent, missing",null,"Throw away, remove, get rid of",null,null,null,null,null,null,null),
                new Entry("wile","Desire, need, will","Necessary",null,"To want, need, wish, have to, must, will, should",null,null,null,null,null,null,null),
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
                if (p.name != "folded") {
                    return;
                }
                if (this.leaflet.folded) {
                    this.leaflet.set_visible_child(this.stack);
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


                var col = new Hdy.Column();
                var box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
                col.margin = 20;

                box.get_style_context().add_class(entry.word);

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

                col.add(box);
                col.maximum_width = 600;
                col.linear_growth_width = 500;
                this.stack.add_titled(col, dictionary[i].word, dictionary[i].word);
            }

            this.sidebarcontainer.add(this.searchbar);
            this.sidebarcontainer.add(this.sidebar);
            this.leaflet.add(this.sidebarcontainer);
            this.leaflet.add(this.stack);
            
            this.add(this.leaflet);
        }
    }
}
