Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:58245 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729241AbeKFUAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 15:00:23 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: geert+renesas@glider.be, horms@verge.net.au,
        laurent.pinchart@ideasonboard.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/4] sh-pfc: Variadic VIN_DATA_PIN_GROUP macro + updates
Date: Tue,  6 Nov 2018 11:35:29 +0100
Message-Id: <1541500533-21843-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,
   thanks to your suggestion I made a variadic macro out of the
VIN_DATA_PIN_GROUP one. The macro accepts an optional third argument 'version'
and creates properly formatted names in the form of 'vin4_data8_a' in place of
the previous 'vin4_data_a8' ones.

I included in this series the refactoring of existing users of versioned
VIN_DATA_PIN_GROUP macro and upstreaming of VIN4 and VIN5 enablement for both
R-Car M3-N and E3, both of them users of versioned VIN groups.

Thanks
   j

v3 -> v4:
- The series gathers different patch series previously sent separately:
  [PATCH 0/2] pinctrl: sh-pfc: r8a77965: Add VIN4 and VIN5
  [PATCH] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
  As E3 patch depends on the M3-N series, I made a single one out of those.
  Changelog for the E3 patch (which was actually at v3) is included in the
  single patch commit message.


Jacopo Mondi (4):
  pinctrl: sh-pfc: Add optional arg to VIN_DATA_PIN_GROUP
  pinctrl: sh-pfc: Fix VIN versioned groups name
  pinctrl: sh-pfc: r8a77965: Add VIN[4|5] groups/functions
  pinctrl: sh-pfc: r8a77990: Add VIN[4|5] groups/functions

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c  |   6 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  |  24 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  |  24 ++--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 254 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 244 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h       |  17 +--
 6 files changed, 534 insertions(+), 35 deletions(-)

--
2.7.4
