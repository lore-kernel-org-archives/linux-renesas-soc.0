Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:50021 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752991AbdC2RbO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 13:31:14 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 0/7] rtc: Reuse rtc-sh driver to support RZ/A1
Date: Wed, 29 Mar 2017 10:30:28 -0700
Message-Id: <20170329173035.67477-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Basically, the same RTC that was used in SuperH devices is now used in
RZ/A1 devices. Therefore with some slight changes, that driver can be
reused.

Additionally, since ARM architectures require Device Tree configurations,
device tree support has been added.

This was tested on RZ/A1H RSK board. Once the correct time was programmed
into the RTC running off a 32.768kHz crystal, you can retain an accurate
system clock between reboots (hard and soft) until power is finally removed
from the board (there is no batter backup on the RSK board).

v3:
* remove 'power-domains' from example in documentation
* update commit message subject and body of dt-bindings

v2:
* removed HAVE_CLK from Kconfig
* when using DT, look for "fck" instead of "rtc0"
* changed (res == NULL) to (!res)
* added Reviewed-by for rtc-sh.c
* added interrupt-names and clock-names
* clocks now include counting sources
* added clock-names "fck", "rtc_x1", "rtc_x3", "extal"
* changed 'is a RTC' to 'is an RTC' in commit message
* changed "rtc0" to "rtc"
* Added clock nodes for RTC_X1 and RTC_X3 pin inputs
* each commit now has a log message


Chris Brandt (7):
  rtc: rtc-sh: add support for rza series
  dt-bindings: rtc: document the rtc-sh bindings
  ARM: dts: r7s72100: add rtc clock to device tree
  ARM: dts: r7s72100: add RTC_X clock inputs to device tree
  ARM: dts: r7s72100: add rtc to device tree
  ARM: dts: rskrza1: set rtc_x1 clock value
  ARM: dts: rskrza1: add rtc DT support

 Documentation/devicetree/bindings/rtc/rtc-sh.txt | 28 ++++++++++++++++++
 arch/arm/boot/dts/r7s72100-rskrza1.dts           |  8 +++++
 arch/arm/boot/dts/r7s72100.dtsi                  | 37 ++++++++++++++++++++++++
 drivers/rtc/Kconfig                              |  4 +--
 drivers/rtc/rtc-sh.c                             | 33 +++++++++++++++++----
 include/dt-bindings/clock/r7s72100-clock.h       |  3 ++
 6 files changed, 106 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt

-- 
2.11.0
