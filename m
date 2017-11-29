Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:40205 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753882AbdK2QGw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 11:06:52 -0500
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: horms@verge.net.au, geert@linux-m68k.org
Cc: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        magnus.damm@gmail.com, linux-mmc@vger.kernel.org,
        marek.vasut@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 0/2] R-Car D3 (r8a77995) SDHI (eMMC) integration
Date: Wed, 29 Nov 2017 17:06:44 +0100
Message-Id: <1511971606-580-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This integrates the SDHI hardware on R-Car D3 and enables the Draak board's
eMMC drive.

This revision dumps the two patches that have been applied already, fixes
the sdhi2_pins voltage, removes the redundant SDHI compatible string and
makes the internal DMAC whitelisting pattern more conservative.

CU
Uli


Ulrich Hecht (2):
  mmc: renesas_sdhi: enable R-Car D3 (r8a77995) support
  arm64: dts: r8a77995: draak: enable SDHI2

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 44 ++++++++++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c  |  1 +
 2 files changed, 45 insertions(+)

-- 
2.7.4
