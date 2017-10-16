Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:13483 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750914AbdJPKNf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 06:13:35 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  0/2] Add XHCI support
Date: Mon, 16 Oct 2017 11:12:47 +0100
Message-Id: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This series aims to add USB XHCI support for iWave RZ/G1M (R8A7743) board.
This series has been tested against renesas-dev tag 20171013-v4.14-rc4.

Regards,

Fabrizio Castro (2):
  dt-bindings: usb-xhci: Document r8a7743 support
  ARM: dts: r8a7743: Add xhci support to SoC dtsi

 Documentation/devicetree/bindings/usb/usb-xhci.txt |  4 +++-
 arch/arm/boot/dts/r8a7743.dtsi                     | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
1.9.1
