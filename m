Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:45045 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753781AbeD2Ts3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Apr 2018 15:48:29 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT 0/3] mmc: renesas_sdhi: add support for r8a77965
Date: Mon, 30 Apr 2018 04:48:13 +0900
Message-Id: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds SDHI device support for r8a77965.

This series is based on the next branch of Ulf Hansson's mmc tree.

Masaharu Hayakawa (1):
  mmc: renesas_sdhi: Add r8a77965 support

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a77965: Add SDHI pins, groups and functions
  arm64: dts: r8a77965: Add SDHI device nodes

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt |   1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  68 +++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c      |   2 +
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 326 +++++++++++++++++++++
 4 files changed, 377 insertions(+), 20 deletions(-)

-- 
1.9.1
