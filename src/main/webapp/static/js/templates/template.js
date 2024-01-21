class Template {
    
}

class CourseTemplate extends Template {
    /**
     * 
     * @param {String} url 
     * @returns {String} html
     */
    render(url, page) {
        
    }
}

class LoginDialogTemplate extends Template {
    /**
     * @returns {String} html
     */
    render() {
        return /*html*/`
            <label for="#adminUsername">Username: </label>
            <input type="text" id="adminUsername" name="adminUsername">

            <label for="#adminPassword">Password: </label>
            <input type="password" id="adminPassword" name="adminPassword">
        `
    }
}