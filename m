Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:36433 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934812AbcKWMOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 07:14:22 -0500
From: Chris Paterson <chris.paterson2@renesas.com>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 0/3] arm64: dts: r8a7796: Add CAN/CAN FD support
Date: Wed, 23 Nov 2016 12:14:03 +0000
Message-Id: <1479903243-1860-1-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch series adds CAN and CAN FD support to the r8a7796.

Based on renesas-devel-20161122-v4.9-rc6.

Chris Paterson (3):
  arm64: dts: r8a7796: Add CAN external clock support
  arm64: dts: r8a7796: Add CAN support
  arm64: dts: r8a7796: Add CAN FD support

 .../devicetree/bindings/net/can/rcar_can.txt       | 12 +++--
 .../devicetree/bindings/net/can/rcar_canfd.txt     | 12 +++--
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 61 ++++++++++++++++++++++
 3 files changed, 75 insertions(+), 10 deletions(-)

-- 
1.9.1
