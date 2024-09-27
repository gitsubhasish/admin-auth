import React, { useEffect } from "react";

export default function UserList({ users }) {
    useEffect(() => {
        const datatablesSimple = document.getElementById("datatablesSimple");
        if (datatablesSimple) {
            new simpleDatatables.DataTable(datatablesSimple);
        }
    }, []);
    return (
        <>
            <div className="card mb-4">
                <div className="card-header">
                    <i className="fas fa-table me-1"></i>
                    Users
                </div>
                <div className="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                            </tr>
                        </thead>

                        <tbody>
                            {users.length > 0
                                ? users.map((user) => (
                                      <tr key={user.id}>
                                          <td>{user.name}</td>
                                          <td>{user.email}</td>
                                      </tr>
                                  ))
                                : "No User Found"}
                        </tbody>
                    </table>
                </div>
            </div>
        </>
    );
}
