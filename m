Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA859C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87EE520874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="S6q5SKoN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbeLQOYM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:24:12 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41705 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbeLQOYL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:24:11 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4DA3725B781;
        Tue, 18 Dec 2018 01:24:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545056649; bh=jqsNHhCQTh8QTT6aMv0IPUj85I46zmofJPCxl8snqLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S6q5SKoNU3XpTtvikzIYIpO1fdRRnTSP8oatq+n8hrsaVovL6Kbty5zaEcwkP1Pfz
         q0X5AQaRzHUPbWT+/Hm6oahqf3UbRo6jJjDjG8phGWg0OWNaK/IP+bdCOuObIqZOPj
         sTRQRCDmNCI6S065t5FDE5yiBRMBI7iUFpeeHWac=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 63C4794048A; Mon, 17 Dec 2018 15:24:07 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:24:07 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] pinctrl: sh-pfc: sh7264: Fix PFCR3 and PFCR0
 register configuration
Message-ID: <20181217142406.pjhk67feprbkvzgq@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-8-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-8-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:06PM +0100, Geert Uytterhoeven wrote:
> The Port F Control Register 3 (PFCR3) contains only a single field.
> However, counting from left to right, it is the fourth field, not the
> first field.
> Insert the missing dummy configuration values (3 fields of 16 values) to
> fix this.
> 
> The descriptor for the Port F Control Register 0 (PFCR0) lacks the
> description for the 4th field (PF0 Mode, PF0MD[2:0]).
> Add the missing configuration values to fix this.
> 
> Fixes: a8d42fc4217b1ea1 ("sh-pfc: Add sh7264 pinmux support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
