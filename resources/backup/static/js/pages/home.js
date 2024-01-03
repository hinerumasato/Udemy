import { getById } from "../services/categoryService.js";
import { getById as getByIdLevel } from "../services/levelService.js";
import { getCourses } from "../services/courseService.js";
import { getByTeacherId } from "../services/teacherService.js";

(function () {
    
    function renderCourseItem(selector, classRender) {
        const navItems = document.querySelectorAll(`${selector} .nav-item[code]`);
        navItems.forEach(item => {
            item.onclick = async () => {
                const code = item.getAttribute('code');
                const tabPane = document.querySelector(`${selector} .tab-pane[code="${code}"]`)
                const obj = await getCourses(code);
                if(obj.statusCode == 200)  {
                    const courses = obj.data;
                    const promises = courses.map(async course => {
                        return new Promise(async resolve => {

                            const categoryObj = await getById(course.categoryId);
                            const levelObj = await getByIdLevel(course.levelId);
                            const teacherObj = await getByTeacherId(course.teacherId);
                            const category = categoryObj.data;
                            const level = levelObj.data;
                            const teacher = teacherObj.data;
                            const categoryByTeacherObj = await getById(teacher.categoryId);
                            const categoryByTeacher = categoryByTeacherObj.data;
                            const courseHTML = `
                            <div class="col">
                                <div class="course-item">
                                    <a href="">
                                        <div class="course-item-thumbnail">
                                            <img class="w-100"
                                                src="${course.thumbnails[0].img}" alt="">
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
                                            <div class="course-item-info-prices d-flex gap-2 align-items-center">
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
                            resolve(courseHTML);
                        })

                    });
                    const htmls = (await Promise.all(promises)).join('');

                    tabPane.innerHTML = `<div class="${classRender}">${htmls}</div>`;
                    price();

                } else {
                    tabPane.innerHTML = `
                    <div class="w-100 text-center alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Chưa có bài viết cho thể loại này!</strong>
                    </div>
                    `;
                }
            }
        })
        
    }
    renderCourseItem('.home_container_group', 'row row-cols-lg-3 row-cols-md-2 row-cols-1 g-3 newest-course-list');
    renderCourseItem('.popular_container_group', 'row row-cols-lg-4 row-cols-md-2 row-cols-1 g-3 popular-course-list')
})();