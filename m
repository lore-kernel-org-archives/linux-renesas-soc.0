Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46146 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388172AbeGXNVa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 09:21:30 -0400
Date: Tue, 24 Jul 2018 14:15:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: Include R-Car product name in DTSI
 files
Message-ID: <20180724121514.lda5nfahag4akwsp@verge.net.au>
References: <153199919069.10140.15895581107478774899.sendpatchset@little-apple>
 <20180719125934.GA1432@bigcity.dyn.berto.se>
 <CANqRtoSSoenVr35wvEmxX5in+Mpt5A3-gkKyFDS0fMeTBiHczQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANqRtoSSoenVr35wvEmxX5in+Mpt5A3-gkKyFDS0fMeTBiHczQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 20, 2018 at 02:16:13AM +0900, Magnus Damm wrote:
> Hi Niklas,
> 
> On Thu, Jul 19, 2018 at 9:59 PM, Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > Hi Magnus,
> >
> > Thanks for your patch.
> >
> > On 2018-07-19 20:19:50 +0900, Magnus Damm wrote:
> >> From: Magnus Damm <damm+renesas@opensource.se>
> >>
> >> Browsing the DTS for all the R-Car SoCs with similar part numbers
> >> makes my head hurt, so to improve the user friendliness of the
> >> DTS code base include R-Car product name in each DTSI file.
> >>
> >> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >> ---
> >>
> >>  Based on renesas-drivers-2018-07-17-v4.18-rc5
> >>
> >>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |    2 +-
> >>  arch/arm64/boot/dts/renesas/r8a7795.dtsi     |    2 +-
> >>  arch/arm64/boot/dts/renesas/r8a7796.dtsi     |    2 +-
> >>  arch/arm64/boot/dts/renesas/r8a77965.dtsi    |    2 +-
> >>  arch/arm64/boot/dts/renesas/r8a77970.dtsi    |    2 +-
> >>  arch/arm64/boot/dts/renesas/r8a77980.dtsi    |    2 +-
> >>  arch/arm64/boot/dts/renesas/r8a77990.dtsi    |    2 +-
> >>  arch/arm64/boot/dts/renesas/r8a77995.dtsi    |    2 +-
> >>  8 files changed, 8 insertions(+), 8 deletions(-)
> >>
> >> --- 0001/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> >> +++ work/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi 2018-07-19 20:04:10.900607110 +0900
> >> @@ -1,6 +1,6 @@
> >>  // SPDX-License-Identifier: GPL-2.0
> >>  /*
> >> - * Device Tree Source for the r8a7795 ES1.x SoC
> >> + * Device Tree Source for the R-Car H3 (R8A77950) ES1.x SoC
> >
> > I'm just curies why do you append a extra 0 to the part number here and
> > for M3-W? Other then I think this change is good and will help me as
> > well to map part number to product name :-)
> 
> Good question!
> 
> I should probably have mentioned in the patch description that the
> names and part numbers come from the file
> Documentation/devicetree/bindings/arm/shmobile.txt.

Thanks, I have applied the following for v4.20.

From: Magnus Damm <damm+renesas@opensource.se>
Subject: [PATCH] arm64: dts: renesas: Include R-Car product name in DTSI files

Browsing the DTS for all the R-Car SoCs with similar part numbers
makes my head hurt, so to improve the user friendliness of the
DTS code base include R-Car product name in each DTSI file.

Product names are derived from
Documentation/devicetree/bindings/arm/shmobile.txt

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 2 +-
 arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi    | 2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi    | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 7b2fbaec9aef..d915cff5b1b0 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7795 ES1.x SoC
+ * Device Tree Source for the R-Car H3 (R8A77950) ES1.x SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index fb9d08ad7659..aa0d4c8f6b04 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7795 SoC
+ * Device Tree Source for the R-Car H3 (R8A77950) SoC
  *
  * Copyright (C) 2015 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index cbd35c00b4af..b93596c9c6b1 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a7796 SoC
+ * Device Tree Source for the R-Car M3-W (R8A77960) SoC
  *
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0cd44461a0bd..9c4f40589cbd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77965 SoC
+ * Device Tree Source for the R-Car M3-N (R8A77965) SoC
  *
  * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
  *
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 954168858fed..18d1aafe2e30 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77970 SoC
+ * Device Tree Source for the R-Car V3M (R8A77970) SoC
  *
  * Copyright (C) 2016-2017 Renesas Electronics Corp.
  * Copyright (C) 2017 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 4a1097e32551..d3532fd4c94a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77980 SoC
+ * Device Tree Source for the R-Car V3H (R8A77980) SoC
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  * Copyright (C) 2018 Cogent Embedded, Inc.
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index ae89260baad9..2c8f1194e6b5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Device Tree Source for the r8a77990 SoC
+ * Device Tree Source for the R-Car E3 (R8A77990) SoC
  *
  * Copyright (C) 2018 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index fe77bc43c447..c94513ce5b9b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the r8a77995 SoC
+ * Device Tree Source for the R-Car D3 (R8A77995) SoC
  *
  * Copyright (C) 2016 Renesas Electronics Corp.
  * Copyright (C) 2017 Glider bvba
-- 
2.11.0
