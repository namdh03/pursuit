export default function sendRequest(url, method, data) {
    return new Promise((resolve, reject) => {
        fetch(url, {
            method: method,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: data,
        })
            .then((response) => {
                if (!response.ok) {
                    throw new Error(response.status);
                }
                return response.json();
            })
            .then((responseData) => {
                resolve(responseData);
            })
            .catch((error) => {
                reject(error);
            });
    });
}
