Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB9FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 544842089F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbfAHJQt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 04:16:49 -0500
Received: from mail.bootlin.com ([62.4.15.54]:58501 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728299AbfAHJQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 04:16:48 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 2D7E620C2D; Tue,  8 Jan 2019 10:16:47 +0100 (CET)
Received: from windsurf (aaubervilliers-681-1-29-148.w90-88.abo.wanadoo.fr [90.88.149.148])
        by mail.bootlin.com (Postfix) with ESMTPSA id 999E420A2F;
        Tue,  8 Jan 2019 10:16:17 +0100 (CET)
Date:   Tue, 8 Jan 2019 10:16:15 +0100
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT v2] net: sh_eth: add support for SH7786
Message-ID: <20190108101615.165c5a4b@windsurf>
In-Reply-To: <cbc7976d-2376-15d4-0fc1-febdf142887b@cogentembedded.com>
References: <cbc7976d-2376-15d4-0fc1-febdf142887b@cogentembedded.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Sergei,

Thanks for your work on this topic!

On Fri, 4 Jan 2019 15:53:24 +0300, Sergei Shtylyov wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit adds the sh_eth_cpu_data structure that describes the
> SH7786 variant of the IP.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I tried to test this patch today, and it doesn't work for the moment.
However, I've rebased my whole SH7786 patch stack on top of 4.20, and
with my original sh_eth patch, network is also not working, so I can't
say whether it's really this patch that has an issue, or some other
aspects.

(And yes, I remember to adjust the base address of the sh_eth
platform_device:

diff --git a/arch/sh/boards/board-wdc-cont4.c b/arch/sh/boards/board-wdc-cont4.c
index c72209822899..7ca1bfcc20ae 100644
--- a/arch/sh/boards/board-wdc-cont4.c
+++ b/arch/sh/boards/board-wdc-cont4.c
@@ -80,7 +80,7 @@ static int wdc_cont4_clk_init(void)
 
 static struct resource sh_eth_resources[] = {
         {
-                .start  = 0xFEE00200,
+                .start  = 0xFEE00000,
                 .end    = 0xFEE00400 - 1,
                 .flags  = IORESOURCE_MEM,
         }, {

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
