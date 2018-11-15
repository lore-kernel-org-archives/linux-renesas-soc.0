Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:12318 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388439AbeKPCYQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 21:24:16 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: jacopo mondi <jacopo@jmondi.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v7 0/2] pinctrl: Add RZ/A2 pin and gpio driver
Date: Thu, 15 Nov 2018 11:15:26 -0500
Message-Id: <20181115161528.34326-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The pin controller in the RZ/A2 is nothing like the pin controller in
the RZ/A1. That's a good thing! This pin controller is much more simple
and easier to configure.

So, this driver is faily simple (I hope).

Chris Brandt (2):
  pinctrl: Add RZ/A2 pin and gpio controller
  dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO

 .../bindings/pinctrl/renesas,rza2-pinctrl.txt      |  87 ++++
 drivers/pinctrl/Kconfig                            |  11 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rza2.c                     | 519 +++++++++++++++++++++
 include/dt-bindings/pinctrl/r7s9210-pinctrl.h      |  47 ++
 5 files changed, 665 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza2.c
 create mode 100644 include/dt-bindings/pinctrl/r7s9210-pinctrl.h

-- 
2.16.1
