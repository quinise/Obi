import { LitElement, css, html } from 'lit'
import { customElement, property } from 'lit/decorators.js'
import { TWStyles } from './../tw.js';

/**
 * An example element.
 *
 * @slot - This element has a slot
 * @csspart button - The button
 */
@customElement('user-dashboard')
export class UserDashboard extends LitElement {

  static styles = [css ``, TWStyles];


  /**
   * Copy for the read the docs hint.
   */
  @property()
  docsHint = 'Click on the Vite and Lit logos to learn more'

  /**
   * The number of times the button has been clicked.
   */
  @property({ type: Number })
  count = 0

  render() {
    return html`
    <h1 class="mt-60 drop-shadow-lg shadow-darkBrown/50 text-center">Projects</h1>
    <div class="mx-auto mt-20 grid gap-4 grid-cols-2 w-2/3">
      <button class="flex flex-col w-full p-6 items-center gap-8 rounded-md border-[1px] border-border_sm bg-sunflower text-darkBrown shadow-lg shadow-darkBrown/50">
      Dummy Project 0
      </button>
      <button class="flex flex-col w-full p-6 items-center gap-8 rounded-md border-[1px] border-border_sm bg-sunflower text-darkBrown shadow-lg shadow-darkBrown/50">
      Dummy Project 1
      </button>
      <button class="flex flex-col w-full p-6 items-center gap-8 rounded-md border-[1px] border-border_sm bg-sunflower text-darkBrown shadow-lg shadow-darkBrown/50">
      Dummy Project 2
      </button>
      <button class="flex flex-col w-full p-6 items-center gap-8 rounded-md border-[1px] border-border_sm bg-sunflower text-darkBrown shadow-lg shadow-darkBrown/50">
      Dummy Project 4
      </button>
    </div>
    `
  }

  // private _onClick() {
  //   this.count++
  // }

  // static styles = css`
  //   :host {
  //     max-width: 1280px;
  //     margin: 0 auto;
  //     padding: 2rem;
  //     text-align: center;
  //   }


  //   .boilerplateContent {
  //     margin-top: 10%;
  //   }

  //   .logo {
  //     height: 6em;
  //     padding: 1.5em;
  //     will-change: filter;
  //     transition: filter 300ms;
  //   }
  //   .logo:hover {
  //     filter: drop-shadow(0 0 2em #646cffaa);
  //   }
  //   .logo.lit:hover {
  //     filter: drop-shadow(0 0 2em #325cffaa);
  //   }

  //   .card {
  //     padding: 2em;
  //   }

  //   .read-the-docs {
  //     color: #888;
  //   }

  //   ::slotted(h1) {
  //     font-size: 3.2em;
  //     line-height: 1.1;
  //   }

  //   a {
  //     font-weight: 500;
  //     color: #646cff;
  //     text-decoration: inherit;
  //   }
  //   a:hover {
  //     color: #535bf2;
  //   }

  //   button {
  //     border-radius: 8px;
  //     border: 1px solid transparent;
  //     padding: 0.6em 1.2em;
  //     font-size: 1em;
  //     font-weight: 500;
  //     font-family: inherit;
  //     background-color: #1a1a1a;
  //     cursor: pointer;
  //     transition: border-color 0.25s;
  //   }
  //   button:hover {
  //     border-color: #646cff;
  //   }
  //   button:focus,
  //   button:focus-visible {
  //     outline: 4px auto -webkit-focus-ring-color;
  //   }

  //   @media (prefers-color-scheme: light) {
  //     a:hover {
  //       color: #747bff;
  //     }
  //     button {
  //       background-color: #f9f9f9;
  //     }
  //   }
  // `
}

declare global {
  interface HTMLElementTagNameMap {
    'my-element': MyElement
  }
}
