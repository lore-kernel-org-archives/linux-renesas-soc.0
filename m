Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:36827 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbeKIBnt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 20:43:49 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v5 0/6] sh-pfc: Variadic VIN_DATA_PIN_GROUP macro + VIN updates
Date: Thu,  8 Nov 2018 17:07:21 +0100
Message-Id: <1541693247-15599-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert, Simon,
   this version uses the new variadic macro VIN_DATA_PIN_GROUP as v4 (this
for real in [3/6].

Refactoring of users of the macro old version have broken out to single
patches, comments on M3-N and E3 VIN PFC groups have been incorporated.

Quite a few changes in M3-N and E3 VIN support in PFC, so the single
patches changelog is in commit messages.

Thanks
   j

Jacopo Mondi (6):
  pinctrl: sh-pfc: Add optional arg to VIN_DATA_PIN_GROUP
  pinctrl: sh-pfc: r8a77965: Add VIN[4|5] groups/functions
  pinctrl: sh-pfc: r8a77990: Add VIN[4|5] groups/functions
  pinctrl: sh-pfc: r8a7792: Fix VIN versioned groups
  pinctrl: sh-pfc: r8a7795: Fix VIN versioned groups
  pinctrl: sh-pfc: r8a7796: Fix VIN versioned groups

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c  |   6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  |  24 +--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  |  24 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 270 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 244 ++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h       |  15 +-
 6 files changed, 549 insertions(+), 34 deletions(-)

--
2.7.4
