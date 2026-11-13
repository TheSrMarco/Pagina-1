/* PIUTTEC 2.0 — Aviso de privacidad de la demostración. */
(function () {
  'use strict';

  const VERSION = '1.0';
  const CONSENT_KEY = 'PIUTTEC_PRIVACY_V1';
  const ARCO_EMAIL = 'dpl@uttecamac.edu.mx';
  let preferences = {};
  let persisted = true;

  try {
    const saved = JSON.parse(localStorage.getItem(CONSENT_KEY));
    if (saved?.version === VERSION) preferences = saved;
  } catch {
    // La demostración también funciona si el navegador restringe el almacenamiento.
  }

  function savePreferences(changes) {
    preferences = { ...preferences, ...changes, version: VERSION };
    try {
      localStorage.setItem(CONSENT_KEY, JSON.stringify(preferences));
      persisted = true;
    } catch {
      persisted = false;
    }
    refreshConsentInfo();
  }

  const avisoSimplificado = `
<p><strong>Borrador para la demostración de PIUTTEC 2.0.</strong> La Universidad Tecnológica de Tecámac (UTTEC) es la institución prevista para operar la plataforma.</p>
<p class="mt-2">La demo usa datos de ejemplo para mostrar materias, calificaciones, asistencia, archivos, reservas, agenda y refuerzo académico. Los cambios se guardan en este navegador. Utilice solo datos ficticios.</p>
<p class="mt-2">Puede consultar el aviso integral, cambiar su preferencia para avisos, encuestas y tutorías, o exportar y borrar los datos de la demo.</p>
`;
  const avisoIntegral = `
<p class="mt-2"><strong>Borrador para la demostración.</strong> Utilice datos de ejemplo en PIUTTEC 2.0. Las finalidades y condiciones de la versión institucional están sujetas a validación por la UTTEC.</p>
<h3 class="font-bold text-sm mt-4">1. Responsable y contacto</h3>
<p>Universidad Tecnológica de Tecámac (UTTEC), carretera federal México–Pachuca, km 37.5, predio Sierra Hermosa, C.P. 55740, Tecámac, Estado de México. Teléfono general 55 5938 8400. Correo ARCO de la Unidad de Transparencia: <a class="underline" href="mailto:dpl@uttecamac.edu.mx">dpl@uttecamac.edu.mx</a>.</p>
<h3 class="font-bold text-sm mt-4">2. Datos y módulos</h3>
<p>La demo representa datos de identificación y académicos, calificaciones, horarios, asistencia, reservas, archivos, agenda y directorio docente. El navegador guarda los cambios de la demo. El gestor simula la carga y guarda los datos descriptivos del archivo.</p>
<h3 class="font-bold text-sm mt-4">3. Datos sensibles</h3>
<p>Utilice información ficticia para simular justificantes. La versión institucional deberá definir las condiciones para recibir y proteger documentos que contengan datos sensibles.</p>
<h3 class="font-bold text-sm mt-4">4. Fundamento legal</h3>
<p>Consulte el <a class="underline" href="https://uttecamac.edomex.gob.mx/sites/uttecamac.edomex.gob.mx/files/files/PDFs/DPL/SLIDERS/AVISO_DE_PRIVACIDAD_UTTEC.pdf" target="_blank" rel="noopener noreferrer">aviso integral publicado por la UTTEC</a>. El fundamento específico de PIUTTEC 2.0 queda pendiente de validación institucional.</p>
<h3 class="font-bold text-sm mt-4">5. Finalidades</h3>
<p><strong>Previstas:</strong> prestar servicios académicos, llevar la asistencia, organizar la agenda, gestionar solicitudes y archivos y apoyar el refuerzo académico.</p>
<p><strong>Opcionales:</strong> avisos, encuestas y tutorías. La preferencia se guarda en este navegador y puede cambiarse en cualquier momento.</p>
<h3 class="font-bold text-sm mt-4">6. Servicios externos y transferencias</h3>
<p>El navegador carga recursos de Google Fonts, cdnjs y Tailwind. Esos servidores pueden recibir datos técnicos de la conexión, como la dirección IP. Consulte el aviso institucional para conocer las condiciones de transferencia aplicables.</p>
<h3 class="font-bold text-sm mt-4">7. Almacenamiento local</h3>
<p>El estado de la demo y la preferencia del aviso se guardan en el navegador. En esta sección puede exportarlos en JSON o borrarlos de este dispositivo.</p>
<h3 class="font-bold text-sm mt-4">8. Derechos ARCO y portabilidad</h3>
<p>Para ejercer los derechos de acceso, rectificación, cancelación y oposición (ARCO), consulte los requisitos y canales en el aviso institucional. El formulario de esta página prepara un correo para la Unidad de Transparencia. La descarga de la demo contiene únicamente datos de este navegador.</p>
<h3 class="font-bold text-sm mt-4">9. Preferencias</h3>
<p>Puede desmarcar las finalidades adicionales en esta sección. Para solicitudes sobre datos institucionales, comuníquese con la Unidad de Transparencia.</p>
<h3 class="font-bold text-sm mt-4">10. Medidas de seguridad</h3>
<p>La UTTEC deberá validar las medidas aplicables al tratamiento institucional y los canales de atención antes de operar con datos reales.</p>
<h3 class="font-bold text-sm mt-4">11. Conservación</h3>
<p>Los datos de demostración permanecen en el navegador hasta que se borren. Los plazos institucionales, el horario de atención y el órgano garante aplicables requieren confirmación de la UTTEC.</p>
<h3 class="font-bold text-sm mt-4">12. Cambios al aviso</h3>
<p>Versión 1.0 del borrador. Fecha indicada: 12 de noviembre de 2026.</p>
`;

  // ====== 5. INYECTAR VISTA "PRIVACIDAD" ======
  const main = document.querySelector('main');
  const section = document.createElement('section');
  section.id = 'view-privacidad';
  section.className = 'tab-view hidden fade-in space-y-6';
  section.innerHTML = `
    <div class="max-w-3xl space-y-6">
      <div class="bg-white dark:bg-slate-800 p-5 rounded-2xl border border-slate-200/80 dark:border-slate-700">
        <h2 class="text-lg font-bold" id="privNoticeTitle" tabindex="-1">Aviso de privacidad integral</h2>
        <div class="text-sm text-slate-700 dark:text-slate-200 leading-relaxed">${avisoIntegral}</div>
      </div>
      <div class="bg-white dark:bg-slate-800 p-5 rounded-2xl border border-slate-200/80 dark:border-slate-700 space-y-4">
        <div>
          <h2 class="text-lg font-bold">Mis datos y mis derechos</h2>
          <p class="text-xs text-slate-500 dark:text-slate-400" id="privConsentInfo" role="status"></p>
          <button type="button" id="privRead" class="mt-2 px-4 py-2 rounded-xl bg-brand-600 hover:bg-brand-700 text-white text-xs font-semibold">Marcar aviso como leído</button>
        </div>
        <label class="flex items-start gap-2 text-sm cursor-pointer">
          <input type="checkbox" id="privAdicionales" class="mt-1 w-4 h-4 accent-indigo-600">
          <span>Quiero recibir avisos opcionales, encuestas y tutorías cuando estén disponibles.</span>
        </label>
        <div class="flex flex-wrap gap-2 text-xs">
          <button type="button" id="privExport" class="px-4 py-2 rounded-xl bg-brand-600 hover:bg-brand-700 text-white font-semibold"><i class="fa-solid fa-download mr-1"></i>Exportar datos de la demo</button>
          <button type="button" id="privDelete" class="px-4 py-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white font-semibold"><i class="fa-regular fa-trash-can mr-1"></i>Borrar datos de la demo</button>
        </div>
        <hr class="border-slate-200 dark:border-slate-700">
        <form id="arcoForm" class="space-y-3 text-xs">
          <h3 class="font-bold text-sm">Solicitud de derechos ARCO</h3>
          <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <div><label class="block font-semibold mb-1" for="arcoNombre">Nombre completo</label>
              <input id="arcoNombre" required class="w-full rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 px-3 py-2"></div>
            <div><label class="block font-semibold mb-1" for="arcoContacto">Correo para recibir respuesta</label>
              <input id="arcoContacto" type="email" required class="w-full rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 px-3 py-2"></div>
          </div>
          <div><label class="block font-semibold mb-1" for="arcoDerecho">Derecho que desea ejercer</label>
            <select id="arcoDerecho" class="w-full rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 px-3 py-2">
              <option>Acceso</option><option>Rectificación</option><option>Cancelación</option><option>Oposición</option><option>Portabilidad</option>
            </select></div>
          <div><label class="block font-semibold mb-1" for="arcoDescripcion">Descripción clara de los datos y de lo que solicita</label>
            <textarea id="arcoDescripcion" rows="3" required class="w-full rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 px-3 py-2"></textarea></div>
          <p class="text-slate-500 dark:text-slate-400">Este formulario prepara un borrador en su aplicación de correo. Consulte los requisitos y canales en el aviso institucional.</p>
          <button type="submit" class="px-4 py-2 rounded-xl bg-brand-600 hover:bg-brand-700 text-white font-semibold">Abrir borrador de correo</button>
        </form>
      </div>
    </div>`;
  main.appendChild(section);

  // ====== 6. ENTRADA EN MENÚ LATERAL Y ENLACE AL PIE ======
  const nav = document.getElementById('navLinks');
  const navBtn = document.createElement('button');
  navBtn.type = 'button';
  navBtn.dataset.tab = 'privacidad';
  navBtn.setAttribute('onclick', "switchTab('privacidad')");
  navBtn.className = 'nav-btn w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium text-slate-600 dark:text-slate-300 hover:bg-slate-100 dark:hover:bg-slate-700/50 transition-all';
  navBtn.innerHTML = '<i class="fa-solid fa-user-shield w-5 text-center" aria-hidden="true"></i><span>Privacidad y Datos</span>';
  nav.appendChild(navBtn);

  const footerLink = document.createElement('button');
  footerLink.type = 'button';
  footerLink.className = 'w-full text-center text-[11px] text-slate-500 dark:text-slate-400 hover:underline py-2';
  footerLink.textContent = 'Aviso de privacidad';
  footerLink.onclick = () => switchTab('privacidad');
  document.getElementById('sidebar').appendChild(footerLink);

  if (typeof tabTitles !== 'undefined') tabTitles.privacidad = 'Privacidad y Protección de Datos Personales';

  // ====== 7. MODAL DE AVISO SIMPLIFICADO (CONSENTIMIENTO) ======
  const modal = document.createElement('dialog');
  modal.id = 'modalPrivacidad';
  modal.className = 'm-auto w-[calc(100%_-_2rem)] max-w-lg max-h-[90vh] overflow-y-auto rounded-2xl bg-white dark:bg-slate-800 text-slate-900 dark:text-slate-100 p-6 shadow-xl backdrop:bg-slate-900/70';
  modal.setAttribute('role', 'dialog');
  modal.setAttribute('aria-modal', 'true');
  modal.setAttribute('aria-labelledby', 'privModalTitle');
  modal.innerHTML = `
    <div>
      <h3 id="privModalTitle" class="font-bold text-base flex items-center gap-2"><i class="fa-solid fa-user-shield text-brand-600"></i> Aviso de privacidad simplificado</h3>
      <div class="text-xs text-slate-700 dark:text-slate-200 leading-relaxed mt-3">${avisoSimplificado}</div>
      <label class="flex items-start gap-2 text-xs mt-4 cursor-pointer">
        <input type="checkbox" id="privModalAdic" class="mt-0.5 w-4 h-4 accent-indigo-600">
        <span>Quiero recibir avisos opcionales, encuestas y tutorías cuando estén disponibles.</span>
      </label>
      <div class="flex flex-wrap justify-end gap-2 pt-4 text-xs">
        <button type="button" id="privModalLeer" class="px-4 py-2 rounded-xl border border-slate-200 dark:border-slate-700 font-medium">Leer aviso integral</button>
        <button type="button" id="privModalOk" autofocus class="px-4 py-2 rounded-xl bg-brand-600 hover:bg-brand-700 text-white font-semibold">He leído el aviso y continuar</button>
      </div>
    </div>`;
  document.body.appendChild(modal);


  const additional = document.getElementById('privAdicionales');
  const modalAdditional = document.getElementById('privModalAdic');
  const readButton = document.getElementById('privRead');

  function refreshConsentInfo() {
    const readAt = preferences.fecha && new Date(preferences.fecha);
    const read = Boolean(readAt && Number.isFinite(readAt.getTime()));
    const message = read
      ? 'Lectura de la versión ' + VERSION + ' registrada el ' + readAt.toLocaleString('es-MX') + '.'
      : 'Lectura del aviso pendiente.';
    document.getElementById('privConsentInfo').textContent = persisted
      ? message
      : message + ' Los cambios se conservan solo durante esta sesión.';
    additional.checked = preferences.adicionales === true;
    modalAdditional.checked = additional.checked;
    readButton.hidden = read;
  }

  document.getElementById('privModalOk').onclick = () => {
    savePreferences({ fecha: new Date().toISOString(), adicionales: modalAdditional.checked });
    modal.close();
  };

  document.getElementById('privModalLeer').onclick = () => {
    modal.close();
    switchTab('privacidad');
    document.getElementById('privNoticeTitle').focus();
  };

  readButton.onclick = () => {
    savePreferences({ fecha: new Date().toISOString() });
    document.getElementById('privNoticeTitle').focus();
  };

  additional.onchange = () => {
    savePreferences({ adicionales: additional.checked });
  };

  document.getElementById('privExport').onclick = () => {
    const data = { exportado: new Date().toISOString(), preferencias: preferences, datos: appState };
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.href = url;
    link.download = 'mis_datos_piuttec.json';
    link.click();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
    showToast('Exportación de la demo preparada', 'success');
  };

  document.getElementById('privDelete').onclick = () => {
    if (!confirm('¿Borrar los cambios guardados en la demo y restablecer el aviso en este navegador?')) return;
    try {
      localStorage.removeItem(STORAGE_KEY);
      localStorage.removeItem(CONSENT_KEY);
    } catch {
      showToast('El navegador impidió borrar los datos locales', 'error');
      return;
    }
    location.reload();
  };

  document.getElementById('arcoForm').onsubmit = event => {
    event.preventDefault();
    const body = [
      'Solicitud de ejercicio de derechos ARCO',
      '',
      'Nombre: ' + document.getElementById('arcoNombre').value.trim(),
      'Correo de respuesta: ' + document.getElementById('arcoContacto').value.trim(),
      'Derecho: ' + document.getElementById('arcoDerecho').value,
      'Descripción: ' + document.getElementById('arcoDescripcion').value.trim(),
    ].join('\n');
    window.location.href = 'mailto:' + ARCO_EMAIL
      + '?subject=' + encodeURIComponent('Solicitud ARCO - PIUTTEC 2.0')
      + '&body=' + encodeURIComponent(body);
  };

  refreshConsentInfo();
  if (!readButton.hidden) modal.showModal();
})();
