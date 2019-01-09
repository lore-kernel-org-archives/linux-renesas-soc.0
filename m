Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 15:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9737D206BA
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 15:26:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732277AbfAIP0k (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 10:26:40 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36826 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730871AbfAIP0j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 10:26:39 -0500
Received: by mail-vs1-f68.google.com with SMTP id v205so4979182vsc.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jan 2019 07:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2tt3B9acyjfAExY8a/1A++5JZZbSlHZnR9d/w9wgWsQ=;
        b=Gi2A+4YBI4EujXl8vxhNISGm21L9wbQQ+8VHrF2z7rpxW29kR3loSbdIopdHGKHWlj
         k9BMbIhyDCneoWTmF1GAyObnsH4z5WK0zBHSPRb+sCsJOH48gMfCZXcr7AryzLiWVJvo
         kdKaVu3ph05C5NcL68jv4UzKr3PEgjpVSKVMPHCXzYPXOqBaP2QIah3poJS7K9FFcgsn
         79T4jM7FEFQdP3Bk0LWxhKKK316HJCnoHg4nkiIXqckSkzcTdpbCcA/OHYK76Zknhi2u
         Z+ibjExhfyqyBUsBT9OoZY+IwJj1Hdxl8FeBuPRPNO9tdjJyK1OITkevJ89eelNpsnX/
         LdvA==
X-Gm-Message-State: AJcUukeJMduSkrdTXeklLSthNsJo7hZ9xtF1bVo3oHU50+NqdgU1ltGD
        sBr6/FcMS51jqvqvVSnjPU+lmorKwfo2R66lwzg=
X-Google-Smtp-Source: ALg8bN4Y8vtCBKzMn+5DqAraiqmkzOqBR04HeYEgHw10qE9fNoWBKCOKCAbfuvuCcdcA9PhZ4OFPYzdQmgsOTiJcgbs=
X-Received: by 2002:a67:c202:: with SMTP id i2mr2435652vsj.11.1547047598700;
 Wed, 09 Jan 2019 07:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20190109140045.17449-1-marek.vasut@gmail.com>
In-Reply-To: <20190109140045.17449-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jan 2019 16:26:25 +0100
Message-ID: <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix backlight
 regulator numbering
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 9, 2019 at 3:01 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
> the eMMC and one 12V for the backlight. This causes one to be overwritten
> by the other, ultimatelly resulting in inoperable eMMC, which depends on
> the former. Fix this by renumbering the backlight regulator to regulator2.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add backlight")

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -191,7 +191,7 @@
>                 clock-frequency = <24576000>;
>         };
>
> -       reg_12p0v: regulator1 {
> +       reg_12p0v: regulator2 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "D12.0V";
>                 regulator-min-microvolt = <12000000>;

Perhaps the node name should get a more descriptive suffix
(e.g. "regulator-12p0v"), like is already done for some of the other
regulators?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
