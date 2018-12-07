Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:5386 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725988AbeLGLgZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 06:36:25 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/5] Add NXP pcf85263 real-time clock support
Date: Fri,  7 Dec 2018 11:27:41 +0000
Message-Id: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set aims to add support for NXP pcf85263 real-time clock.
pcf85263 rtc is compatible with pcf85363 rtc except that pcf85363 has
64 bytes additional RAM.

1 byte of nvmem is supported in pcf85263 and is exposed through sysfs.

The details of pcf85363 and pcf85263 can be found in the below data sheets.

https://www.nxp.com/docs/en/data-sheet/PCF85363A.pdf

https://www.nxp.com/docs/en/data-sheet/PCF85263A.pdf

This patch is tested against linux-next.

V1-->V2
   * Incorporated simon's review comment for binding patch.
   * Incorporated Geert and Alexandre's review comments.
V2-->V3
   * Incorporated Geert's review comments.
V3-->V4
   * Incorporated Geert and Alexandre's review comments.

Biju Das (5):
  nvmem: check invalid number of bytes in nvmem_device_{read,write}
  dt-bindings: rtc: pcf85363: Document pcf85263 real-time clock
  rtc: pcf85363: Add support for NXP pcf85263 rtc
  ARM: shmobile: Enable NXP pcf85363 rtc in shmobile_defconfig
  ARM: dts: iwg23s-sbc: Enable RTC

 Documentation/devicetree/bindings/rtc/pcf85363.txt |  4 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          | 18 +++++
 arch/arm/configs/shmobile_defconfig                |  1 +
 drivers/nvmem/core.c                               | 26 +++++-
 drivers/rtc/rtc-pcf85363.c                         | 94 +++++++++++++++++-----
 5 files changed, 122 insertions(+), 21 deletions(-)

-- 
2.7.4
