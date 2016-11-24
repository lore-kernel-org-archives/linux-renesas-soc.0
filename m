Return-Path: <devicetree-owner@vger.kernel.org>
From: Chris Paterson <chris.paterson2@renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH v2 0/3] arm64: dts: r8a7796: Add CAN/CAN FD support
Date: Thu, 24 Nov 2016 16:13:38 +0000
Message-Id: <1480004021-4037-1-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
References: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series adds CAN and CAN FD support to the r8a7796.

Changes since v1:
- Split device tree changes from bindings documentation.
- Rebased on renesas-devel-20161123v2-v4.9-rc6.


Chris Paterson (3):
  arm64: dts: r8a7796: Add CAN external clock support
  arm64: dts: r8a7796: Add CAN support
  arm64: dts: r8a7796: Add CAN FD support

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 61 ++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
1.9.1

