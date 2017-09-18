Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <damm+renesas@opensource.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 0/7] clocksource: sh_cmt: Update driver for DT binding rework
Date: Mon, 18 Sep 2017 15:46:40 +0200
Message-Id: <1505742407-31576-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Daniel, Thomas, Rob, Mark, Magnus,

This patch series updates the sh_cmt clocksource driver for the recent DT
binding rework that was merged in v4.14-rc1.

This series is an evolutionary improvement of Magnus Damm's series "[PATCH
v2 00/11] clocksource: sh_cmt: DT binding rework V2".
It complements Magnus' series "[PATCH v3 00/06] clocksource: sh_cmt: DT 
binding rework V3" and "[PATCH v4 00/06] clocksource: sh_cmt: DT binding 
rework V4", which included DT binding updates only.

  - Patch 1 fixes wrong vendor/soc ordering in the SoC-specific compatible
    values  (This issue was raised during review before, but was not
    addressed in later iterations of the DT binding rework.  Oh well,
    things like that happen when there's more than 2 years between initial
    submission and acceptance...),
  - Patches 2 to 6 implement the updated DT bindings, as already accepted
    upstream, and amended in patch 1.
  - Patch 7 is a small cleanup.

Changes compared to v2:
  - Take over from Magnus,
  - Drop DT binding updates that were revised and accepted upstream,
  - Fix SoC-specific compatible values,
  - Change channels_mask from "unsigned long" to "unsigned int,
  - Remove support for "renesas,cmt-32*",
  - Mark "renesas,cmt-48-gen2" deprecated,
  - Remove unused "renesas,channels-mask" handling,
  - Use of_device_get_match_data() helper.

Thanks!

Geert Uytterhoeven (5):
  dt-bindings: timer: renesas,cmt: Fix SoC-specific compatible values
  clocksource: sh_cmt: Remove support for "renesas,cmt-32*"
  clocksource: sh_cmt: Mark "renesas,cmt-48-gen2" deprecated
  clocksource: sh_cmt: Remove unused "renesas,channels-mask" handling
  clocksource: sh_cmt: Use of_device_get_match_data() helper

Magnus Damm (2):
  clocksource: sh_cmt: Use 0x3f mask for SH_CMT_48BIT case
  clocksource: sh_cmt: Support separate R-Car Gen2 CMT0/1

 .../devicetree/bindings/timer/renesas,cmt.txt      | 24 +++----
 drivers/clocksource/sh_cmt.c                       | 76 ++++++++++------------
 2 files changed, 45 insertions(+), 55 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
