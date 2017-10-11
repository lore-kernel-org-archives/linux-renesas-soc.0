Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:50936 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753154AbdJKLua (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 07:50:30 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] drivers: firmware: psci: Extract psci_is_available() helper
Date: Wed, 11 Oct 2017 10:03:00 +0200
Message-Id: <1507708982-12336-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Mark, Lorenzo,

PSCI support may be disabled at build time (by configuration) or at
run-time (PSCI firmware not present).  While CONFIG_ARM_PSCI_FW can be
used to check for build time enablement, there is currently no simple
way to check if PSCI is actually available and used.

The first patch adds a helper function to check if PSCI is available.
This is useful for e.g. drivers that are used on platforms with and
without PSCI.  Such drivers may need to take provisions for proper
operation when PSCI is used, and/or to implement functionality that is
usually provided by PSCI.

The second patch makes the PSCI checker use the new helper.

Thanks for your comments!

Geert Uytterhoeven (2):
  drivers: firmware: psci: Add psci_is_available()
  drivers: psci: checker: Use psci_is_available()

 drivers/firmware/psci.c         | 5 +++++
 drivers/firmware/psci_checker.c | 2 +-
 include/linux/psci.h            | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
