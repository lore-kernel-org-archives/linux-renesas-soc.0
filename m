Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFC7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:12:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DDDA20874
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fVa0u/gq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731199AbfAKOMX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 09:12:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34170 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfAKOMW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 09:12:22 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9640E25B819;
        Sat, 12 Jan 2019 01:12:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547215940; bh=Tnd5FzovYCvcDGZLjGqRV1ukw4pt6APp994xlBe/kw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fVa0u/gq6J3RVxwrhN41EtwNitqs4tNf6500htDW17DwKOIe5AaRNimaH0fiVx092
         dB1GPSaHJCu3V4dbPa3ywknjdJq6dVeucNQVVCa8wqkgpTkNpYWrI/ZAmT2ZnvYwDv
         nK1xfbkX5coreq+IGgc/tqWOEE9Lj3+Apl4pwPp8=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 83020E21282; Fri, 11 Jan 2019 06:12:18 -0800 (PST)
Date:   Fri, 11 Jan 2019 15:12:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
Message-ID: <20190111141217.gsxwevwg3rqnexld@verge.net.au>
References: <20190111115020.29147-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111115020.29147-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 12:50:20PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> MOD_SEL register bit numbering was different from R-Car D3 SoC and
> R-Car H3/M3-[WN] SoCs.
> 
> MOD_SEL 1-bit      H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'0         b'0
> Set Value = H'1    b'1         b'1
> 
> MOD_SEL 2-bits     H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'00        b'00
> Set Value = H'1    b'01        b'10
> Set Value = H'2    b'10        b'01
> Set Value = H'3    b'11        b'11
> 
> MOD_SEL 3-bits     H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'000       b'000
> Set Value = H'1    b'001       b'100
> Set Value = H'2    b'010       b'010
> Set Value = H'3    b'011       b'110
> Set Value = H'4    b'100       b'001
> Set Value = H'5    b'101       b'101
> Set Value = H'6    b'110       b'011
> Set Value = H'7    b'111       b'111
> 
> This patch replaces the #define name and value of MOD_SEL.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 794a67117646 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> [shimoda: split a patch per SoC and revise the commit log]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [geert: Use a macro to do the actual reordering]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested as we don't know how to test the impact of MOD_SEL bits on
> output pins.
> 
> Using a macro makes the code easier to write, read, and maintain.
> Use "git show --color-words" to see the difference.
> 
> I'd love to handle the reversal in the PINMUX_CFG_REG_VAR()
> descriptions, but I can't use e.g. REV4(MOD_SEL0_24_23) there, as
> MOD_SEL0_24_23 is a single parameter, not 4 parameters.
> 
> Can this be improved?

Likely but nothing springs to mind.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

