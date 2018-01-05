Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/3] usb: renesas_usbhs: Add RZ/A1 support
Date: Fri,  5 Jan 2018 13:46:06 -0500
Message-Id: <20180105184609.24106-1-chris.brandt@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds RZ/A1 gadget support to the renesas_usbhs driver.
Basically, it's almost the same HW as the R-Car (and SH) parts.
The only real difference is the some extra registers for the PHY.

This was tested on an RSK board by connecting to a PC as an
Ethernet CDC gadget.

v2:
 * Node name is now generic 'usb@'
 * GIC_SPI (73-32) is now just GIC_SPI 41
 * All hex number are lower case
 * Added Reviewed-by

Chris Brandt (3):
  usb: renesas_usbhs: Add support for RZ/A1
  dt-bindings: usb: renesas_usbhs: Add support for RZ/A1
  ARM: dts: r7s72100: add USB device to device tree

 .../devicetree/bindings/usb/renesas_usbhs.txt      |  2 +
 arch/arm/boot/dts/r7s72100.dtsi                    | 20 +++++++++
 drivers/usb/renesas_usbhs/Makefile                 |  2 +-
 drivers/usb/renesas_usbhs/common.c                 | 17 +++++++
 drivers/usb/renesas_usbhs/common.h                 |  6 +++
 drivers/usb/renesas_usbhs/rza.c                    | 52 ++++++++++++++++++++++
 drivers/usb/renesas_usbhs/rza.h                    |  4 ++
 include/linux/usb/renesas_usbhs.h                  |  1 +
 8 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza.c
 create mode 100644 drivers/usb/renesas_usbhs/rza.h

-- 
2.15.1


