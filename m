Return-Path: <devicetree-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/7] PM / Domains: Add DT bindings for the R-Car System Controller
Date: Wed,  9 Mar 2016 20:18:35 +0100
Message-Id: <1457551122-21838-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

This patch series introduces DT bindings for the R-Car System
Controller.

Changes compared to v2:
  - Move power area hierarchy from DT to C (cfr. DT bindings for Renesas
    CPG/MSSR), and switch to "#power-domain-cells = <1>",
  - Drop fallback compatibility strings, as the bindings are
    SoC-specific,
  - Drop power area A3SH on R-Car H3, as it's no longer
    documented in the datasheet, and touching it seems to crash SYSC,
  - Add an "always-on" power area on R-Car H3,
  - Rename from renesas,sysc-rcar.txt to renesas,rcar-sysc.txt,
  - Extract bindings into a separate series (was "[PATCH/RFC v2 00/11]
    ARM/arm64: renesas: Add SYSC PM Domain DT Support",
    http://www.spinics.net/lists/arm-kernel/msg483199.html).

Changes compared to v1:
  - Add R-Car H3 (r8a7795) support,
  - Use "renesas,<type>-sysc" instead of "renesas,sysc-<type>",
  - Add fallback compatibility strings for R-Car Gen2 and Gen3.

Thanks for your comments!

Geert Uytterhoeven (7):
  PM / Domains: Add DT bindings for the R-Car System Controller
  soc: renesas: Add r8a7779 SYSC PM Domain Binding Definitions
  soc: renesas: Add r8a7790 SYSC PM Domain Binding Definitions
  soc: renesas: Add r8a7791 SYSC PM Domain Binding Definitions
  soc: renesas: Add r8a7793 SYSC PM Domain Binding Definitions
  soc: renesas: Add r8a7794 SYSC PM Domain Binding Definitions
  soc: renesas: Add r8a7795 SYSC PM Domain Binding Definitions

 .../bindings/power/renesas,rcar-sysc.txt           | 48 ++++++++++++++++++++++
 include/dt-bindings/power/r8a7779-sysc.h           | 25 +++++++++++
 include/dt-bindings/power/r8a7790-sysc.h           | 31 ++++++++++++++
 include/dt-bindings/power/r8a7791-sysc.h           | 23 +++++++++++
 include/dt-bindings/power/r8a7793-sysc.h           | 27 ++++++++++++
 include/dt-bindings/power/r8a7794-sysc.h           | 23 +++++++++++
 include/dt-bindings/power/r8a7795-sysc.h           | 42 +++++++++++++++++++
 7 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
 create mode 100644 include/dt-bindings/power/r8a7779-sysc.h
 create mode 100644 include/dt-bindings/power/r8a7790-sysc.h
 create mode 100644 include/dt-bindings/power/r8a7791-sysc.h
 create mode 100644 include/dt-bindings/power/r8a7793-sysc.h
 create mode 100644 include/dt-bindings/power/r8a7794-sysc.h
 create mode 100644 include/dt-bindings/power/r8a7795-sysc.h

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
