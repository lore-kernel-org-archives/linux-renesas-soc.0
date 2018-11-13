Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60097 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387625AbeKNA1g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 19:27:36 -0500
Date: Tue, 13 Nov 2018 06:29:09 -0800
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/03] Connect R-Car Gen3 Ethernet-AVB to IPMMU
Message-ID: <20181113142909.mp3wxbao6ehs3776@verge.net.au>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
 <20181107112115.5d2l2tfpf6nvuvca@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181107112115.5d2l2tfpf6nvuvca@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 07, 2018 at 12:21:16PM +0100, Simon Horman wrote:
> On Mon, Oct 22, 2018 at 02:14:34AM +0900, Magnus Damm wrote:
> > Connect R-Car Gen3 Ethernet-AVB to IPMMU
> > 
> > [PATCH 01/03] arm64: dts: renesas: r8a77965: Connect R-Car M3-N AVB to IPMMU
> > [PATCH 02/03] arm64: dts: renesas: r8a77980: Connect R-Car V3H AVB to IPMMU
> > [PATCH 03/03] arm64: dts: renesas: r8a77990: Connect R-Car E3 AVB to IPMMU
> > 
> > For each SoC describe Ethernet-AVB to IPMMU hardware connection in the
> > Device Tree. This series affects R-Car M3-N, V3H and E3. Other members
> > of the R-Car Gen3 family such as H3, M3-W, V3M and D3 already includes
> > this information in their DT files.
> > 
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> Hi,
> 
> I have already queued-up these patches but I noticed that
> they do the same thing to different SoCs and recently the ARM-SoC
> maintainers have asked us to consolidate such patches. With that in mind
> I am considering squashing the three patches that comprise this series into
> one. Are there any objections?

I have now gone ahead and done so. The result is as follows:

From: Magnus Damm <damm@opensource.se>
Subject: [PATCH] ARM: dts: r8a7740, emev2, sh73a0: Include SoC name in DTSI

Update the R-Mobile A1 (r8a7740), Emma Mobile EV2 (emev2) and
SH-Mobile AG5 (sh72a0) DTSI to include product name.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
[simon: squashed similar patches]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/emev2.dtsi   | 2 +-
 arch/arm/boot/dts/r8a7740.dtsi | 2 +-
 arch/arm/boot/dts/sh73a0.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/emev2.dtsi b/arch/arm/boot/dts/emev2.dtsi
index 373ea8720769..67d86012a85c 100644
--- a/arch/arm/boot/dts/emev2.dtsi
+++ b/arch/arm/boot/dts/emev2.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the EMEV2 SoC
+ * Device Tree Source for the Emma Mobile EV2 SoC
  *
  * Copyright (C) 2012 Renesas Solutions Corp.
  */
diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index 383cba68dbba..12ffe73bf2bc 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7740 SoC
+ * Device Tree Source for the R-Mobile A1 (R8A77400) SoC
  *
  * Copyright (C) 2012 Renesas Solutions Corp.
  */
diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index e8f0a07c4564..33836990b102 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the SH73A0 SoC
+ * Device Tree Source for the SH-Mobile AG5 (R8A73A00/SH73A0) SoC
  *
  * Copyright (C) 2012 Renesas Solutions Corp.
  */
-- 
2.11.0
