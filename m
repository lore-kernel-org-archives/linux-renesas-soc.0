Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:13935 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751075AbdJCHey (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 03:34:54 -0400
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
Subject: [PATCH 0/2] pinctrl: rza1: add support for RZ/A1L
Date: Tue,  3 Oct 2017 02:33:32 -0500
Message-Id: <20171003073334.18917-1-chris.brandt@renesas.com>
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


Chris Brandt (2):
  pinctrl: rza1: add support for RZ/A1L
  dt-bindings: pinctrl: add support for RZ/A1L

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |   3 +-
 drivers/pinctrl/pinctrl-rza1.c                     | 134 +++++++++++++++++++++
 2 files changed, 136 insertions(+), 1 deletion(-)

-- 
2.14.1
