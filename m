Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:28661 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751166AbdLNJJD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 04:09:03 -0500
From: Chris Paterson <chris.paterson2@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 0/3] Correct R-Car Gen2 critical CPU temperature
Date: Thu, 14 Dec 2017 09:08:38 +0000
Message-Id: <1513242521-11236-1-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The current R-Car Gen2 device trees define the CPU critical
temperature as 115°C.

The R-Car hardware manuals state that Tc = –40°C to +105°C. The
thermal sensor has an accuracy of ±5°C and there can be a temperature
difference of 1 or 2 degrees between Tjmax and the thermal sensor due
to the location of the latter.

This means that 95°C is a safer value to use.

This value should also apply to r8a7792 but thermal sensor support has
not been added yet.

Chris Paterson (3):
  ARM: dts: r8a7790: Correct critical CPU temperature
  ARM: dts: r8a7791: Correct critical CPU temperature
  ARM: dts: r8a7793: Correct critical CPU temperature

 arch/arm/boot/dts/r8a7790.dtsi | 2 +-
 arch/arm/boot/dts/r8a7791.dtsi | 2 +-
 arch/arm/boot/dts/r8a7793.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1
