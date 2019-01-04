Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E86C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:27:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8D8521871
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 13:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="IgPGLNXc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfADN1A (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 08:27:00 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:52529 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfADN1A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 08:27:00 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5A50B25B791;
        Sat,  5 Jan 2019 00:26:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546608418; bh=isCh6H0lOt3l85QDngid6rzi+HqrpFKJieTA3z5sGqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IgPGLNXcrpB1bvifQlOUznSkoe/1jL1lEN+g9ILUb9c9gWn5S8VZi52eSVd7xD6fG
         VYiJ9M0RfJiWzBnE/z79f+4Y16YJvL12gLOMjY1HxkafITgLBUvbP06p7PoR+R1Ab1
         +P6G5DwMhO2pmBXVFQAYEoIhLZT/hEY3VeF0Hdw4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4C975940376; Fri,  4 Jan 2019 14:26:56 +0100 (CET)
Date:   Fri, 4 Jan 2019 14:26:56 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
Message-ID: <20190104132655.usp2mjyh2sdqds4w@verge.net.au>
References: <1543675408-11382-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdXvGEZpuDr6oWH0QGxVtfx-EUiQJ+_Jt33dZhn_Lw4EYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXvGEZpuDr6oWH0QGxVtfx-EUiQJ+_Jt33dZhn_Lw4EYQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 03, 2018 at 09:25:30AM +0100, Geert Uytterhoeven wrote:
> Hi Kaneko-san,
> 
> On Sat, Dec 1, 2018 at 3:43 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds the regulator definition required for operation of
> > S2RAM.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -425,6 +425,26 @@
> >         };
> >  };
> >
> > +&i2c_dvfs {
> > +       status = "okay";
> > +
> > +       clock-frequency = <400000>;
> > +
> > +       pmic: pmic@30 {
> > +               pinctrl-0 = <&irq0_pins>;
> > +               pinctrl-names = "default";
> > +
> > +               compatible = "rohm,bd9571mwv";
> > +               reg = <0x30>;
> > +               interrupt-parent = <&intc_ex>;
> > +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > +               interrupt-controller;
> > +               #interrupt-cells = <2>;
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> 
> Just adding this node is not sufficient to make S2RAM work.
> As per Documentation/devicetree/bindings/mfd/bd9571mwv.txt, you also have
> to describe the DDR-Backup Power configuration.
> 
> On the Ebisu-4D development board, only the DDR0 power rail is used, and
> needs to be kept powered when backup mode is enabled.
> 
>         rohm,ddr-backup-power = <0x1>;
>         rohm,rstbmode-level;
> 
> Unfortunately resume from s2ram doesn't work with this, probably due to an
> issue in ATF.  This may have been fixed in IPL and Secure Monitor Rev1.0.22,
> which claims to add support for the Ebisu-4D board.

Thanks, do you know of any information on how to get IPL and Secure Monitor
running / updated on Ebisu-4D?

> I don't know if plain Ebisu needs a different configuration.
> 
> > +       };
> > +};
> > +
> >  &lvds0 {
> >         status = "okay";
> >
> 
> The rest is fine, hence with the above fixed and tested:
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume that working S2RAM is part of such testing.
Is that correct?
