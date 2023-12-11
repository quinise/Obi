import { html, LitElement, css } from "lit";
import { customElement } from "lit/decorators.js";
import bannerIcon from './assets/banner-icon.png';
import { TWStyles } from './../tw.js';

@customElement('nav-bar')
class NavBar extends LitElement { 
    
    static styles = [css ``, TWStyles];

    render() {
        return html `
            <header class="flex items-center fixed bg-peach top-0 left-0 w-full py-0 px-0 text-left font-normal leading-6 text-darkBrown shadow">
                <nav class="px-3 sm:px-4 bg-peach w-full">
                    <div class="container mx-auto flex flex-wrap items-center justify-between">
                        <a href="/dashboard" class="cursor-pointer flex items-center">
                            <!-- Brand -->
                            <img class="mr-3 h-6 md:h-16 md:mr-0 sm:h-8" src=${bannerIcon} alt="crown logo">
                        </a>
                        
                        <div class="flex justify-end">
                            <!-- Nav Menu Items -->
                            <div class="hidden md:block md:w-auto">
                                <ul class="mt-4 flex justify-end flex-col rounded-lg p-4 md:mt-0 md:flex-row md:space-x-8 md:text-ms md:font-medium">
                                    <li>
                                        <a href="/dashboard" class="block cursor-pointer py-4 px-2 text-xs uppercase leading-6 tracking-widest text-darkBrown hover:text-sunflower">
                                        Dashboard
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/settings" class="block cursor-pointer py-4 px-2 text-xs uppercase leading-6 tracking-widest text-darkBrown hover:text-sunflower">
                                        Settings
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        
                        <!-- Mobile Nav -->
                        <div class="mobile-nav md:hidden mt-8">
                            <ul class="space-y-1 px-2 pb-3">
                                <li class="bg-peach hover:bg-sunflower uppercase block rounded-md px-3 py-2 font-medium text-darkBrown">
                                    <a href="/dashboard">
                                        Dashboard
                                    </a>
                                </li>
                                <li  class="bg-peach hover:bg-sunflower uppercase block rounded-md px-3 py-2 font-medium text-darkBrown">
                                    <a href="/settings">
                                        Settings
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <!-- Mobile menu button -->
                        <button type="button" class="md:hidden l-3 hover:bg-darkBrown/100 inline-flex items-center rounded-lg p-2 text-darkBrown hover:bg-darkBrown/100">
                            <span class="sr-only">Open the mobile menu</span>                            
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 fill-none">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                            </svg>  
                        </button>
                    </div>
                </nav>
            </header>
        `
    }
}