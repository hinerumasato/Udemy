import { API_URL } from "../constants/api.js";
const FIELD = 'courses';

export const get = async (code = '') => {
    let url = API_URL + `/${FIELD}`;
    if(code !== '')
        url += `/${code}`;

    const response = await fetch(url);
    const json = await response.json();
    return json;
}