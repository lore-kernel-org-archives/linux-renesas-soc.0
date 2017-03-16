Return-Path: <devicetree-owner@vger.kernel.org>
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
Subject: [PATCH 0/5] rtc: Reuse rtc-sh driver to support RZ/A1
Date: Thu, 16 Mar 2017 13:51:07 -0400
Message-Id: <20170316175112.27913-1-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
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


Chris Brandt (5):
  rtc: rtc-sh: add support for rza series
  rtc: Add rtc-sh
  ARM: dts: r7s72100: add rtc clock to device tree
  ARM: dts: r7s72100: add rtc to device tree
  ARM: dts: rskrza1: add rtc DT support

 Documentation/devicetree/bindings/rtc/rtc-sh.txt | 19 +++++++++++++++++++
 arch/arm/boot/dts/r7s72100-rskrza1.dts           |  4 ++++
 arch/arm/boot/dts/r7s72100.dtsi                  | 20 ++++++++++++++++++++
 drivers/rtc/Kconfig                              |  4 ++--
 drivers/rtc/rtc-sh.c                             | 20 ++++++++++++++++++++
 include/dt-bindings/clock/r7s72100-clock.h       |  3 +++
 6 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt

-- 
2.10.1


