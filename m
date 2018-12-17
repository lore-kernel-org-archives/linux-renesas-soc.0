Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF43C43612
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C663E206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RxEO3Ei2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbeLQOb6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:31:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41833 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727043AbeLQOb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:31:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B115F25B781;
        Tue, 18 Dec 2018 01:31:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545057116; bh=4Ig5MW3kUlq8RkAm/H5/EsebgZQgePb/w1CGVpcPbIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RxEO3Ei2qMvgki7/HyPNhbYrv1qYN7DxtsNyaiYrYL8nR28L/ZCvDTvsBakPWktn8
         WHRreQzd31HN1ciPjx2OhcJcTtWhSbXcMEfILdQ1JCW0Z/gzAKyDUDI6No2ubVbT/F
         /CxH0HhkasTSxyKwFdzpCIDkN9w8Anwtnw3RvV8U=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C9AE494048A; Mon, 17 Dec 2018 15:31:53 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:31:53 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 09/15] pinctrl: sh-pfc: sh7734: Remove bogus IPSR10 value
Message-ID: <20181217143152.g7vcs3gtphzm7dg6@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-10-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213182714.26094-10-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:27:08PM +0100, Geert Uytterhoeven wrote:
> The IP10[5:3] field in Peripheral Function Select Register 10 has a
> width of 3 bits, i.e. it allows programming one out of 8 different
> configurations.
> However, 9 values are provided instead of 8, overflowing into the
> subsequent field in the register, and thus breaking the configuration of
> the latter.
> 
> Fix this by dropping a bogus zero value.
> 
> Fixes: ac1ebc2190f575fc ("sh-pfc: Add sh7734 pinmux support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

