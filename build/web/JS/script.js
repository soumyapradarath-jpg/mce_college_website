/* js/script.js - admission frontend logic */

document.addEventListener('DOMContentLoaded', () => {
  // DOM elements
  const form = document.getElementById('admissionForm');
  const firstName = document.getElementById('firstName');
  const lastName = document.getElementById('lastName');
  const phone = document.getElementById('phone');
  const email = document.getElementById('email');
  const courseSelect = document.getElementById('courseSelect');

  const avatarPreview = document.getElementById('avatarPreview');
  const previewName = document.getElementById('previewName');
  const previewCourse = document.getElementById('previewCourse');
  const previewPhone = document.getElementById('previewPhone');
  const previewEmail = document.getElementById('previewEmail');

  const marksheetInput = document.getElementById('marksheet');
  const aadhaarInput = document.getElementById('aadhaar');
  const photoInput = document.getElementById('photoFile');

  const showMarksheet = document.getElementById('showMarksheet');
  const showAadhaar = document.getElementById('showAadhaar');
  const showPhoto = document.getElementById('showPhoto');

  const feeCourse = document.getElementById('feeCourse');
  const feeHostel = document.getElementById('feeHostel');
  const feeCanteen = document.getElementById('feeCanteen');
  const feeBus = document.getElementById('feeBus');
  const feeTotal = document.getElementById('feeTotal');

  // simple fee map per course
  const courseFees = {
    CSE: 85000,
    ME: 70000,
    CE: 65000,
    EE: 72000,
    EC: 76000,
    IT: 78000
  };
  const hostelFeeVal = 30000;
  const canteenFeeVal = 4000;
  const busFeeVal = 8000;

  // helper to update preview
  function updatePreview(){
    const name = (firstName.value.trim() + ' ' + lastName.value.trim()).trim();
    previewName.textContent = name || 'Name: -';
    previewCourse.textContent = 'Course: ' + (courseSelect.options[courseSelect.selectedIndex].text || '-');
    previewPhone.textContent = phone.value ? ('Phone: ' + phone.value) : '';
    previewEmail.textContent = email.value ? ('Email: ' + email.value) : '';
    updateFees();
  }

  // update fees
  function updateFees(){
    const courseKey = courseSelect.value;
    const cFee = courseFees[courseKey] || 0;
    feeCourse.textContent = cFee ? '₹ ' + cFee.toLocaleString() : '-';
    const hostel = document.getElementById('hostel').checked ? hostelFeeVal : 0;
    const canteen = document.getElementById('canteen').checked ? canteenFeeVal : 0;
    const bus = document.getElementById('bus').checked ? busFeeVal : 0;
    feeHostel.textContent = hostel ? '₹ ' + hostel.toLocaleString() : '₹ 0';
    feeCanteen.textContent = canteen ? '₹ ' + canteen.toLocaleString() : '₹ 0';
    feeBus.textContent = bus ? '₹ ' + bus.toLocaleString() : '₹ 0';
    feeTotal.textContent = '₹ ' + (cFee + hostel + canteen + bus).toLocaleString();
  }

  // file change handlers
  marksheetInput.addEventListener('change', () => {
    const f = marksheetInput.files[0];
    showMarksheet.textContent = f ? f.name : '—';
    if(f && f.size > 3 * 1024 * 1024) {
      alert('Marksheet file too large (>3MB). Choose a smaller file.');
      marksheetInput.value = '';
      showMarksheet.textContent = '—';
    }
  });
  aadhaarInput.addEventListener('change', () => {
    const f = aadhaarInput.files[0];
    showAadhaar.textContent = f ? f.name : '—';
    if(f && f.size > 3 * 1024 * 1024) {
      alert('Aadhaar file too large (>3MB). Choose a smaller file.');
      aadhaarInput.value = '';
      showAadhaar.textContent = '—';
    }
  });

  photoInput.addEventListener('change', () => {
    const f = photoInput.files[0];
    showPhoto.textContent = f ? f.name : '—';
    if(f && f.size > 1 * 1024 * 1024) {
      alert('Photo too large (>1MB). Choose a smaller file.');
      photoInput.value = '';
      showPhoto.textContent = '—';
      setDefaultAvatar();
      return;
    }
    if(f) {
      readFileAsDataURL(f).then(url => {
        avatarPreview.style.backgroundImage = `url('${url}')`;
      }).catch(err => {
        console.error(err);
        setDefaultAvatar();
      });
    } else {
      setDefaultAvatar();
    }
  });

  // default avatar
  function setDefaultAvatar(){
    avatarPreview.style.backgroundImage = "url('https://cdn-icons-png.flaticon.com/512/847/847969.png')";
  }

  // util to read file as dataURL (Promise)
  function readFileAsDataURL(file){
    return new Promise((resolve, reject) => {
      const fr = new FileReader();
      fr.onload = () => resolve(fr.result);
      fr.onerror = reject;
      fr.readAsDataURL(file);
    });
  }

  // escape HTML for insertion into print window
  function escapeHtml(s){
    if(!s) return '';
    return String(s).replace(/[&<>"']/g, function(m){ return ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'})[m]; });
  }

  // on input change update preview
  [firstName, lastName, phone, email, courseSelect, document.getElementById('hostel'), document.getElementById('canteen'), document.getElementById('bus')].forEach(el=>{
    if(el) el.addEventListener('input', updatePreview);
    if(el) el.addEventListener('change', updatePreview);
  });

  // reset handler
  document.getElementById('resetBtn').addEventListener('click', () => {
    form.reset();
    setDefaultAvatar();
    showMarksheet.textContent = '—';
    showAadhaar.textContent = '—';
    showPhoto.textContent = '—';
    updatePreview();
  });

  // Generate and print application
  document.getElementById('generateBtn').addEventListener('click', async () => {
    try {
      // validations
      if(!firstName.value.trim() || !lastName.value.trim()){
        alert('First and Last name are required.');
        return;
      }
      if(!phone.value.trim() || !/^\d{10}$/.test(phone.value.trim())){
        alert('Enter a valid 10-digit phone number.');
        return;
      }
      if(!email.value.trim() || !/^\S+@\S+\.\S+$/.test(email.value.trim())){
        alert('Enter a valid email.');
        return;
      }
      if(!courseSelect.value){
        alert('Please select a course.');
        return;
      }
      if(!marksheetInput.files.length || !aadhaarInput.files.length || !photoInput.files.length){
        alert('Please upload required documents (marksheet, aadhaar, photo).');
        return;
      }

      // gather data
      const data = {
        appId: 'MCE' + Date.now().toString().slice(-6),
        date: new Date().toLocaleDateString(),
        firstName: firstName.value.trim(),
        lastName: lastName.value.trim(),
        fatherName: document.getElementById('fatherName').value.trim(),
        motherName: document.getElementById('motherName').value.trim(),
        dob: document.getElementById('dob').value,
        gender: document.getElementById('gender').value,
        address: document.getElementById('address').value.trim(),
        phone: phone.value.trim(),
        email: email.value.trim(),
        prevExam: document.getElementById('prevExam').value.trim(),
        prevMarks: document.getElementById('prevMarks').value.trim(),
        courseCode: courseSelect.value,
        courseTitle: courseSelect.options[courseSelect.selectedIndex].text,
        hostel: document.getElementById('hostel').checked ? 'Yes' : 'No',
        canteen: document.getElementById('canteen').checked ? 'Yes' : 'No',
        bus: document.getElementById('bus').checked ? 'Yes' : 'No',
        paymentMethod: document.getElementById('paymentMethod').value || 'N/A',
        txnId: document.getElementById('txnId').value || 'N/A'
      };

      // files
      const marksFile = marksheetInput.files[0];
      const aadFile = aadhaarInput.files[0];
      const photoFile = photoInput.files[0];

      // read photo dataURL for embedding in print
      const photoDataUrl = await readFileAsDataURL(photoFile);

      // Compose print HTML
      const printHtml = buildPrintHtml(data, marksFile.name, aadFile.name, photoDataUrl);
      const w = window.open('', '_blank');
      w.document.open();
      w.document.write(printHtml);
      w.document.close();

    } catch (err) {
      console.error(err);
      alert('An error occurred while preparing the application. Try again.');
    }
  });

  // build printable HTML
  function buildPrintHtml(data, marksName, aadName, photoDataUrl){
    // fees
    const cFee = courseFees[data.courseCode] || 0;
    const hostel = data.hostel === 'Yes' ? hostelFeeVal : 0;
    const canteen = data.canteen === 'Yes' ? canteenFeeVal : 0;
    const bus = data.bus === 'Yes' ? busFeeVal : 0;
    const total = cFee + hostel + canteen + bus;

    // sanitize values before writing
    const escape = escapeHtml;

    return `
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Application - ${escape(data.firstName + ' ' + data.lastName)}</title>
  <style>
    body{ font-family: Arial, sans-serif; margin:20px; color:#222; }
    .header{ border-bottom:4px solid ${getComputedStyle(document.documentElement).getPropertyValue('--deep') || '#003366'}; padding-bottom:12px; margin-bottom:10px; display:flex; justify-content:space-between; align-items:center; }
    .college{ font-size:20px; color:#003366; font-weight:800; }
    .meta{ text-align:right; color:#444; font-size:13px;}
    table{ width:100%; border-collapse:collapse; margin-top:12px; }
    td{ padding:8px; border:1px solid #ddd; vertical-align:top; }
    .label{ width:220px; font-weight:700; color:#003366; background:#f7fbff; }
    .photo{ width:150px; text-align:center; }
    .photo img{ width:120px; height:140px; object-fit:cover; border:1px solid #ccc; }
    .fees { margin-top:10px; width:60%; }
    .fees td{ border:none; padding:6px 0; }
    .total{ font-weight:800; color:#003366; }
    .footnote{ margin-top:16px; font-size:13px; color:#444; }
    .signs{ margin-top:34px; display:flex; justify-content:space-between; gap:20px; }
    .sign-line{ display:block; border-top:1px solid #333; padding-top:6px; text-align:center; font-weight:700; width:220px; }
    @media print{ body{ margin:6mm; } .no-print{ display:none; } }
  </style>
</head>
<body>
  <div class="header">
    <div class="college">Modern College of Engineering</div>
    <div class="meta">Application ID: ${escape(data.appId)}<br>Date: ${escape(data.date)}</div>
  </div>

  <table>
    <tr>
      <td class="label">Full Name</td>
      <td>${escape(data.firstName + ' ' + data.lastName)}</td>
      <td class="photo" rowspan="6"><img src="${photoDataUrl}" alt="photo"></td>
    </tr>
    <tr><td class="label">Father's Name</td><td>${escape(data.fatherName)}</td></tr>
    <tr><td class="label">Mother's Name</td><td>${escape(data.motherName)}</td></tr>
    <tr><td class="label">DOB</td><td>${escape(data.dob)}</td></tr>
    <tr><td class="label">Gender</td><td>${escape(data.gender)}</td></tr>
    <tr><td class="label">Address</td><td>${escape(data.address)}</td></tr>
    <tr><td class="label">Phone / Email</td><td colspan="2">${escape(data.phone)} / ${escape(data.email)}</td></tr>
    <tr><td class="label">Previous Exam</td><td colspan="2">${escape(data.prevExam)} — ${escape(data.prevMarks)}</td></tr>
    <tr><td class="label">Uploaded Marksheet</td><td colspan="2">${escape(marksName)}</td></tr>
    <tr><td class="label">Uploaded Aadhaar</td><td colspan="2">${escape(aadName)}</td></tr>
    <tr><td class="label">Selected Course</td><td colspan="2">${escape(data.courseTitle)} (${escape(data.courseCode)})</td></tr>
  </table>

  <table class="fees">
    <tr><td>Course Fee</td><td>₹ ${cFee.toLocaleString()}</td></tr>
    <tr><td>Hostel Fee</td><td>₹ ${hostel.toLocaleString()}</td></tr>
    <tr><td>Canteen Fee</td><td>₹ ${canteen.toLocaleString()}</td></tr>
    <tr><td>Bus Fee</td><td>₹ ${bus.toLocaleString()}</td></tr>
    <tr class="total"><td>Total</td><td>₹ ${total.toLocaleString()}</td></tr>
  </table>

  <div class="footnote">
    <strong>Payment Method:</strong> ${escape(data.paymentMethod)} &nbsp;&nbsp; <strong>Txn/Ref:</strong> ${escape(data.txnId)}
  </div>

  <div class="footnote">
    Please attach original documents and one photocopy of this application at the time of submission. Incomplete applications may not be accepted.
  </div>

  <div class="signs">
    <div class="sign"><span class="sign-line">Applicant's Signature</span></div>
    <div class="sign"><span class="sign-line">College Office</span></div>
  </div>

  <div style="margin-top:12px;" class="no-print">
    <button onclick="window.print()">Print</button>
  </div>
</body>
</html>
`;
  }

  // initialize UI
  setDefaultAvatar();
  updatePreview();
});

