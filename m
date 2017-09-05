Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52356 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751243AbdIEIHZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Sep 2017 04:07:25 -0400
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [GIT PULL LTSI-4.9 v2 00/13] Second Round of Renesas SoCs and Drivers to v4.12
Date: Tue,  5 Sep 2017 10:06:35 +0200
Message-Id: <1504598808-19810-1-git-send-email-horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is a submission to LTSI-v4.9.

* Backport v4.9 of the rcar-gen3-thermal driver to its as of v4.12.
* Limited backport to v4.9 of:
  - usb core
  - ohci-platform
  - ehci-platform
  - cs2000

There are 13 patches.

This patches appear to apply ltsi-4.9 tree generated using
scripts/generate_git.


Khiem Nguyen (1):
  clk: cs2000: add Suspend/Resume feature

Niklas Söderlund (7):
  thermal: rcar_gen3_thermal: add delay in .thermal_init on r8a7796
  thermal: rcar_gen3_thermal: remove unneeded mutex
  thermal: rcar_gen3_thermal: check that TSC exists before memory
    allocation
  thermal: rcar_gen3_thermal: record and check number of TSCs found
  thermal: rcar_gen3_thermal: enable hardware interrupts for trip points
  thermal: rcar_gen3_thermal: store device match data in private
    structure
  thermal: rcar_gen3_thermal: add suspend and resume support

Wolfram Sang (2):
  thermal: rcar_gen3_thermal: Document the R-Car Gen3
  thermal: rcar_gen3_thermal: Add R-Car Gen3 thermal driver

Yoshihiro Shimoda (3):
  usb: host: ehci-platform: fix usb 1.1 device is not connected in
    system resume
  usb: host: ehci-platform: set hcd->phy to avoid phy_get() in
    usb_add_hcd()
  usb: host: ohci-platform: set hcd->phy to avoid phy_get() in
    usb_add_hcd()

 .../bindings/thermal/rcar-gen3-thermal.txt         |  56 +++
 drivers/clk/clk-cs2000-cp.c                        |  22 +
 drivers/thermal/Kconfig                            |   9 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/rcar_gen3_thermal.c                | 504 +++++++++++++++++++++
 drivers/usb/host/ehci-platform.c                   |  10 +
 drivers/usb/host/ohci-platform.c                   |   3 +
 7 files changed, 605 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
 create mode 100644 drivers/thermal/rcar_gen3_thermal.c

-- 
2.1.4
