Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:10943 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751135AbdJDVIi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 17:08:38 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 0/2] pinctrl: rza1: add support for RZ/A1L
Date: Wed,  4 Oct 2017 16:07:22 -0500
Message-Id: <20171004210724.59797-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The RZ/A series has 3 main device: RZ/A1L, RZ/A1M, RZ/A1H.

In terms of pinctrl, RZ/A1H and RZ/A1M are exactly the same.

Aspects like the number of ports and the location where peripherals are
brought out differ between the RZ/A1H and RZ/A1L.

Basically this series adds a new set of tables for RZ/A1L and a new
compatible "renesas,r7s72102-ports"

This was tested on a Renesas Stream it board which contains an RZ/A1L and
external SDRAM.

v3:
 * rewored DT documentation
 * Added Reviewed-by for renesas,rza1-pinctrl.txt
v2:
 * Added RZ/A1M to DT documentation
 * Added Reviewed-by for pinctrl-rza1.c

Chris Brandt (2):
  pinctrl: rza1: add support for RZ/A1L
  dt-bindings: pinctrl: add support for RZ/A1M and RZ/A1L

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |   6 +-
 drivers/pinctrl/pinctrl-rza1.c                     | 134 +++++++++++++++++++++
 2 files changed, 138 insertions(+), 2 deletions(-)

-- 
2.14.1
