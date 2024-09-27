import React, { useState, useEffect } from "react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";
import { Inertia } from "@inertiajs/inertia";
import axios from "axios";
import UserList from "@/Components/UserList";

export default function Dashboard({ auth, users }) {
    useEffect(() => {
        const checkSession = async () => {
            try {
                const response = await axios.get("/check-session");
                if (!response.data.authenticated) {
                    Inertia.visit("/logout", { method: "post" });
                }
            } catch (error) {
                console.error("Error checking session:", error);
            }
        };

        const intervalId = setInterval(() => {
            checkSession();
        }, 1000);

        return () => clearInterval(intervalId);
    }, []);

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                    Dashboard
                </h2>
            }
        >
            <Head title="Dashboard" />

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <UserList users={users} />
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
