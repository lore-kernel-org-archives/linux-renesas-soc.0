Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34052 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756906AbdLVKbr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Dec 2017 05:31:47 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: arm@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Updates for v4.16
Date: Fri, 22 Dec 2017 11:30:37 +0100
Message-Id: <cover.1513936182.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC updates for v4.16.

This pull request is based on the previous round of
such requests, tagged as renesas-soc-for-v4.16,
which I have already sent a pull-request for.


The following changes since commit 90f0d2b344313a8a4c366ef60d0df33008d2be84:

  soc: renesas: Identify R-Car M3-W ES1.1 (2017-11-27 11:40:57 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc2-for-v4.16

for you to fetch changes up to 91c719f5ec6671f7b63762d78897af5583dd7693:

  soc: renesas: rcar-sysc: Keep wakeup sources active during system suspend (2017-12-20 11:16:05 +0100)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Updates for v4.16

* rcar-sysc: Keep wakeup sources active during system suspend

  Geert Uytterhoeven says "If an R-Car SYSC slave device is part of the
  CPG/MSTP or CPG/MSSR Clock Domain and to be used as a wakeup source, it
  must be kept active during system suspend.

  Currently this is handled in device-specific drivers by explicitly
  increasing the use count of the module clock when the device is
  configured as a wakeup source.  However, the proper way to prevent the
  device from being stopped is to inform this requirement to the genpd
  core, by setting the GENPD_FLAG_ACTIVE_WAKEUP flag.

  Note that this will only affect devices configured as wakeup sources."

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: rcar-sysc: Keep wakeup sources active during system suspend

 drivers/soc/renesas/rcar-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
