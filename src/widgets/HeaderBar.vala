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

namespace IloPona.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        public signal void menu_clicked ();
        public Gtk.MenuButton menu_button { get; private set; }

        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see IloPona.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            

            menu_button = new Gtk.MenuButton ();
            menu_button.set_image (new Gtk.Image .from_icon_name ("open-menu-symbolic", Gtk.IconSize.LARGE_TOOLBAR));
            menu_button.tooltip_text = _("Settings");
            menu_button.clicked.connect (() => {
                menu_clicked ();
            });

            this.set_title ("Ilo Pona");
            this.show_close_button = true;
            this.pack_end (menu_button);
        }
    }
}
