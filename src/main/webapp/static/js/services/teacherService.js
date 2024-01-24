const FIELD = 'teachers';

export const getByTeacherId = async id => {
    let url = API_URL + `/${FIELD}`;
    if(id !== '')
        url += `/${id}`;

    const response = await fetch(url);
    const json = await response.json();
    return json;
}