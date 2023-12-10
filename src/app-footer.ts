import { html, LitElement, css } from "lit";
import { customElement, property } from "lit/decorators.js";
import { TWStyles } from './../tw.js';

@customElement('app-footer')
export class AppFooter extends LitElement {

    static styles = [css ``, TWStyles];

    render() {
        return html `
            <footer class="fixed bg-peach bottom-0 right-0 w-full h-20 py-0 px-0 text-left font-normal leading-6 text-darkBrown">
                <div class="px-3 sm:px-4 mt-6 bg-peach container mx-auto flex flex-wrap place-content-center">
                    <a class="md:mt-4" href="https://quinise.ercolano.com/">Created by Quinise</a>
                </div>
            </footer>
        `
    }
}