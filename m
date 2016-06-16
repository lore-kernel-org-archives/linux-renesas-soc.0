Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:38277 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751136AbcFPK1t (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 06:27:49 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 00/13] ARM: shmobile: APMU DT support via SMP Enable method
Date: Thu, 16 Jun 2016 12:27:29 +0200
Message-Id: <1466072862-28030-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series, which I took over from Magnus and extended, adds DT
support for the APMU hardware commonly found in Renesas R-Car Gen2 SoCs.
Without these patches the APMU gets configured through data expressed in
C, and with this series applied it is possible to describe the APMU
configuration in DT and let the enable method point out that the APMU
should be used.

  - Patch 1 documents DT support to describe that the APMU hardware is
    needed for SMP operation,
  - Patch 2 fixes a bug in the rcar-sysc driver that was harmless
    before,
  - Patches 3-5 prepare for handling SYSC interrupt configuration purely
    from DT in the rcar-sysc driver for new SoCs, while preserving
    backward compatibility with old DTBs for R-Car H1, H2, and M2-W,
  - Patch 6 is a small cleanup for CONFIG_SMP=n builds,
  - Patch 7 adds DT support to the APMU driver together with enabling
    use of the enable-method way to describe that the APMU hardware is
    needed for SMP operation,
  - Patches 8-10 make sure that during run-time, if the APMU is
    installed via the DT enable-method then it will not be overriden by
    older non-DT configuration.  To avoid breaking support for older
    DTBs out in the wild these patches keep the older existing C code
    APMU configuration as-is.
  - Patches 11 and 12 update the r8a7790 and r8a7791 DTSes to describe
    the APMU hardware,
  - Patch 13 adds r8a7793 SMP support using the new APMU DT interface.

Magnus suggested making APMU DT configuration mandatory for SMP
operation on newer SoCs and that we keep the old APMU support code in
place for a good number of kernel releases or until we can identify a
couple of major reasons good enough to force a DTB update on the end
users.

In the future r8a7792 and r8a7794 SMP support may be added by just
updating the DTSes similar to patch 13 - without any C-based SMP code
and fallback.

Changes compared to v3 (more details in the individual patches):
  - Use "renesas,<soctype>-apmu" instead of "renesas,apmu-<soctype>",
  - Handle SYSC interrupt configuration purely from DT in the rcar-sysc
    driver for new SoCs,
  - Dropped patch [PATCH v3 04/09] "ARM: shmobile: r8a7793 boot address
    update":
      - Hardcoded SYSCIER value is no longer needed due to the above,
      - ICRAM1 is already used since "ARM: shmobile: rcar-gen2: Use
	ICRAM1 for jump stub on all SoCs",
  - Fix CONFIG_SMP=n build.

This series is against renesas-devel-20160616-v4.7-rc3.
For testing, it's also available in the topic/apmu-dt-v4 branch
of https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git.

This has been tested on r8a7779/marzen, r8a7790/lager, r8a7791/koelsch,
and r8a7793/gose.

Thanks!

Geert Uytterhoeven (5):
  soc: renesas: rcar-sysc: Fix uninitialized error code in
    rcar_sysc_pd_init()
  soc: renesas: rcar-sysc: Make rcar_sysc_init() init the PM domains
  soc: renesas: rcar-sysc: Move SYSC interrupt config to rcar-sysc
    driver
  soc: renesas: rcar-sysc: Improve SYSC interrupt config in legacy
    wrapper
  ARM: shmobile: apmu: Move #ifdef CONFIG_SMP to cover more functions

Magnus Damm (8):
  devicetree: bindings: Renesas APMU and SMP Enable method
  ARM: shmobile: apmu: Add APMU DT support via Enable method
  ARM: shmobile: smp: Add function to prioritize DT SMP
  ARM: shmobile: r8a7790: Prioritize DT APMU support
  ARM: shmobile: r8a7791: Prioritize DT APMU support
  ARM: dts: r8a7790: Add APMU nodes
  ARM: dts: r8a7791: Add APMU node
  ARM: dts: r8a7793: Add APMU node and second CPU core

 Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
 .../devicetree/bindings/power/renesas,apmu.txt     | 31 +++++++
 arch/arm/boot/dts/r8a7790.dtsi                     | 13 +++
 arch/arm/boot/dts/r8a7791.dtsi                     |  7 ++
 arch/arm/boot/dts/r8a7793.dtsi                     | 14 ++++
 arch/arm/mach-shmobile/common.h                    |  1 +
 arch/arm/mach-shmobile/platsmp-apmu.c              | 94 ++++++++++++++++++++--
 arch/arm/mach-shmobile/platsmp.c                   |  6 ++
 arch/arm/mach-shmobile/pm-r8a7779.c                |  6 +-
 arch/arm/mach-shmobile/pm-rcar-gen2.c              |  6 +-
 arch/arm/mach-shmobile/setup-r8a7790.c             |  1 +
 arch/arm/mach-shmobile/setup-r8a7791.c             |  1 +
 drivers/soc/renesas/rcar-sysc.c                    | 39 ++++++---
 include/linux/soc/renesas/rcar-sysc.h              |  2 +-
 14 files changed, 196 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.txt

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
