<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dell OptiPlex 7050 SFF | The Legacy Hybrid</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://images.unsplash.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">

    <style>
        * { 
            margin: 0; 
            padding: 0; 
            box-sizing: border-box; 
            cursor: none !important; 
        }

        /* Reinforce cursor hiding on all interactive elements and states */
        a, button, .comp-card, .scroll-handle, .scroll-tracker, *:active {
            cursor: none !important;
        }

        html { scrollbar-width: none; -ms-overflow-style: none; scroll-behavior: smooth; }
        html::-webkit-scrollbar { display: none; }

        html.no-smooth { scroll-behavior: auto !important; }
        body.is-dragging { user-select: none; }

        :root {
            --bg: #050505;
            --dell-blue: #0076ce;
            --neon-green: #39ff14; /* Gen Alpha 'Aesthetic' */
            --glass: rgba(255, 255, 255, 0.05);
            --text-main: #ffffff;
            --text-dim: #b0b0b0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: transparent; /* Allow canvas to be visible */
            color: var(--text-main);
            overflow-x: hidden;
        }

        /* Large fonts for Boomer readability, bold weight for Alpha style */
        h1 { font-size: clamp(3rem, 8vw, 6rem); font-weight: 900; letter-spacing: -2px; }
        h2 { font-size: clamp(2rem, 5vw, 3.5rem); }

        .container { max-width: 1300px; margin: 0 auto; padding: 0 20px; }

        /* HERO SECTION */
        #hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            background: radial-gradient(circle at 50% 50%, rgba(0, 0, 0, 0.4) 0%, rgba(0, 0, 0, 0) 100%);
        }

        .badge {
            background: var(--dell-blue);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
            text-transform: uppercase;
            font-weight: 700;
            margin-bottom: 20px;
        }

        /* HERO BUTTONS */
        .hero-buttons {
            display: flex;
            gap: 20px;
            margin-top: 40px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .hero-btn {
            background: var(--dell-blue);
            color: white;
            padding: 15px 30px;
            border-radius: 30px;
            font-weight: 700;
            text-decoration: none;
            transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 10px 25px rgba(0, 118, 206, 0.4);
            border: none;
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        .hero-btn.pulse {
            animation: hero-pulse 2.5s infinite;
        }

        .hero-btn:hover {
            transform: translateY(-5px);
            background: #005da3;
            box-shadow: 0 15px 30px rgba(0, 118, 206, 0.6);
        }

        @keyframes hero-pulse {
            0% { box-shadow: 0 0 0 0 rgba(0, 118, 206, 0.6); }
            70% { box-shadow: 0 0 0 15px rgba(0, 118, 206, 0); }
            100% { box-shadow: 0 0 0 0 rgba(0, 118, 206, 0); }
        }

        /* EXPLODED VIEW */
        #exploded-view { padding: 100px 0 150px 0; background: transparent; }

        .viz-layout {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: start;
        }

        .sticky-visual {
            position: sticky;
            top: 100px;
            height: 500px;
            background: #000;
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #222;
            overflow: hidden;
            box-shadow: 0 0 50px rgba(0, 118, 206, 0.1);
        }

        .sticky-visual img {
            width: calc(100% - 40px); /* 20px gap on all sides (cursor size) */
            height: calc(100% - 40px);
            object-fit: cover;
            border-radius: 20px;
            transition: transform 0.8s cubic-bezier(0.2, 1, 0.3, 1), opacity 0.3s ease;
            will-change: transform, opacity, filter;
            filter: drop-shadow(0 0 20px rgba(0, 118, 206, 0.6));
            backface-visibility: hidden;
        }

        .info-scroll { padding-bottom: 5vh; }

        /* Back to Top Button */
        #backToTopBtn {
            position: fixed;
            bottom: 40px;
            right: 40px;
            width: 55px;
            height: 55px;
            background: var(--dell-blue);
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            display: none;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            z-index: 1000;
            box-shadow: 0 10px 25px rgba(0, 118, 206, 0.4);
            transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        #backToTopBtn:hover { transform: translateY(-5px); background: #005da3; }

        /* Custom Scroll Indicator */
        .scroll-tracker {
            position: fixed;
            right: 10.5px;
            top: 10vh;
            height: 80vh;
            width: 6px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            z-index: 9999;
            transition: width 0.3s cubic-bezier(0.4, 0, 0.2, 1), right 0.3s ease, background 0.3s ease;
        }

        /* Grows wider on hover or while dragging */
        .scroll-tracker:hover,
        body.is-dragging .scroll-tracker {
            width: 16px;
            right: 5.5px; /* Adjusted to keep it centered on its axis */
            background: rgba(255, 255, 255, 0.2);
        }

        .scroll-bar {
            position: relative;
            width: 100%;
            height: 0%;
            background: var(--dell-blue);
            border-radius: 10px;
            box-shadow: 0 0 15px var(--dell-blue);
            transition: height 0.1s ease, background 0.4s ease, box-shadow 0.4s ease;
        }

        .scroll-bar.is-upgradable {
            background: var(--neon-green);
            box-shadow: 0 0 20px var(--neon-green);
        }

        /* The Draggable Handle */
        .scroll-handle {
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 10px;
            height: 20px;
            background: #fff;
            border: 2px solid var(--dell-blue);
            border-radius: 10px;
            transition: width 0.2s ease, height 0.2s ease, border-color 0.4s ease, box-shadow 0.4s ease;
            box-shadow: 0 0 10px var(--dell-blue);
        }

        .scroll-bar.is-upgradable .scroll-handle {
            border-color: var(--neon-green);
            box-shadow: 0 0 15px var(--neon-green);
        }

        .scroll-tracker:hover .scroll-handle,
        body.is-dragging .scroll-handle {
            width: 20px; /* Matches diameter for better grab feel */
            height: 30px;
            bottom: -15px;
        }

        /* Background Particles Canvas */
        #particle-canvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-color: var(--bg); /* Background moved here to keep particles visible */
            pointer-events: none;
            will-change: transform;
        }

        /* Navigation Bar for multiple pages */
        .nav-bar {
            background: rgba(0,0,0,0.8);
            padding: 20px 0;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid #111;
        }
        .nav-bar a {
            color: white; text-decoration: none; margin: 0 15px; font-weight: 700; transition: color 0.3s;
        }
        .nav-bar a:hover { color: var(--dell-blue); }
        /* Custom Cursor Style */
        .custom-cursor {
            width: 20px;
            height: 20px;
            border: 2px solid var(--dell-blue);
            background-color: black;
            border-radius: 50%;
            position: fixed;
            pointer-events: none;
            z-index: 10000;
            transform: translate(-50%, -50%);
            transition: background-color 0.1s, border-color 0.1s, opacity 0.2s;
            opacity: 0;
        }
        .custom-cursor.flash {
            background-color: white;
            border-color: white;
        }

        .comp-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 24px;
            margin-bottom: 40px;
            transition: 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            opacity: 0.3;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            cursor: pointer;
        }

        .comp-card.active {
            opacity: 1;
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(0, 118, 206, 0.5);
            transform: scale(1.02) translateY(-5px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.6), 
                        inset 0 0 20px rgba(0, 118, 206, 0.1);
        }

        .upgrade-tag {
            color: var(--neon-green);
            font-weight: 700;
            font-size: 0.9rem;
            display: block;
            margin-bottom: 10px;
        }

        /* SPEC GRID */
        #basic-specs, #exploded-view {
            content-visibility: auto;
            contain-intrinsic-size: 1000px;
        }

        .spec-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-top: 60px;
        }

        .spec-item {
            padding: 30px;
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-left: 4px solid var(--dell-blue);
            transition: 0.3s;
        }
        .spec-item:hover { background: rgba(255, 255, 255, 0.06); transform: translateY(-5px); }

        .spec-item h4 { color: var(--text-dim); text-transform: uppercase; font-size: 0.8rem; margin-bottom: 10px; }
        .spec-item p { font-size: 1.4rem; font-weight: 700; }

        @media (max-width: 900px) {
            .viz-layout { grid-template-columns: 1fr; }
            .sticky-visual { position: relative; top: 0; margin-bottom: 30px; }
        }
    </style>
</head>
<body>

    <div class="nav-bar">
        <a href="Optiplex 7050 sff Updated.html">Home</a>
        <a href="about.html">About Us</a>
        <a href="tictactoe.html">Play Game</a>
        <a href="contact.html">Contact</a>
        <a href="digital-ocarina.html">Ocarina</a>
    </div>

    <canvas id="particle-canvas"></canvas>
    <div class="scroll-tracker">
        <div class="scroll-bar" id="scroll-bar">
            <div class="scroll-handle"></div>
        </div>
    </div>

    <section id="hero">
        <div class="badge">Enterprise Grade x Gaming Ready</div>
        <h1>OptiPlex <span style="color:var(--dell-blue)">7050</span></h1>
        <p style="font-size: 1.5rem; color: var(--text-dim); max-width: 700px; margin-top: 20px;">
            The legend of the SFF. Powered by the Q270 Chipset. Compact enough for the desk, powerful enough for the grind.
        </p>
        <div class="hero-buttons">
            <button class="hero-btn" onclick="document.getElementById('exploded-view').scrollIntoView({behavior: 'smooth'})">Components Description</button>
            <button class="hero-btn" onclick="document.getElementById('basic-specs').scrollIntoView({behavior: 'smooth'})">Spec Overview</button>
            <a href="https://www.dell.com/support/product-details/en-uk/product/optiplex-7050-sff/resources/3dguides" target="_blank" class="hero-btn pulse">Dell Optiplex AR List</a>
            <a href="digital-ocarina.html" class="hero-btn">Digital Ocarina</a>
        </div>
    </section>

    <section id="exploded-view">
        <div class="container">
            <div class="viz-layout">
                <div class="sticky-visual">
                    <img id="main-viz-image" 
                         src="https://images.unsplash.com/photo-1660855551740-4474188debdb?q=80&w=871&auto=format&fit=crop" 
                         alt="Optiplex 7050" 
                         fetchpriority="high" 
                         decoding="async">
                </div>

                <div class="info-scroll">
                    
                    <div class="comp-card active" data-img="https://images.unsplash.com/photo-1739168283356-d1b9bd1c0954?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" data-comp="cpu">
                        <span class="upgrade-tag">Kaby Lake Architecture</span>
                        <h2>7th Gen Intel Core</h2>
                        <p>Support for i7-7700. 4 Cores, 8 Threads of raw speed for programming, virtualization, or homelabs.</p>
                    </div>

                    <div class="comp-card" data-img="https://images.unsplash.com/photo-1562976540-1502c2145186?q=80&w=1000&auto=format&fit=crop" data-comp="ram" data-upgradable="true">
                        <span class="upgrade-tag">Max: 64GB DDR4</span>
                        <h2>4x DIMM Slots</h2>
                        <p>Gen Alpha multitasking or Boomer reliability. Dual-channel support at 2400 MT/s.</p>
                    </div>

                    <div class="comp-card" data-img="https://images.unsplash.com/photo-1591488320449-011701bb6704?q=80&w=1470&auto=format&fit=crop" data-comp="gpu" data-upgradable="true">
                        <span class="upgrade-tag">Gaming Ready</span>
                        <h2>GT 1050 Ti Low Profile</h2>
                        <p>Fits Low-Profile cards perfectly. Turn this office machine into a 1080p gaming beast.</p>
                    </div>

                    <div class="comp-card" data-img="https://plus.unsplash.com/premium_photo-1671439772445-a2c49480394d?q=80&w=870&auto=format&fit=crop" data-comp="connectivity">
                        <span class="upgrade-tag">Connectivity</span>
                        <h2>5+ USB A-C Ports</h2>
                        <p>Modern USB Type-C for fast data, plus legacy HDMI, USB A and Display ports for the essentials.</p>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section id="basic-specs" style="padding: 150px 0 60px 0; background: transparent;">
        <div class="container">
            <h2>The <span style="color:var(--dell-blue)">Blueprint</span></h2>
            <div class="spec-grid">
                <div class="spec-item"><h4>Chipset</h4><p>Intel Q270</p></div>
                <div class="spec-item"><h4>Power</h4><p>180W Bronze PSU</p></div>
                <div class="spec-item"><h4>Storage</h4><p>NVMe M.2 + 3.5" SATA</p></div>
                <div class="spec-item"><h4>OS</h4><p>Windows 10 Pro</p></div>
                <div class="spec-item"><h4>Video</h4><p>2x DisplayPort 1.2</p></div>
                <div class="spec-item"><h4>Security</h4><p>TPM 2.0 Hardened</p></div>
            </div>
            
            <div style="text-align: center; margin-top: 60px;">
                <a href="https://www.hardware-corner.net/desktop-models/Dell-OptiPlex-7050-SFF/" target="_blank" class="hero-btn pulse">For more specs check out this</a>
            </div>
        </div>
    </section>

    <section id="footer-cta" style="padding: 60px 0 150px 0; text-align: center; background: transparent; border-top: 1px solid #111;">
        <div class="container">
            <h2 style="margin-bottom: 20px;">Master the <span style="color:var(--dell-blue)">Small Form Factor</span></h2>
            <p style="color: var(--text-dim); margin-bottom: 40px; font-size: 1.2rem;">The OptiPlex 7050 SFF is more than a workstation—it's a legacy of modular power.</p>
            <div class="badge" style="padding: 15px 35px; cursor: pointer;" onclick="window.scrollTo({top:0, behavior:'smooth'})">Return to Top</div>
        </div>
    </section>

    <button id="backToTopBtn" title="Go to top">↑</button>

    <script>
        // Particle Background Logic
        const canvas = document.getElementById('particle-canvas');
        const ctx = canvas.getContext('2d');
        let particles = [];
        let mouse = { x: null, y: null };
        let isLowPowerMode = false;
        let animationId = null;

        function initPowerManagement() {
            const updatePowerStatus = (battery = null) => {
                const isHidden = document.hidden;
                // Low battery defined as < 20% and not charging
                const isLowBattery = battery ? (battery.level <= 0.2 && !battery.charging) : false;
                
                const prevMode = isLowPowerMode;
                isLowPowerMode = isHidden || isLowBattery;

                // Resume animation if we just exited low power mode
                if (prevMode && !isLowPowerMode && !animationId) {
                    animateParticles();
                }
            };

            document.addEventListener('visibilitychange', () => updatePowerStatus());

            if ('getBattery' in navigator) {
                navigator.getBattery().then(battery => {
                    battery.addEventListener('levelchange', () => updatePowerStatus(battery));
                    battery.addEventListener('chargingchange', () => updatePowerStatus(battery));
                    updatePowerStatus(battery);
                }).catch(() => updatePowerStatus());
            } else { updatePowerStatus(); }
        }

        function initParticles() {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            particles = [];
            const particleCount = Math.min(Math.floor((canvas.width * canvas.height) / 25000), 100);
            for (let i = 0; i < particleCount; i++) {
                particles.push({
                    x: Math.random() * canvas.width,
                    y: Math.random() * canvas.height,
                    vx: (Math.random() - 0.5) * 0.5,
                    vy: (Math.random() - 0.5) * 0.5,
                    size: Math.random() * 1.5 + 0.5
                });
            }
        }

        function animateParticles() {
            if (isLowPowerMode) {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                animationId = null;
                return;
            }

            ctx.clearRect(0, 0, canvas.width, canvas.height);
            
            const connectionLimitSq = 150 * 150;
            ctx.fillStyle = 'rgba(0, 118, 206, 0.4)';
            
            particles.forEach(p => {
                // Mouse Interaction: Push particles away
                if (mouse.x !== null && mouse.y !== null) {
                    const dx = p.x - mouse.x;
                    const dy = p.y - mouse.y;
                    const distSq = dx * dx + dy * dy;
                    const forceRadius = 120;
                    if (distSq < forceRadius * forceRadius) {
                        const force = (forceRadius - Math.sqrt(distSq)) / forceRadius;
                        p.x += (dx / Math.sqrt(distSq)) * force * 5;
                        p.y += (dy / Math.sqrt(distSq)) * force * 5;
                    }
                }

                p.x += p.vx;
                p.y += p.vy;

                if (p.x < 0 || p.x > canvas.width) p.vx *= -1;
                if (p.y < 0 || p.y > canvas.height) p.vy *= -1;

                ctx.beginPath();
                ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
                ctx.fill();
            });
            
            // Draw faint connections
            ctx.strokeStyle = 'rgba(0, 118, 206, 0.1)';
            ctx.lineWidth = 0.5;
            ctx.beginPath();
            for (let i = 0; i < particles.length; i++) {
                for (let j = i + 1; j < particles.length; j++) {
                    const dx = particles[i].x - particles[j].x;
                    const dy = particles[i].y - particles[j].y;
                    const distSq = dx * dx + dy * dy;
                    if (distSq < connectionLimitSq) {
                        ctx.moveTo(particles[i].x, particles[i].y);
                        ctx.lineTo(particles[j].x, particles[j].y);
                    }
                }
            }
            ctx.stroke();
            animationId = requestAnimationFrame(animateParticles);
        }

        window.addEventListener('resize', initParticles);
        initPowerManagement();
        initParticles();
        animateParticles();

        // Custom Cursor Implementation
        const cursor = document.createElement('div');
        cursor.classList.add('custom-cursor');
        document.body.appendChild(cursor);

        document.addEventListener('mousemove', (e) => {
            cursor.style.left = e.clientX + 'px';
            cursor.style.top = e.clientY + 'px';
            cursor.style.opacity = '1';
            mouse.x = e.clientX;
            mouse.y = e.clientY;
        });

        document.addEventListener('mousedown', () => cursor.classList.add('flash'));
        document.addEventListener('mouseup', () => cursor.classList.remove('flash'));

        // Prevent default drag behavior to stop system cursor from appearing
        window.addEventListener('dragstart', (e) => e.preventDefault());

        document.addEventListener('mouseleave', () => {
            cursor.style.opacity = '0';
            mouse.x = null;
            mouse.y = null;
        });

        const cards = document.querySelectorAll('.comp-card');
        const mainImg = document.getElementById('main-viz-image');
        const backBtn = document.getElementById('backToTopBtn');
        let transitionTimeout;
        const scrollTracker = document.querySelector('.scroll-tracker');
        const scrollBar = document.getElementById('scroll-bar');
        let isDraggingScroll = false;
        let scrollRequest;
        let trackerRect;

        // Draggable Scroll Logic
        scrollTracker.addEventListener('mousedown', (e) => {
            isDraggingScroll = true;
            trackerRect = scrollTracker.getBoundingClientRect();
            document.body.classList.add('is-dragging');
            document.documentElement.classList.add('no-smooth');
            // Instantly jump handle to click position
            updateScrollFromMouse(e);
        });

        window.addEventListener('mousemove', (e) => {
            if (isDraggingScroll) {
                if (scrollRequest) cancelAnimationFrame(scrollRequest);
                scrollRequest = requestAnimationFrame(() => updateScrollFromMouse(e));
            }
        });

        window.addEventListener('mouseup', () => {
            isDraggingScroll = false;
            document.body.classList.remove('is-dragging');
            document.documentElement.classList.remove('no-smooth');
        });

        function updateScrollFromMouse(e) {
            if (!trackerRect) return;
            let relativeY = e.clientY - trackerRect.top;
            relativeY = Math.max(0, Math.min(relativeY, trackerRect.height));
            const scrollPercentage = relativeY / trackerRect.height;
            const totalScrollableHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            
            scrollBar.style.height = (scrollPercentage * 100) + "%";
            window.scrollTo({
                top: scrollPercentage * totalScrollableHeight,
                behavior: 'auto'
            });
        }

        // Handle Scroll for Back to Top Visibility
        window.addEventListener('scroll', () => {
            // Update Custom Scroll Bar
            const winScroll = window.scrollY || document.documentElement.scrollTop;
            const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrolled = height > 0 ? (winScroll / height) * 100 : 0;
            
            if (!isDraggingScroll) {
                scrollBar.style.height = scrolled + "%";
            }
            
            backBtn.style.display = window.scrollY > 400 ? 'flex' : 'none';
            handleComponentActivity();
        }, { passive: true });

        backBtn.onclick = () => window.scrollTo({ top: 0, behavior: 'smooth' });

        let isManualScroll = false;
        let manualScrollTimeout;

        function updateVisuals(card) {
            const newSrc = card.getAttribute('data-img');
            
            // Only update if it's a different component to prevent flickering
            if (card.classList.contains('active') && mainImg.src.includes(newSrc)) return;

            cards.forEach(c => c.classList.remove('active'));
            card.classList.add('active');

            if (card.dataset.upgradable === 'true') {
                scrollBar.classList.add('is-upgradable');
            } else {
                scrollBar.classList.remove('is-upgradable');
            }

            const visualContainer = document.querySelector('.sticky-visual');
            
            // Removed transition timeout and blur effects to prevent skipping during fast scrolls
            mainImg.src = newSrc;
            mainImg.style.opacity = '1';
            mainImg.style.filter = 'drop-shadow(0 0 20px rgba(0, 118, 206, 0.6))';
            visualContainer.classList.remove('zooming');
            visualContainer.classList.add('zooming');
        }

        function handleComponentActivity() {
            // Disable auto-detection during smooth clicks
            if (isManualScroll) return;

            const viewportCenter = window.innerHeight / 2;
            let closestCard = null;
            let minDistance = Infinity;

            // Find the card whose center is closest to the viewport center
            cards.forEach(card => {
                const rect = card.getBoundingClientRect();
                const cardCenter = rect.top + rect.height / 2;
                const distance = Math.abs(viewportCenter - cardCenter);

                if (distance < minDistance) {
                    minDistance = distance;
                    closestCard = card;
                }
            });

            if (closestCard) {
                updateVisuals(closestCard);
            }
        }

        cards.forEach(card => {
            card.addEventListener('click', () => {
                isManualScroll = true;
                updateVisuals(card); // Trigger visual update immediately on click
                card.scrollIntoView({ behavior: 'smooth', block: 'center' });
                
                // Re-enable observer after smooth scroll completes
                clearTimeout(manualScrollTimeout);
                manualScrollTimeout = setTimeout(() => {
                    isManualScroll = false;
                }, 800);
            });
        });

        // Run once on load to set initial state
        handleComponentActivity();
    </script>
</body>
</html> 
