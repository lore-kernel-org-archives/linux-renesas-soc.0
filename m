Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13330C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 12:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96BAF208E7
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 12:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fdJRjeHU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96BAF208E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbeLNMuc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 07:50:32 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58134 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbeLNMuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 07:50:32 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B2E8549;
        Fri, 14 Dec 2018 13:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544791829;
        bh=nxixLYxG4texo1XqvC10lW9JqQYJWG+058foizMj7ME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fdJRjeHUYCa1Pr2SoqgQAvve2KvmPbDh/M7yRlwfcmus9BEKaKrszZWt+5NqxezwF
         CjVBoRjwaMctdTPR2uOmvkzbAAHFiXxhJZala6lRJXnSCIwqb/MoyxUgR/a6WfRH7D
         b3/5pJP0H0nWlLI2dBRkB0+A+RhZMNR0Y2FizwkQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
Date:   Fri, 14 Dec 2018 14:51:16 +0200
Message-ID: <1802662.4aWZeBt1W0@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <TY2PR01MB2297C725388D98E018BA687FD8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1544609975-26477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <9308781.U9oT2vPqyz@avalon> <TY2PR01MB2297C725388D98E018BA687FD8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Shimoda-san,

On Friday, 14 December 2018 12:41:32 EET Yoshihiro Shimoda wrote:
> From: Laurent Pinchart, Sent: Thursday, December 13, 2018 10:53 PM
> > On Wednesday, 12 December 2018 12:19:35 EET Yoshihiro Shimoda wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > 
> > > MOD_SEL register bit numbering was different from R-Car D3 SoC and
> > > R-Car H3/M3-[WN] SoCs.
> > > 
> > > MOD_SEL 1-bit      H3/M3-[WN]  D3
> > > ===============    ==========  =====
> > > Set Value = H'0    b'0         b'0
> > > Set Value = H'1    b'1         b'1
> > > 
> > > MOD_SEL 2-bits     H3/M3-[WN]  D3
> > > ===============    ==========  =====
> > > Set Value = H'0    b'00        b'00
> > > Set Value = H'1    b'01        b'10
> > > Set Value = H'2    b'10        b'01
> > > Set Value = H'3    b'11        b'11
> > > 
> > > MOD_SEL 3-bits     H3/M3-[WN]  D3
> > > ===============    ==========  =====
> > > Set Value = H'0    b'000       b'000
> > > Set Value = H'1    b'001       b'100
> > > Set Value = H'2    b'010       b'010
> > > Set Value = H'3    b'011       b'110
> > > Set Value = H'4    b'100       b'001
> > > Set Value = H'5    b'101       b'101
> > > Set Value = H'6    b'110       b'011
> > > Set Value = H'7    b'111       b'111
> > > 
> > > This patch replaces the #define name and value of MOD_SEL.
> > > 
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Fixes: 794a67117646 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> > > [shimoda: split a patch per SoC and revise the commit log]
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > 
> > Per Geert's request I've tested this patch on the Draak board with pwm-
> > backlight, and it doesn't seem to make any difference.
> 
> Thank you for testing this patch!
> The result seems strange to me. So, I'll investigate it in next week.

My guess is that MOD_SEL only affects input signals, not output signals.

-- 
Regards,

Laurent Pinchart



