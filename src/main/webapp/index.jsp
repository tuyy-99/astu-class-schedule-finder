let allSchedule = [];

/* LOAD DATA */
async function loadSchedule() {
    const res = await fetch("api/schedules");
    allSchedules = await res.json();

    renderSchedule(allSchedule);
    renderRoomList();
}

/* RENDER CLASS SCHEDULES */
function renderSchedule(data) {
    const box = document.getElementById("scheduleContainer");
    box.innerHTML = "";

    if (data.length === 0) {
        box.innerHTML = "<p>No schedules found</p>";
        return;
    }

    data.forEach(s => {
        box.innerHTML += `
            <div class="card">
                <h3>${s.courseCode} (${s.sectionId})</h3>
                <p><b>Day:</b> ${s.dayName}</p>
                <p><b>Time Slot:</b> ${s.timeSlotId}</p>
                <p><b>Type:</b> ${s.activityType}</p>
                <p><b>Room:</b> ${s.room}</p>
                <p>${s.details}</p>
            </div>
        `;
    });
}

/* SEARCH BUTTON */
function searchSchedule() {
    const q = document.getElementById("searchInput").value.toLowerCase();
    renderSchedule(
        allSchedule.filter(s =>
            s.courseCode.toLowerCase().includes(q)
        )
    );
}

/* ROOM LIST */
function renderRoomList() {
    const sel = document.getElementById("roomSelect");
    const rooms = [...new Set(allSchedule.map(s => s.room))];

    sel.innerHTML = `<option value="">Select Room</option>`;
    rooms.forEach(r => sel.innerHTML += `<option>${r}</option>`);
}

/* ROOM AVAILABILITY */
function checkRoomAvailability() {
    const room = roomSelect.value;
    const day = roomDay.value;
    const slot = roomTime.value;

    const res = document.getElementById("roomResult");

    const found = allSchedules.find(s =>
        s.room === room &&
        s.dayName === day &&
        String(s.timeSlotId) === slot
    );

    res.innerHTML = found
        ? `<div class="card"><h3>Occupied</h3><p>${found.courseCode}</p></div>`
        : `<div class="card"><h3 style="color:#2dff7a">Available</h3></div>`;
}

loadSchedule();
