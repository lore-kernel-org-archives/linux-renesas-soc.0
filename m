Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:56717 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752426AbdLSNTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 08:19:38 -0500
From: Biju Das <biju.das@bp.renesas.com>
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 0/2] Add thermal support for iWave RZ/G1M board
Date: Tue, 19 Dec 2017 13:17:27 +0000
Message-Id: <1513689449-2700-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series aims to add thermal support for iWave RZ/G1M board.

This patch series based on renesas tag renesas-devel-20171218-v4.15-rc4 

Biju Das (2):
  dt-bindings: thermal: rcar: Add device tree support for r8a7743
  ARM: dts: r8a7743: Add thermal device to DT

 .../devicetree/bindings/thermal/rcar-thermal.txt   |  1 +
 arch/arm/boot/dts/r8a7743.dtsi                     | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
1.9.1
