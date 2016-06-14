Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:60245 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752576AbcFNOP3 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 10:15:29 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] ARM: dts: renesas: Update console parameters
Date: Tue, 14 Jun 2016 16:15:19 +0200
Message-Id: <1465913724-26172-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Simon, Magnus,

This patch series updates the console parameters in the DTSes for
various Renesas ARM boards.

  - For all of them, the serial port config is added to
    chosen/stdout-path, as per current best practices,
  - On some boards (armadillo, genmai, kzm9g), the console alias is
    changed to "serial0", for consistency with other boards, and to
    match current best practices (the first serial port should be called
    "serial0", unless labeled otherwise).
    This does mean the device changes its name to /dev/ttySC0 in
    userspace.  I believe it's OK to make this change, as we did the
    same for koelsch, lager, and marzen before.
  - On some boards (armadillo, kzm9d, kzm9g), "console=" parameters are
    removed from the kernel command lines, as they're no longer needed
    for DT-only platforms.
    Beware leftover parameters in bootargs environment variables!
  - On kzm9d, a console alias is added.

Changes compared to v1:
  - Drop patches that have been applied,
  - Change one-line summary prefixes to match current arm-soc practices,
  - Drop name changes of pfc subnodes,
  - Reword patch descriptions.

Dependencies:
  - Due to dropping the name changes of pfc subnodes, this has an
    esthetic (never realized before this does exist ;-) dependency on
    "[PATCH 00/19] ARM: dts: renesas: Name pfc subnodes after device
    names".

Tested on all five affected boards (some with remote access), to verify
there is no other impact to userspace than the change of the console
device to /dev/ttySC0, which may be handled automatically, depending on
your userspace.

Thanks for applying!

Geert Uytterhoeven (5):
  ARM: dts: armadillo800eva: Update console parameters
  ARM: dts: genmai: Update console parameters
  ARM: dts: marzen: Add serial port config to chosen/stdout-path
  ARM: dts: kzm9d: Update console parameters
  ARM: dts: kzm9g: Update console parameters

 arch/arm/boot/dts/emev2-kzm9d.dts             | 8 ++++++--
 arch/arm/boot/dts/r7s72100-genmai.dts         | 4 ++--
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 6 +++---
 arch/arm/boot/dts/r8a7779-marzen.dts          | 2 +-
 arch/arm/boot/dts/sh73a0-kzm9g.dts            | 6 +++---
 5 files changed, 15 insertions(+), 11 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
