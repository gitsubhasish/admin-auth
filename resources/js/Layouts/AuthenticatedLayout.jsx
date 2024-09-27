import { useState } from "react";
import Header from "@/Components/Header";
import Sidebar from "@/Components/Sidebar";
import Footer from "@/Components/Footer";

export default function Authenticated({ user, header, children }) {
    const [showingNavigationDropdown, setShowingNavigationDropdown] =
        useState(false);

    return (
        <>
            <Header user={user} />
            <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                    <Sidebar user={user} />
                </div>
                <div id="layoutSidenav_content">
                    <main>
                        <div className="container-fluid px-4">{children}</div>
                    </main>
                    <Footer />
                </div>
            </div>
        </>
    );
}
