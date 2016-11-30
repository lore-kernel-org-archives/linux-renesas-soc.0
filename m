Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52478 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964807AbcK3KIE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 05:08:04 -0500
Date: Wed, 30 Nov 2016 11:07:58 +0100
From: Simon Horman <horms@verge.net.au>
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 16/18] arm64: dts: h3ulcb: rename SDHI0 pins
Message-ID: <20161130100758.GF2336@verge.net.au>
References: <cover.1479726397.git.horms+renesas@verge.net.au>
 <93373c309a703b57690216db4106a4a534929c15.1479726397.git.horms+renesas@verge.net.au>
 <45a251f6-ee0c-5eba-ffd1-3f61a1e7ccc7@cogentembedded.com>
 <f4f57fbc-313c-669f-94c7-073747a20a82@cogentembedded.com>
 <d4fbb71f-2a4d-2239-faa9-c017c74e1d79@cogentembedded.com>
 <8acc79fe-393d-2b69-b7e7-e87a53d95264@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8acc79fe-393d-2b69-b7e7-e87a53d95264@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 22, 2016 at 03:08:49PM +0300, Vladimir Barinov wrote:
> Hi Sergei,
> 
> On 22.11.2016 14:40, Sergei Shtylyov wrote:
> >On 11/22/2016 2:22 PM, Vladimir Barinov wrote:
> >
> >>>>From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>>>
> >>>>This changes SDHI0 pin names for H3ULCB board
> >>>>
> >>>>Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>>>Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >>>>---
> >>>> arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 8 ++++----
> >>>> 1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>
> >>>>diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> >>>>b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> >>>>index 8d0ac076d8e2..6ffb0517421a 100644
> >>>>--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> >>>>+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> >>>>@@ -163,13 +163,13 @@
> >>>>         function = "avb";
> >>>>     };
> >>>>
> >>>>-    sdhi0_pins_3v3: sd0_3v3 {
> >>>>+    sdhi0_pins: sd0 {
> >>>>         groups = "sdhi0_data4", "sdhi0_ctrl";
> >>>>         function = "sdhi0";
> >>>>         power-source = <3300>;
> >>>>     };
> >>>>
> >>>>-    sdhi0_pins_1v8: sd0_1v8 {
> >>>>+    sdhi0_pins_uhs: sd0 {
> >>>
> >>>   I'm afraid the following will just override the props of the node
> >>>above
> >>>which is not what we ant.
> >>Thank you for pointing to this.
> >>
> >>This is my typo.
> >>I will rework the patch to have different node names.
> >
> >   The patch had been already merged by Simon and was posted a s apart of
> >a pull request (if I don't mistake), so I guess an incremental patch
> >needed now...
> Thanks for clarification.
> 
> I will make incremental patch.

Please do.
