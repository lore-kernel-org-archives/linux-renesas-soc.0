Return-Path: <SRS0=J+Ha=QO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF91C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B15E92147C
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Feb 2019 10:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfBGKdl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:33:41 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:38085 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfBGKdl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Feb 2019 05:33:41 -0500
Received: by mail-ua1-f68.google.com with SMTP id p9so3288649uaa.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Feb 2019 02:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GbxMf+fJtPyVruQMLobztNCdYkfsYTSFMFwlgTYcjVM=;
        b=d4Vx6mN+Fb8XpqeMbXFdJKaeE+WeCpllWLyMw7i+JR1sCpdlQH83X+iFaDn8HWpVNS
         8JQJNz4a3y5e55QXjbf7/wX2NuZl+qyc50pT4NNpUd315LA3Tz4KvURJF2XIwraCiTEI
         X3i0Ukyj2s4nhbgnMOzAhztXv0ZZzCiAWsVCSkbeepXhbHDc5k4qM1RrCwDaYui8AEIW
         lnIW4G5hkTUnL6KBCZlr8KPcEDpOGw27U3Kra5FCS0PdmFOTxgRhABA9TZi1g725aGvF
         X3it36jD6pRZ8QUZJcOolNSAML+GTClX1j4bcg8Id74Cq/wupQ3rVNpHyTZGMGQNfExm
         fbAw==
X-Gm-Message-State: AHQUAuZ85BgxNOgAJPf+JDKaeYZPpDz0on9rZToSmlqidkcJDftko+AE
        t+/VXRHB4aimxY+R5t+g14FOYCc+4skfLdo+0IU=
X-Google-Smtp-Source: AHgI3IZvLEydvT/oPvjVi6j40lbTLSLelti831IrEieTEu34OspahLVQqwzKbL/6IZWN9Iydss9H77F7+Oo5AwV9IW4=
X-Received: by 2002:a9f:2726:: with SMTP id a35mr5720618uaa.75.1549535619947;
 Thu, 07 Feb 2019 02:33:39 -0800 (PST)
MIME-Version: 1.0
References: <1543675408-11382-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdXvGEZpuDr6oWH0QGxVtfx-EUiQJ+_Jt33dZhn_Lw4EYQ@mail.gmail.com> <20190104132655.usp2mjyh2sdqds4w@verge.net.au>
In-Reply-To: <20190104132655.usp2mjyh2sdqds4w@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Feb 2019 11:33:28 +0100
Message-ID: <CAMuHMdWs2Z1csN14EGvV+HnM8Ko0Du0LY=zt=Zp9N7TD=cVdAA@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
To:     Simon Horman <horms@verge.net.au>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Jan 4, 2019 at 2:27 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Dec 03, 2018 at 09:25:30AM +0100, Geert Uytterhoeven wrote:
> > On Sat, Dec 1, 2018 at 3:43 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >
> > > This patch adds the regulator definition required for operation of
> > > S2RAM.
> > >
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > > @@ -425,6 +425,26 @@
> > >         };
> > >  };
> > >
> > > +&i2c_dvfs {
> > > +       status = "okay";
> > > +
> > > +       clock-frequency = <400000>;
> > > +
> > > +       pmic: pmic@30 {
> > > +               pinctrl-0 = <&irq0_pins>;
> > > +               pinctrl-names = "default";
> > > +
> > > +               compatible = "rohm,bd9571mwv";
> > > +               reg = <0x30>;
> > > +               interrupt-parent = <&intc_ex>;
> > > +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > > +               interrupt-controller;
> > > +               #interrupt-cells = <2>;
> > > +               gpio-controller;
> > > +               #gpio-cells = <2>;
> >
> > Just adding this node is not sufficient to make S2RAM work.
> > As per Documentation/devicetree/bindings/mfd/bd9571mwv.txt, you also have
> > to describe the DDR-Backup Power configuration.
> >
> > On the Ebisu-4D development board, only the DDR0 power rail is used, and
> > needs to be kept powered when backup mode is enabled.
> >
> >         rohm,ddr-backup-power = <0x1>;
> >         rohm,rstbmode-level;
> >
> > Unfortunately resume from s2ram doesn't work with this, probably due to an
> > issue in ATF.  This may have been fixed in IPL and Secure Monitor Rev1.0.22,
> > which claims to add support for the Ebisu-4D board.
>
> Thanks, do you know of any information on how to get IPL and Secure Monitor
> running / updated on Ebisu-4D?

This is now working with upstream ATF (v2.0-763-ga45ccf135e48efc7)

> > I don't know if plain Ebisu needs a different configuration.
> >
> > > +       };
> > > +};
> > > +
> > >  &lvds0 {
> > >         status = "okay";
> > >
> >
> > The rest is fine, hence with the above fixed and tested:
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume that working S2RAM is part of such testing.
> Is that correct?

That is correct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
