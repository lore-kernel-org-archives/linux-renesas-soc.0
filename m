Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:22747 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752004AbeDQLJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 07:09:29 -0400
From: Michel Pollet <michel.pollet@bp.renesas.com>
To: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com,
        Michel Pollet <buserror+upstream@gmail.com>,
        Michel Pollet <michel.pollet@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v5 1/6] arm: shmobile: Add the RZ/N1D (R9A06G032) to the shmobile Kconfig
Date: Tue, 17 Apr 2018 12:04:16 +0100
Message-Id: <1523963101-56725-2-git-send-email-michel.pollet@bp.renesas.com>
In-Reply-To: <1523963101-56725-1-git-send-email-michel.pollet@bp.renesas.com>
References: <1523963101-56725-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the RZ/N1D SoC to the reset of the Renesas SoC Collection.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 arch/arm/mach-shmobile/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 96672da..fcc273f 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -114,6 +114,10 @@ config ARCH_R8A7794
 	bool "R-Car E2 (R8A77940)"
 	select ARCH_RCAR_GEN2
 
+config ARCH_R9A06G032
+	bool "RZ/N1D (R9A06G032)"
+	select ARCH_RZN1
+
 config ARCH_RZN1
 	bool "RZ/N1 (R9A06G0xx) Family"
 	select ARM_AMBA
-- 
2.7.4
