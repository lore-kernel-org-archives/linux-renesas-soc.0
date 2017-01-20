Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54112 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1752002AbdATL1G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 06:27:06 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v7 0/2] arm64: dts: r8a779x: add thermal to DTS
Date: Fri, 20 Jan 2017 12:26:41 +0100
Message-Id: <20170120112643.2282-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the driver is now merged into next, we can add the DTS snipplets as well.
Changes from V6:

* rebased to latest renesas/arm64-dt-for-v4.11
* changed critical temp from 90° to 120° which is the state in the latest BSP


Wolfram Sang (2):
  arm64: dts: r8a7795: Add R-Car Gen3 thermal support
  arm64: dts: r8a7796: Add R-Car Gen3 thermal support

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 58 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 58 ++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

-- 
2.11.0
