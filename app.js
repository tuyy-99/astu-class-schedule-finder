// js/app.js
const contextPath = "/astu-schedule-finder";  // Your app context path

function loadOptions(url, target) {
    fetch(url)
        .then(res => {
            if (!res.ok) {
                throw new Error('HTTP ' + res.status);
            }
            return res.json();
        })
        .then(data => {
            const el = document.querySelector(target);
            if (el.tagName === 'DATALIST') {
                el.innerHTML = '';
                data.forEach(item => {
                    const opt = document.createElement('option');
                    opt.value = item;
                    el.appendChild(opt);
                });
            } else {
                el.innerHTML = '<option value="">Loading...</option>';
                el.innerHTML = '<option value="">Select</option>';
                data.forEach(item => {
                    const opt = document.createElement('option');
                    opt.value = item;
                    opt.textContent = item;
                    el.appendChild(opt);
                });
            }
            console.log('Loaded ' + data.length + ' items for ' + target);
        })
        .catch(err => {
            console.error('Failed to load ' + url + ':', err);
            alert('Error loading dropdown data. Check Tomcat console for details.');
        });
}

window.onload = function() {
    if (location.href.includes('schedule.jsp')) {
        loadOptions(contextPath + '/ajax?action=courses', '#courses');
        loadOptions(contextPath + '/ajax?action=years', '#year');

        document.getElementById('year').onchange = function() {
            const yearVal = this.value;
            const sectionSelect = document.getElementById('section');
            if (yearVal) {
                loadOptions(contextPath + '/ajax?action=sections&year=' + encodeURIComponent(yearVal), '#section');
            } else {
                sectionSelect.innerHTML = '<option value="">Section</option>';
            }
        };
    }

    if (location.href.includes('room-search.jsp')) {
        loadOptions(contextPath + '/ajax?action=rooms', 'select[name="room"]');
        loadOptions(contextPath + '/ajax?action=days', 'select[name="day"]');
        loadOptions(contextPath + '/ajax?action=times', 'select[name="time"]');
    }
};

// Keep your existing searchSchedule function (if you're using form submit, you can remove this later)
// But leaving it here in case you need it
function searchSchedule() {
    const course = document.getElementById('course').value.trim();
    const year = document.getElementById('year').value;
    const section = document.getElementById('section').value;

    const params = new URLSearchParams();
    if (course) params.append('course', course);
    if (year) params.append('year', year);
    if (section) params.append('section', section);

    fetch(contextPath + '/schedule?' + params.toString())
        .then(response => response.text())
        .then(html => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            const resultDiv = document.getElementById('result');
            // Try to extract #result or main content
            const newContent = doc.querySelector('#result') || doc.querySelector('main');
            if (newContent) {
                resultDiv.innerHTML = newContent.innerHTML;
            } else {
                resultDiv.innerHTML = '<p>No result content found.</p>';
            }
        })
        .catch(err => {
            document.getElementById('result').innerHTML = '<p style="color:red;">Error loading results</p>';
            console.error(err);
        });
}