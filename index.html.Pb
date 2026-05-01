<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Solutions Specialist | The Digital Native</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">

    <style>
        * { 
            margin: 0; 
            padding: 0; 
            box-sizing: border-box; 
        }

        /* Hide system cursor only on devices that support a fine pointer (mouse) */
        @media (pointer: fine) {
            * {
                cursor: none !important;
            }
        }

        html { scrollbar-width: none; -ms-overflow-style: none; scroll-behavior: smooth; }
        html::-webkit-scrollbar { display: none; }

        html.no-smooth { scroll-behavior: auto !important; }
        body.is-dragging { user-select: none; }

        :root {
            --bg: #050505;
            --ai-cyan: #00f2ff;
            --ai-violet: #7000ff;
            --glass: rgba(255, 255, 255, 0.05);
            --text-main: #ffffff;
            --text-dim: #b0b0b0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg);
            color: var(--text-main);
            overflow-x: hidden;
        }

        h1 { font-size: clamp(3rem, 8vw, 5rem); font-weight: 900; letter-spacing: -2px; line-height: 1; }
        .gradient-text { background: linear-gradient(90deg, var(--ai-cyan), var(--ai-violet)); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; }

        .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }

        /* NAV */
        .nav-bar {
            padding: 20px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            background: rgba(5, 5, 5, 0.8);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-links {
            display: flex;
            gap: 40px;
        }

        .nav-link {
            color: var(--text-dim);
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: 0.3s;
        }

        .nav-link:hover {
            color: var(--ai-cyan);
        }

        .menu-toggle {
            display: none;
            flex-direction: column;
            gap: 6px;
            background: none;
            border: none;
            padding: 10px;
        }

        .bar {
            width: 25px;
            height: 2px;
            background: white;
            transition: 0.3s;
        }

        /* HERO */
        #hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .hero-btn {
            background: white;
            color: black;
            padding: 18px 40px;
            border-radius: 40px;
            font-weight: 900;
            text-decoration: none;
            text-transform: uppercase;
            transition: 0.3s;
            box-shadow: 0 0 30px rgba(0, 242, 255, 0.2);
            margin-top: 30px;
        }

        .hero-btn:hover {
            transform: scale(1.05);
            background: var(--ai-cyan);
            box-shadow: 0 0 50px rgba(0, 242, 255, 0.4);
        }

        /* SCROLL SECTION (Like your Dell code) */
        #interactive-services { padding: 100px 0; }
        .viz-layout { display: grid; grid-template-columns: 1fr 1fr; gap: 50px; }

        .sticky-visual {
            position: sticky;
            top: 150px;
            height: 450px;
            background: #111;
            border-radius: 30px;
            border: 1px solid #222;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .sticky-visual img {
            width: 90%;
            height: 90%;
            object-fit: cover;
            border-radius: 20px;
            transition: 0.8s cubic-bezier(0.2, 1, 0.3, 1);
        }

        .info-card {
            padding: 60px;
            background: rgba(255, 255, 255, 0.02);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 30px;
            margin-bottom: 50px;
            opacity: 0.2;
            cursor: pointer;
            transition: 0.5s;
        }

        .info-card.active {
            opacity: 1;
            border-color: var(--ai-cyan);
            transform: scale(1.02);
            background: rgba(0, 242, 255, 0.03);
        }

        /* CUSTOM CURSOR */
        .custom-cursor {
            width: 15px;
            height: 15px;
            border: 2px solid var(--ai-cyan);
            border-radius: 50%;
            position: fixed;
            pointer-events: none;
            z-index: 11000;
            transform: translate(-50%, -50%);
            mix-blend-mode: difference;
        }

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

        .scroll-tracker:hover,
        body.is-dragging .scroll-tracker {
            width: 16px;
            right: 5.5px;
            background: rgba(255, 255, 255, 0.2);
        }

        .scroll-bar {
            position: relative;
            width: 100%;
            height: 0%;
            background: linear-gradient(to bottom, var(--ai-cyan), var(--ai-violet));
            border-radius: 10px;
            box-shadow: 0 0 15px var(--ai-cyan);
            transition: height 0.1s ease, background 0.4s ease, box-shadow 0.4s ease;
        }

        .scroll-handle {
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 10px;
            height: 20px;
            background: #fff;
            border: 2px solid var(--ai-cyan);
            border-radius: 10px;
        }

        /* Back to Top Button */
        #back-to-top {
            position: fixed;
            bottom: 30px;
            right: 40px;
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--ai-cyan), var(--ai-violet));
            border: none;
            border-radius: 50%;
            color: white;
            font-size: 1.5rem;
            font-weight: 900;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1001;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 0 20px rgba(0, 242, 255, 0.3);
        }

        #back-to-top.show {
            opacity: 1;
            visibility: visible;
        }

        #back-to-top:hover {
            transform: scale(1.1);
            box-shadow: 0 0 30px rgba(0, 242, 255, 0.5);
        }

        /* PARTICLES */
        #particle-canvas {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: -1;
            pointer-events: none;
        }

        /* FORM */
        .contact-form {
            max-width: 600px;
            margin: 100px auto;
            background: #111;
            padding: 40px;
            border-radius: 30px;
            border: 1px solid #222;
        }

        input, textarea {
            width: 100%;
            padding: 15px;
            background: #050505;
            border: 1px solid #333;
            color: white;
            margin-bottom: 20px;
            border-radius: 10px;
            outline: none;
        }

        .mobile-nav-btn { display: none; }

        /* MOBILE RESPONSIVENESS */
        @media (max-width: 900px) {
            h1 { font-size: 3rem; }
            
            .viz-layout { 
                grid-template-columns: 1fr; 
                gap: 20px;
            }

            .sticky-visual {
                position: sticky;
                top: 80px;
                height: 250px;
                z-index: 10;
                background: var(--bg);
                margin-bottom: 30px;
            }

            .info-scroll-wrapper {
                position: relative;
                width: 100%;
            }

            .mobile-nav-btn {
                display: flex;
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                width: 40px;
                height: 40px;
                background: rgba(5, 5, 5, 0.8);
                border: 1px solid var(--ai-cyan);
                border-radius: 50%;
                color: var(--ai-cyan);
                z-index: 20;
                align-items: center;
                justify-content: center;
                font-weight: 900;
                backdrop-filter: blur(5px);
            }
            .mobile-nav-btn.prev { left: -10px; }
            .mobile-nav-btn.next { right: -10px; }

            .info-scroll {
                display: flex;
                overflow-x: auto;
                scroll-snap-type: x mandatory;
                gap: 15px;
                padding: 10px 0 20px 0;
                scrollbar-width: none;
                -ms-overflow-style: none;
            }
            .info-scroll::-webkit-scrollbar { display: none; }

            .info-card {
                flex: 0 0 85%;
                scroll-snap-align: center;
                margin-bottom: 0;
                padding: 25px;
                opacity: 0.6; /* Keep cards mostly visible on mobile */
            }

            .custom-cursor, .scroll-tracker {
                display: none; /* Mobile users use touch; custom cursors/bars often feel clunky */
            }

            .hero-btn {
                width: 100%;
                text-align: center;
            }

            .menu-toggle {
                display: flex;
            }

            .nav-links {
                position: fixed;
                top: 0;
                right: -100%;
                width: 100%;
                height: 100vh;
                background: rgba(5, 5, 5, 0.98);
                backdrop-filter: blur(20px);
                flex-direction: column;
                justify-content: center;
                align-items: center;
                transition: 0.5s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .nav-links.active {
                right: 0;
            }

            .nav-link {
                font-size: 1.5rem;
                margin: 20px 0;
            }

            .menu-toggle.active .bar:nth-child(1) { transform: translateY(8px) rotate(45deg); }
            .menu-toggle.active .bar:nth-child(2) { opacity: 0; }
            .menu-toggle.active .bar:nth-child(3) { transform: translateY(-8px) rotate(-45deg); }
        }
    </style>
</head>
<body>

    <canvas id="particle-canvas"></canvas>
    <div class="custom-cursor" id="cursor"></div>

    <div class="scroll-tracker">
        <div class="scroll-bar" id="scroll-bar">
            <div class="scroll-handle"></div>
        </div>
    </div>

    <button id="back-to-top" title="Go to top">↑</button>

    <nav class="nav-bar">
        <div class="container nav-container">
            <div class="nav-logo">AI<span class="gradient-text">.UK</span></div>
            
            <div class="nav-links" id="nav-links">
                <a href="#hero" class="nav-link">Home</a>
                <a href="#interactive-services" class="nav-link">Services</a>
                <a href="#contact" class="nav-link">Contact</a>
            </div>

            <button class="menu-toggle" id="menu-toggle">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </button>
        </div>
    </nav>

    <section id="hero">
        <div style="text-transform: uppercase; letter-spacing: 5px; color: var(--ai-cyan); font-weight: 700; margin-bottom: 20px;">Digital Native • AI Specialist</div>
        <h1>Next-Gen <span class="gradient-text">Web Systems</span></h1>
        <p style="color: var(--text-dim); max-width: 600px; margin-top: 20px; font-size: 1.2rem;">
            I don't just build websites. I deploy AI agents that automate your booking, lead capture, and growth. 
        </p>
        <a href="#contact" class="hero-btn">Initialize Partnership</a>
    </section>

    <section id="interactive-services">
        <div class="container">
            <div class="viz-layout">
                <div class="sticky-visual">
                    <img id="main-image" src="https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=1000&auto=format&fit=crop" alt="AI Interface">
                </div>

                <div class="info-scroll-wrapper">
                    <button class="mobile-nav-btn prev" id="mobile-prev">←</button>
                    <div class="info-scroll">
                        <div class="info-card active" data-img="https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=1000&auto=format&fit=crop">
                            <h2 class="gradient-text">AI Architect</h2>
                            <p>Leveraging high-end models like Gemini 1.5 and GPT-4 to build interfaces that think.</p>
                        </div>

                        <div class="info-card" data-img="https://images.unsplash.com/photo-1639322537228-f710d846310a?q=80&w=1000&auto=format&fit=crop">
                            <h2 class="gradient-text">Autonomous Booking</h2>
                            <p>Eliminate manual admin. I build systems that handle your calendar 24/7 with zero friction.</p>
                        </div>

                        <div class="info-card" data-img="https://images.unsplash.com/photo-1614850523296-d8c1af93d400?q=80&w=1000&auto=format&fit=crop">
                            <h2 class="gradient-text">Managed Growth</h2>
                            <p>Monthly AI-driven SEO and content updates to keep your business at the top of the search.</p>
                        </div>
                    </div>
                    <button class="mobile-nav-btn next" id="mobile-next">→</button>
                </div>
            </div>
        </div>
    </section>

    <section id="contact" class="container">
        <div class="contact-form">
            <h2 style="margin-bottom: 30px; font-size: 2rem;">Secure Your <span class="gradient-text">Strategy Call</span></h2>
            <form action="https://formspree.io/f/your-id-here" method="POST">
                <input type="text" name="name" placeholder="Business Name" required>
                <input type="email" name="email" placeholder="Contact Email" required>
                <textarea name="message" rows="5" placeholder="Tell me about your business goals..."></textarea>
                <button type="submit" class="hero-btn" style="width: 100%; border: none; cursor: none;">Transmitting Data...</button>
            </form>
        </div>
    </section>

    <script>
        // Custom Cursor
        const cursor = document.getElementById('cursor');
        document.addEventListener('mousemove', (e) => {
            cursor.style.left = e.clientX + 'px';
            cursor.style.top = e.clientY + 'px';
        });

        // Particle System
        const canvas = document.getElementById('particle-canvas');
        const ctx = canvas.getContext('2d');
        let particles = [];

        function initParticles() {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            particles = [];
            for(let i=0; i<60; i++) {
                particles.push({
                    x: Math.random() * canvas.width,
                    y: Math.random() * canvas.height,
                    vx: (Math.random() - 0.5) * 0.3,
                    vy: (Math.random() - 0.5) * 0.3,
                    size: Math.random() * 2
                });
            }
        }

        function animate() {
            ctx.clearRect(0,0, canvas.width, canvas.height);
            ctx.fillStyle = 'rgba(0, 242, 255, 0.3)';
            particles.forEach(p => {
                p.x += p.vx; p.y += p.vy;
                if(p.x < 0 || p.x > canvas.width) p.vx *= -1;
                if(p.y < 0 || p.y > canvas.height) p.vy *= -1;
                ctx.beginPath();
                ctx.arc(p.x, p.y, p.size, 0, Math.PI*2);
                ctx.fill();
            });
            requestAnimationFrame(animate);
        }

        initParticles();
        animate();

        // Scroll Logic for Sticky Visuals
        const cards = document.querySelectorAll('.info-card');
        const mainImg = document.getElementById('main-image');
        let isManualScroll = false;
        let manualScrollTimeout;

        function updateActiveCard(card) {
            cards.forEach(c => c.classList.remove('active'));
            card.classList.add('active');
            mainImg.src = card.dataset.img;
        }

        window.addEventListener('scroll', () => {
            if (isManualScroll) return;
            const center = window.innerHeight / 2;
            cards.forEach(card => {
                const rect = card.getBoundingClientRect();
                if(rect.top < center && rect.bottom > center) {
                    updateActiveCard(card);
                }
            });
        });

        infoScroll.addEventListener('scroll', () => {
            if (window.innerWidth > 900 || isManualScroll) return;
            const scrollCenter = infoScroll.scrollLeft + infoScroll.offsetWidth / 2;
            
            cards.forEach(card => {
                const cardLeft = card.offsetLeft;
                const cardRight = cardLeft + card.offsetWidth;
                if (scrollCenter >= cardLeft && scrollCenter <= cardRight) {
                    updateActiveCard(card);
                }
            });
        });

        cards.forEach(card => {
            card.addEventListener('click', () => {
                isManualScroll = true;
                updateActiveCard(card);
                const scrollOptions = window.innerWidth <= 900 
                    ? { behavior: 'smooth', inline: 'center', block: 'nearest' }
                    : { behavior: 'smooth', block: 'center' };
                card.scrollIntoView(scrollOptions);
                clearTimeout(manualScrollTimeout);
                manualScrollTimeout = setTimeout(() => { isManualScroll = false; }, 1000);
            });
        });

        // Draggable Scroll Logic
        const scrollTracker = document.querySelector('.scroll-tracker');
        const scrollBar = document.getElementById('scroll-bar');
        let isDraggingScroll = false;
        let scrollRequest;
        let trackerRect;

        scrollTracker.addEventListener('mousedown', (e) => {
            isDraggingScroll = true;
            trackerRect = scrollTracker.getBoundingClientRect();
            document.body.classList.add('is-dragging');
            document.documentElement.classList.add('no-smooth');
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

        window.addEventListener('scroll', () => {
            const winScroll = window.scrollY || document.documentElement.scrollTop;
            const height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrolled = height > 0 ? (winScroll / height) * 100 : 0;
            
            if (!isDraggingScroll) {
                scrollBar.style.height = scrolled + "%";
            }

            // Back to Top Visibility Logic
            const backToTopBtn = document.getElementById('back-to-top');
            if (winScroll > 500) {
                backToTopBtn.classList.add('show');
            } else {
                backToTopBtn.classList.remove('show');
            }
        }, { passive: true });

        // Back to Top Click Action
        document.getElementById('back-to-top').addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });

        // Mobile Menu Toggle
        const menuToggle = document.getElementById('menu-toggle');
        const navLinks = document.getElementById('nav-links');

        menuToggle.addEventListener('click', () => {
            menuToggle.classList.toggle('active');
            navLinks.classList.toggle('active');
            document.body.style.overflow = navLinks.classList.contains('active') ? 'hidden' : '';
        });

        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', () => {
                menuToggle.classList.remove('active');
                navLinks.classList.remove('active');
                document.body.style.overflow = '';
            });
        });

        // Mobile Nav Buttons Scroll Logic
        const prevBtn = document.getElementById('mobile-prev');
        const nextBtn = document.getElementById('mobile-next');
        
        prevBtn.addEventListener('click', () => {
            infoScroll.scrollBy({ left: -infoScroll.offsetWidth * 0.8, behavior: 'smooth' });
        });
        nextBtn.addEventListener('click', () => {
            infoScroll.scrollBy({ left: infoScroll.offsetWidth * 0.8, behavior: 'smooth' });
        });
    </script>
</body>
</html>
