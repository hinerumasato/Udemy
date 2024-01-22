class Template {
    
}

class CourseTemplate extends Template {

    async getByCategoryId(categoryId) {
        const FIELD = 'categories';
        let url = API_URL + `/${FIELD}`;
        if(categoryId !== '')
            url += `/${categoryId}`;

        const response = await fetch(url);
        const json = await response.json();
        return json;
    }

    async getByLevelId(levelId) {
        const FIELD = 'levels'
        let url = API_URL + `/${FIELD}`;
        if(levelId !== '')
            url += `/${levelId}`;

        const response = await fetch(url);
        const json = await response.json();
        return json;
    }

    async getByTeacherId(teacherId) {
        const FIELD = 'teachers';
        let url = API_URL + `/${FIELD}`;
        if(teacherId !== '')
            url += `/${teacherId}`;

        const response = await fetch(url);
        const json = await response.json();
        return json;
    }

    /**
     * 
     * @param {String} url 
     * @param {Number} page 
     * @returns {String} html
     */

    async render(url, page = 0) {

        if(page != 0)
            url += `&page=${page}`;
        const response = await fetch(url);
        const obj = await response.json();
        if (obj.statusCode === 200) {
            const courses = obj.data;
            const htmlPromises = courses.map(async course => {
                const categoryObj = await this.getByCategoryId(course.categoryId);
                const levelObj = await this.getByLevelId(course.levelId);
                const teacherObj = await this.getByTeacherId(course.teacherId);
                const category = categoryObj.data;
                const level = levelObj.data;
                const teacher = teacherObj.data;

                const categoryByTeacherObj = await this.getByCategoryId(teacher.categoryId);
                const categoryByTeacher = categoryByTeacherObj.data;

                return /* html */`
                    <div class="col">
                        <div class="course-item">
                            <a href="/courses/details/${course.slug}">
                                <div class="course-item-thumbnail">
                                    <img class="w-100"
                                        src="${course.thumbnails[0].img}" alt="${course.name}">
                                </div>
                                <div class="course-item-level ${level.code}">
                                    ${level.value}
                                </div>
                                <div class="course-item-info">
                                    <h4 class="course-item-info-title">
                                        ${course.name}
                                    </h4>
                                    <div class="course-item-info-category">
                                        ${category.name}
                                    </div>
                                    <div class="course-item-info-prices d-block d-md-flex gap-2 align-items-center">
                                        <div class="format-price course-item-info-prices-new-price">
                                            ${course.salePrice}</div>
                                        <div class="format-price course-item-info-prices-old-price">${course.price}
                                        </div>
                                    </div>
                                </div>

                                <div class="course-backside">
                                    <div class="course-teacher">
                                        <div class="course-teacher-info d-md-flex d-block gap-2 align-items-center">
                                            <img src="${teacher.avatar}"
                                                class="rounded-circle" style="width: 60px; height: 60px;" alt="Avatar" />
                                            <div>
                                                <h6 class="fw-bold teacher-name">${teacher.name}</h6>
                                                <span>${categoryByTeacher.name}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <h4 class="fw-bold mt-3 text-main">${course.name}</h4>
                                    <div class="course-backside-description">${course.description}</div>
                                    <div class="backside-data d-block d-md-flex justify-content-between align-items-center">
                                        <div class="backside-level">
                                            <i class="fa-solid fa-chart-line"></i>
                                            <span>${level.value}</span>
                                        </div>

                                        <div class="backside-lesson">
                                            <i class="fa fa-video-camera" aria-hidden="true"></i>
                                            <span>7 bài giảng</span>
                                        </div>

                                        <div class="backside-time">
                                            <i class="fa-solid fa-clock"></i>
                                            <span>7 giờ</span>
                                        </div>
                                    </div>

                                    <div class="mt-5">
                                        <button class="btn-main-course w-100">Preview về khoá học</button>
                                    </div>

                                    <div class="d-block d-md-flex justify-content-between mt-3">
                                        <div class="like rounded bg-body-tertiary p-1 rounded-circle">
                                            <i class="fa-regular fa-heart"></i>
                                        </div>
                                        <div class="share rounded bg-body-tertiary p-1 rounded-circle">
                                            <i class="fa-regular fa-share-from-square"></i>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                `;
            });
            const htmls = await Promise.all(htmlPromises);
            return htmls.join('');
        } else {
            return `
                <div class="w-100 text-center alert alert-warning alert-dismissible fade show" role="alert">
                    <strong>Chưa có bài viết cho thể loại này!</strong>
                </div>
            `;
        }
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