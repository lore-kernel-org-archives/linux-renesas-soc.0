Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86E3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:45:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A35162086C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ZgjVZVmJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbeLPKpq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 05:45:46 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:55701 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729784AbeLPKpq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 05:45:46 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 54B3625BDFF;
        Sun, 16 Dec 2018 21:45:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544957143; bh=K/rYGsXwnCdto6jnhcScWIjqLjqQOvNNxnz7aj+8XLw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZgjVZVmJYbm32Kh5GV3aHGcOJDe4gaowPmudZySiK6weLUWzGsiAvrxYTkVNB+1ha
         tev98KiEz90PBKDBl9Fell23RnhYsbFsw6mlKuwK9QaWh8cLqXgGfb9Hllph1qETip
         zSDkQXoM7Q+tf6uYoumLpN+BheImM1xn9cE60qes=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id B038CE20E06; Sun, 16 Dec 2018 02:45:41 -0800 (PST)
Date:   Sun, 16 Dec 2018 11:45:41 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/6] pinctrl: sh-pfc: r8a7791: Remove bogus marks from
 vin1_b_data18 group
Message-ID: <20181216104540.io365enatp2ozwdb@verge.net.au>
References: <20181213162855.14190-1-geert+renesas@glider.be>
 <20181213162855.14190-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213162855.14190-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 05:28:53PM +0100, Geert Uytterhoeven wrote:
> The vin1_b_data18_mux[] arrays contains pin marks for the 2 LSB bits of
> the color components.  The vin1_b_data18_pins[] array rightfully does
> not include the corresponding pin numbers, as RGB18 is subset of RGB24,
> containing only the 6 MSB bits of each component.
> 
> Fixes: 8e32c9671f84acd8 ("pinctrl: sh-pfc: r8a7791: Add VIN pins")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

