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

using IloPona.Widgets;
using IloPona.Views;
using Hdy;

namespace IloPona.Controllers {

    /**
     * The {@code AppController} class.
     *
     * @since 1.0.0
     */
    public class AppController {

        private Gtk.Application            application;
        private AppView                    app_view;
        private IloPona.Widgets.HeaderBar  headerbar;
        private Gtk.ApplicationWindow      window { get; private set; default = null; }
        private Gtk.SizeGroup lsize;
        private Gtk.SizeGroup rsize;
        public Gtk.ToggleButton search { get; private set; }
        public Gtk.Button btn;
        public Hdy.TitleBar tb;
        public Gtk.HeaderBar lhb;
        public Gtk.HeaderBar rhb;
        public Hdy.Leaflet leaflet;


        /**
         * Constructs a new {@code AppController} object.
         */
        public AppController (Gtk.Application application) {
            this.application = application;
            this.window = new Window (this.application);
            this.app_view = new AppView ();
            this.app_view.window = this.window;

            this.tb = new Hdy.TitleBar();

            this.search = new Gtk.ToggleButton();
            var image = new Gtk.Image.from_icon_name("edit-find-symbolic", Gtk.IconSize.BUTTON);
            this.search.image = image;

            var hamberder = new Gtk.MenuButton();
            var himage = new Gtk.Image.from_icon_name("open-menu-symbolic", Gtk.IconSize.BUTTON);
            var menu = new Menu();
            hamberder.use_popover = true;
            hamberder.image = himage;
            hamberder.menu_model = menu;
            menu.append("About Ilo Pona", "app.about");

            this.btn = new Gtk.Button.from_icon_name("go-previous-symbolic");
            this.btn.valign = Gtk.Align.CENTER;

            this.btn.clicked.connect(() => {
                this.app_view.leaflet.set_visible_child(this.app_view.sidebarcontainer);
            });

            var hgroup = new Hdy.HeaderGroup();
            
            this.lhb = new Gtk.HeaderBar();
            this.rhb = new Gtk.HeaderBar();
            this.rhb.pack_start(btn);

            this.lhb.set_title("Ilo Pona");
            this.lhb.pack_end(hamberder);
            this.lhb.pack_end(this.search);
            this.lhb.expand = true;

            var sep = new Gtk.Separator(Gtk.Orientation.VERTICAL);
            sep.get_style_context().add_class("sidebar");

            this.leaflet = new Hdy.Leaflet();
            this.leaflet.add(this.lhb);
            this.leaflet.add(sep);
            this.leaflet.add(this.rhb);

            this.leaflet.expand = true;
            
            this.tb.add(this.leaflet);

            this.lhb.show_close_button = true;
            this.rhb.show_close_button = true;
            this.leaflet.child_transition_type = Hdy.LeafletChildTransitionType.OVER;
            this.leaflet.mode_transition_type = Hdy.LeafletModeTransitionType.SLIDE;
            hgroup.add_header_bar(this.lhb);
            hgroup.add_header_bar(this.rhb);
            rhb.hexpand = true;


            this.lsize = new Gtk.SizeGroup(Gtk.SizeGroupMode.HORIZONTAL);
            this.lsize.add_widget(this.app_view.sidebarcontainer);
            this.lsize.add_widget(this.lhb);

            this.rsize = new Gtk.SizeGroup(Gtk.SizeGroupMode.HORIZONTAL);
            this.rsize.add_widget(this.app_view.stack);
            this.rsize.add_widget(this.rhb);

            this.app_view.leaflet.bind_property(
                "folded", 
                this.btn,
                "visible",
                BindingFlags.DEFAULT
            );
            this.search.bind_property(
                "active", 
                this.app_view.searchbar,
                "search_mode_enabled",
                BindingFlags.BIDIRECTIONAL
            );
            this.app_view.leaflet.notify.connect(() => {
                if (this.app_view.leaflet.visible_child == this.app_view.sidebarcontainer) {
                    this.leaflet.visible_child = this.lhb;
                } else {
                    this.leaflet.visible_child = this.rhb;
                }
            });

            this.window.add (this.app_view);
            this.window.set_default_size (800, 640);
            this.window.set_titlebar (this.tb);
            this.application.add_window (window);

            Gtk.Settings.get_default ().set ("gtk-application-prefer-dark-theme", true);
        }

        public void activate () {
            window.show_all ();
            app_view.activate ();
        }

        public void quit () {
            window.destroy ();
        }
    }
}
