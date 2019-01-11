Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE40C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:36:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E54E020657
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RiGsN6B7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbfAKMgs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:36:48 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33004 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfAKMgs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:36:48 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B57A025B76D;
        Fri, 11 Jan 2019 23:36:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547210206; bh=Wb3Jgy/DehFj6Lbse4CruOFSdMOlyCILW1KxE0xQJnY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RiGsN6B7gNnRglzLTXrkgUKIlvUeuRJRye3FZ63Fod0a1/M0VNVXAiBEypOBQVNP8
         nXfYT5JL3NXmsVBzrXv46Jn3MQGZQhF4DV24nHv5eJ3FhHqB/TUpb7KMREtJIP0FGx
         u6Fsw06TIx/7p1zYYSWkZ7Rhyw6GZ0ShVLykG9Ts=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 2507BE218F1; Fri, 11 Jan 2019 04:36:44 -0800 (PST)
Date:   Fri, 11 Jan 2019 13:36:44 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit2 when using
 RX2, TX2 and SCK2
Message-ID: <20190111123643.6b5grpmpx4iy4a7z@verge.net.au>
References: <20190111121224.31007-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111121224.31007-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 01:12:24PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> Aug 24, 2018, the MOD_SEL0 bit2 is set when RX2_{A,B}, TX2_{A,B} and
> SCK2_A pin functions are selected.
> 
> Fixes: 6d4036a1e3b3ac0f ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v5.1.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

