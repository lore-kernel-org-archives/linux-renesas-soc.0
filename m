Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41203 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbeJ2Xtm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 19:49:42 -0400
Date: Mon, 29 Oct 2018 16:00:38 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/03] arm: dts: Include SoC name in DTSI for sh73a0
Message-ID: <20181029150037.pazgzplapabnydb3@verge.net.au>
References: <154014607107.1639.11934965040569923.sendpatchset@octo>
 <154014609942.1639.1864795559248515734.sendpatchset@octo>
 <66273a80-3a7e-c267-541f-5c48ec922230@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66273a80-3a7e-c267-541f-5c48ec922230@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 22, 2018 at 11:07:08AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
>    2 patches with the same name?
> 
> On 21.10.2018 21:21, Magnus Damm wrote:
> 
> > From: Magnus Damm <damm@opensource.se>
> > 
> > Update the Emma Mobile EV2 DTSI to include product name.
> 
>    Shouldn't this be in the subject instead of sh73a0?

I have applied this with an updated subject:


From: Magnus Damm <damm@opensource.se>
Date: Mon, 22 Oct 2018 03:21:39 +0900
Subject: [PATCH] arm: dts: Include SoC name in DTSI for Emma Mobile EV2

Update the Emma Mobile EV2 DTSI to include product name.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/emev2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.11.0
