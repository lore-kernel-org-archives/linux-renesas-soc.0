Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:57198 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935439AbcKWMkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 07:40:04 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm@kernel.org
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] Renesas RZ/G1M and RZ/G1E CPG Core Clock Definitions
Date: Wed, 23 Nov 2016 13:39:58 +0100
Message-Id: <1479904798-12768-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Olof, Kevin, Arnd,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/rzg-clock-defs-tag1

for you to fetch changes up to 1fa8a875df6b8aa864f6c4f2b65dbc2ed477b859:

  clk: renesas: Add r8a7745 CPG Core Clock Definitions (2016-11-07 15:13:30 +0100)

----------------------------------------------------------------
Renesas RZ/G1M and RZ/G1E CPG Core Clock Definitions

This contains clock definitions shared by clock drivers and DTS files,
and is provided as a dependency for the latter.

This has already been pulled by Stephen as part of a larger pull
request, and is present in clk/clk-next, together with the corresponding
clock drivers.

Thanks for pulling!
----------------------------------------------------------------
Sergei Shtylyov (2):
      clk: renesas: Add r8a7743 CPG Core Clock Definitions
      clk: renesas: Add r8a7745 CPG Core Clock Definitions

 include/dt-bindings/clock/r8a7743-cpg-mssr.h | 43 +++++++++++++++++++++++++++
 include/dt-bindings/clock/r8a7745-cpg-mssr.h | 44 ++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 include/dt-bindings/clock/r8a7743-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7745-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
