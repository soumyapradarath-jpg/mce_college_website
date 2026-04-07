<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admission - Modern College of Engineering</title>
  <link rel="stylesheet" href="../CSS/style.css">
</head>
<body>
  <header class="site-header">
    <div class="brand">Modern College of Engineering</div>
    <nav class="top-nav">
      <a href="../index.jsp">Home</a>
      <a href="courses.jsp">Courses</a>
      <a href="../student_portal.jsp">Student Portal</a>
      <a href="addmission.jsp" class="active">Admission</a>
    </nav>
  </header>

  <main class="page">
    <section class="page-title">
      <h1>New Admission ? Application Form</h1>
      <p class="lead">Fill details, upload documents and generate a printable common application form.</p>
    </section>

    <section class="layout">
      <!-- LEFT: FORM -->
      <form id="admissionForm" class="form-column" enctype="multipart/form-data" novalidate>
        <fieldset class="card">
          <legend>Personal Information</legend>

          <div class="grid-2">
            <label>First Name *<input id="firstName" name="firstName" type="text" required></label>
            <label>Last Name *<input id="lastName" name="lastName" type="text" required></label>
          </div>

          <div class="grid-2">
            <label>Father's Name *<input id="fatherName" name="fatherName" type="text" required></label>
            <label>Mother's Name<input id="motherName" name="motherName" type="text"></label>
          </div>

          <div class="grid-2">
            <label>Date of Birth *<input id="dob" name="dob" type="date" required></label>
            <label>Gender * 
              <select id="gender" name="gender" required>
                <option value="">Select</option>
                <option>Male</option><option>Female</option><option>Other</option>
              </select>
            </label>
          </div>

          <label>Address *<textarea id="address" name="address" rows="3" required></textarea></label>

          <div class="grid-2">
            <label>Phone *<input id="phone" name="phone" type="tel" placeholder="10 digits" required></label>
            <label>Email *<input id="email" name="email" type="email" required></label>
          </div>
        </fieldset>

        <fieldset class="card">
          <legend>Academic Details & Uploads</legend>
          <div class="grid-2">
            <label>Previous Exam (eg. 12th Board)<input id="prevExam" name="prevExam" type="text"></label>
            <label>Percentage / Marks<input id="prevMarks" name="prevMarks" type="text"></label>
          </div>

          <label>Upload Marksheet (PDF / Image ? max 3MB)
            <input id="marksheet" name="marksheet" type="file" accept=".pdf,image/*" required>
            <small class="muted" id="marksheetName"></small>
          </label>

          <label>Upload Aadhaar (PDF / Image ? max 3MB)
            <input id="aadhaar" name="aadhaar" type="file" accept=".pdf,image/*" required>
            <small class="muted" id="aadhaarName"></small>
          </label>

          <label>Passport Size Photo (JPEG/PNG ? max 1MB)
            <input id="photoFile" name="photo" type="file" accept="image/*" required>
            <small class="muted">Preview on the right</small>
          </label>
        </fieldset>

        <fieldset class="card">
          <legend>Course & Facilities</legend>

          <label>Choose Course *
            <select id="courseSelect" name="course" required>
              <option value="">Select a course</option>
              <option value="CSE">B.Tech - Computer Science (CSE)</option>
              <option value="ME">B.Tech - Mechanical Engineering (ME)</option>
              <option value="CE">B.Tech - Civil Engineering (CE)</option>
              <option value="EE">B.Tech - Electrical Engineering (EE)</option>
              <option value="EC">B.Tech - Electronics & Communication (EC)</option>
              <option value="IT">B.Tech - Information Technology (IT)</option>
            </select>
          </label>

          <div class="grid-3">
            <label><input type="checkbox" id="hostel" name="hostel"> Hostel</label>
            <label><input type="checkbox" id="canteen" name="canteen"> Canteen</label>
            <label><input type="checkbox" id="bus" name="bus"> Bus Facility</label>
          </div>
        </fieldset>

        <fieldset class="card">
          <legend>Payment / Declaration</legend>
          <div class="grid-2">
            <label>Payment Method
              <select id="paymentMethod" name="paymentMethod">
                <option value="">Select</option>
                <option value="online">Online (UPI/Netbanking)</option>
                <option value="card">Card</option>
                <option value="bank">Bank Transfer</option>
                <option value="offline">Offline (Bank Challan)</option>
              </select>
            </label>

            <label>Transaction / Reference Number<input id="txnId" name="txnId" type="text"></label>
          </div>

          <label class="muted">I declare that all information provided is true and correct to the best of my knowledge.</label>
        </fieldset>

        <div class="actions">
          <button id="resetBtn" type="button" class="btn ghost">Reset</button>
          <button id="generateBtn" type="button" class="btn primary">Generate & Print Application</button>
        </div>
      </form>

      <!-- RIGHT: Preview / Fee summary -->
      <aside class="aside-column">
        <div class="card preview">
          <h3>Applicant Preview</h3>
          <div class="avatar" id="avatarPreview"></div>
          <div class="preview-info">
            <div><strong id="previewName">Name: -</strong></div>
            <div id="previewCourse">Course: -</div>
            <div id="previewPhone" class="muted"></div>
            <div id="previewEmail" class="muted"></div>
          </div>
        </div>

        <div class="card fees">
          <h3>Fee Summary</h3>
          <div class="fee-row"><span>Course Fee</span><span id="feeCourse">-</span></div>
          <div class="fee-row"><span>Hostel</span><span id="feeHostel">0</span></div>
          <div class="fee-row"><span>Canteen</span><span id="feeCanteen">0</span></div>
          <div class="fee-row"><span>Bus</span><span id="feeBus">0</span></div>
          <div class="fee-row total"><span>Total</span><span id="feeTotal">0</span></div>
        </div>

        <div class="card docs-list">
          <h3>Uploaded Files</h3>
          <div>Marksheet: <span id="showMarksheet">?</span></div>
          <div>Aadhaar: <span id="showAadhaar">?</span></div>
          <div>Photo: <span id="showPhoto">?</span></div>
        </div>
      </aside>
    </section>
  </main>

  <footer class="site-footer">
    &copy; 2025 Modern College of Engineering
  </footer>

  <script src="../JS/script.js"></script>
</body>
</html>