import React from "react";
import { Link } from "@inertiajs/inertia-react";

export default function Sidebar({ user }) {
    return (
        <nav
            className="sb-sidenav accordion sb-sidenav-dark"
            id="sidenavAccordion"
        >
            <div className="sb-sidenav-menu">
                <div className="nav">
                    <div className="sb-sidenav-menu-heading">Core</div>
                    <Link className="nav-link" href={route("dashboard")}>
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Dashboard
                    </Link>
                </div>
            </div>
            <div className="sb-sidenav-footer">
                <div className="small">Logged in as:</div>
                {user && user.name ? user.name : "N/A"}
            </div>
        </nav>
    );
}
