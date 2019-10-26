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
using Hdy;

namespace IloPona.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Hdy.TitleBar {

        public signal void search_changed ();
        public Gtk.SearchEntry search { get; private set; }

        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see IloPona.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            var hb = new Gtk.HeaderBar();
            
            search = new Gtk.SearchEntry();
            search.search_changed.connect(() => {
                this.search_changed();
            });

            hb.set_title ("Ilo Pona");
            hb.show_close_button = true;
            hb.pack_start (search);

            this.add(hb);
        }
    }
}
