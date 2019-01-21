Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DB6C7113B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 328D32084C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbfAUMaZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:30:25 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:43630 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728299AbfAUMaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:30:24 -0500
Received: by mail-vk1-f196.google.com with SMTP id o130so4531892vke.10;
        Mon, 21 Jan 2019 04:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GHivssCDV3aSD34/BY/jhIoHmEyECzlP3T6Amkybh3w=;
        b=j24i5FGNrBwVndSzVO3Hgj44OTpYUQ3RXb3DvK7tEfR9GJUm4Wr5e4pALXS8U+VOGu
         HhRsb7ndFt/U2QexH3StS9dUctTRJTWW32VeStzNMtfpIJQapbd4NYOxhwbTDwGija/T
         gb9nLv2Vx7kzEwlxHSyWOsXO5hH5at3xR7wMiXGVLv2CfVcE8eJHjG7F4vuW5MBqh6Mz
         wQeUWiPT7U9qUs+kYJmXO7/t4j/v0N1CrmoSMF3Ow3P0sFFiTGR0H8eE7KJ84fvAuUz1
         2ugylBnQfu3AE3jCpOQH/SLVE7gSmoz+e9niHAlYPmx+rgS70rc9MQtEqMmpnoqfRVKh
         iaKQ==
X-Gm-Message-State: AJcUukfX92UyvAjV4HAiGIxeNNfmiGNU2CQdKrQyYoKg8VB3NGBrY+u8
        xc684ejxI9dSFhUtMaPiuaJI+fR+9w18YWZb3Z4=
X-Google-Smtp-Source: ALg8bN6IgavxNUL5srWBwdBsqyyXcNIaUnoO56+7H2WXdlnFC2XZDHfIB7CSVSGMzKEMzcVrA0tMXOw0g0CTi9w93uk=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr11673842vkp.40.1548073823286;
 Mon, 21 Jan 2019 04:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20181220140241.20442-1-geert+renesas@glider.be> <TY2PR01MB48120531E7D6A66AF2DFD030D8B50@TY2PR01MB4812.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB48120531E7D6A66AF2DFD030D8B50@TY2PR01MB4812.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 13:30:11 +0100
Message-ID: <CAMuHMdXrV0x+xM1ERituwLzdPt2HRSHa4A0AFWc+5y7p5Q+k0w@mail.gmail.com>
Subject: Re: [PATCH/RFC] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 26, 2018 at 7:46 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, December 20, 2018 11:03 PM
> >
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > MOD_SEL register bit numbering was different from R-Car E3 SoC and
> > R-Car H3/M3-[WN] SoCs.
> >
> > MOD_SEL 1-bit      H3/M3-[WN]  E3
> > ===============    ==========  =====
> > Set Value = H'0    b'0         b'0
> > Set Value = H'1    b'1         b'1
> >
> > MOD_SEL 2-bits     H3/M3-[WN]  E3
> > ===============    ==========  =====
> > Set Value = H'0    b'00        b'00
> > Set Value = H'1    b'01        b'10
> > Set Value = H'2    b'10        b'01
> > Set Value = H'3    b'11        b'11
> >
> > MOD_SEL 3-bits     H3/M3-[WN]  E3
> > ===============    ==========  =====
> > Set Value = H'0    b'000       b'000
> > Set Value = H'1    b'001       b'100
> > Set Value = H'2    b'010       b'010
> > Set Value = H'3    b'011       b'110
> > Set Value = H'4    b'100       b'001
> > Set Value = H'5    b'101       b'101
> > Set Value = H'6    b'110       b'011
> > Set Value = H'7    b'111       b'111
> >
> > This patch replaces the #define name and value of MOD_SEL.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Fixes: 6d4036a1e3b3 ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
> > [shimoda: Split a patch per SoC and revise the commit log]
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > [geert: Use macros to do the actual reordering]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Using a macro makes the code easier to writ, read, and maintain.
> > Use "git show --color-words" to see the difference.
> >
> > I'd love to handle the reversal in the PINMUX_CFG_REG_VAR()
> > descriptions, but I can't use e.g. REV8(MOD_SEL0_19_18_17) there, as
> > MOD_SEL0_19_18_17 is a single parameter, not 8 parameters.
> >
> > Can this be improved?
>
> Thank you for updating the patch to use the macros!
> I think this patch can improve readability.
>
> So,
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, queuing in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
