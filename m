Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:55767 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1757044AbeAHMcG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jan 2018 07:32:06 -0500
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
Subject: [PATCH v4 0/3] usb: renesas_usbhs: Add RZ/A1 support
Date: Mon,  8 Jan 2018 07:30:52 -0500
Message-Id: <20180108123055.64890-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds RZ/A1 gadget support to the renesas_usbhs driver.
Basically, it's almost the same HW as the R-Car (and SH) parts.
The only real difference is the some extra registers for the PHY.

This was tested on an RSK board by connecting to a PC as an
Ethernet CDC gadget.

v4:
 * Re-added "renesas,usbhs-r7s72100" to doc
 * Changed to "renesas,usbhs-r7s72100", "renesas,rza1-usbhs" for DTS
v3:
 * Changed from "renesas,usbhs-r7s72100" to "renesas,rza1-usbhs"
 * Removed "renesas,usbhs-r7s72100"
 * Changed License of rza.c
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
 drivers/usb/renesas_usbhs/common.c                 | 13 ++++++
 drivers/usb/renesas_usbhs/common.h                 |  6 +++
 drivers/usb/renesas_usbhs/rza.c                    | 52 ++++++++++++++++++++++
 drivers/usb/renesas_usbhs/rza.h                    |  4 ++
 include/linux/usb/renesas_usbhs.h                  |  1 +
 8 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza.c
 create mode 100644 drivers/usb/renesas_usbhs/rza.h

-- 
2.15.1
