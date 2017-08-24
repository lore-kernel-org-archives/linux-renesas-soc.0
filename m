Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60519 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbdHXIs7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 04:48:59 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, magnus.damm@gmail.com,
        robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] GR-Peach DTS update
Date: Thu, 24 Aug 2017 10:48:39 +0200
Message-Id: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Simon,
   now that RZ/A1 pin controller is merged, it's time to enable some peripheral
devices on GR-Peach has it has been done for Genmai and RSK boards.

The series is based on Simon's "renesas-dt2-for-v4.14" tag release, so it should
be ideally applied after v4.14-rc1 is out, as it needs pin controller nodes to
be defined in r7s72100.dtsi.

Patch 2/4 enables EHTER interface, even if I've not been able to exchange any
traffic on that. I can set the ip address and probe the device and double
checked the pin configuration process against u-boot sources (where the
interface is working instead). Sending the patch anyway and let you decide what
to do with that.

Thanks
   j

Jacopo Mondi (4):
  arm: dts: gr-peach: Remove empty line
  arm: dts: gr-peach: Add SCIF2 pin group
  arm: dts: gr-peach: Add ETHER pin group
  arm: dts: gr-peach: Add user led device nodes

 arch/arm/boot/dts/r7s72100-gr-peach.dts | 57 ++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

--
2.7.4
