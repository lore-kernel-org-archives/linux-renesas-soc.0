Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:56233 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751637AbdGENPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2017 09:15:44 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v 0/2] Add RZ/G1M (R8A7743) Ethernet AVB support
Date: Wed,  5 Jul 2017 14:01:49 +0100
Message-Id: <1499259711-56175-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series aims to add Gigabit Ethernet E-MAC support on r8a7743 (RZ/G1M) SoC.
The iWave RZ/G1M Qseven SOM supports Gigabit Ethernet Phy from Micrel(KSZ9031MNX).
Gigabit Ethernet support is available in Renesas AVB driver.

This series has been tested against linux-next tag next-20170704.

Biju Das (2):
  ravb: Add support for r8a7743 SoC
  ARM: shmobile: defconfig: Enable Ethernet AVB

 Documentation/devicetree/bindings/net/renesas,ravb.txt | 3 ++-
 arch/arm/configs/shmobile_defconfig                    | 1 +
 drivers/net/ethernet/renesas/ravb_main.c               | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

-- 
1.9.1
