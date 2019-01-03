Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E8AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 11:36:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CDDE20578
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 11:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbfACLgx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 06:36:53 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:36383 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfACLgx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 06:36:53 -0500
Received: by mail-ua1-f67.google.com with SMTP id j3so10828588uap.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Jan 2019 03:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ol7oCE0rvQI822R1WV7AxNKkdHqcMHNesM16fxzD8ak=;
        b=BvVcwwsDDceRikQDaNo2xJed6j5vm4frjyuYndBsYyKVSbqfz5gR7CVGDCTB9G4knP
         Tsbt+/f1J8MAo+Lr5z3kEPI3K+m1Xh5KWIoCVtGF7dHdv3e8pnLCfx49xFyMis1w85IN
         WcSTe/wo9Gog2qi43B7SYB9JakF3KmrxL6i9D8O9xaY9+mGNsb7oF7uNJzwVBgl5ITQz
         RJYk12JZItxHJkPE13N/lCdo6LitEm64c/mnco4nowjOYkAh+u9AXLxktF/OwBwDC4g0
         nuwt8XZu4hrzqkgfgORKZlpHW8o9AtaXw+26+GH2QSiKs1jTtJ/B4DcZDUDWpK8e2319
         kNQg==
X-Gm-Message-State: AJcUukck5aPvnpSvJcDeNgtQbviH4bYJr9i0jvki3n8qrKqG2V9IWQLf
        97mnIIHdkAin4DhMHSsmpPnrD188uVNpMEVolyU=
X-Google-Smtp-Source: ALg8bN5qUuxu8iNlwZubhFUnvs96xigC45MyURg9PVQQlMkClAoNOOByitx8GnCeiRiyVgqfX7+AgCI6GJDRFYU6l8E=
X-Received: by 2002:ab0:216:: with SMTP id 22mr17526221uas.28.1546515411952;
 Thu, 03 Jan 2019 03:36:51 -0800 (PST)
MIME-Version: 1.0
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple>
 <20180620091416.s4vdg5tgkl3mnoxd@verge.net.au> <20180716074939.76mes7rt5ddqnyy6@verge.net.au>
In-Reply-To: <20180716074939.76mes7rt5ddqnyy6@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Jan 2019 12:36:40 +0100
Message-ID: <CAMuHMdUmy0YpGcLmd=nwRRAJxggKE78jqzFXmmznZvE4m6BaJw@mail.gmail.com>
Subject: Re: [PATCH v2 00/03] arm64: dts: renesas: Add IPMMU device nodes V2
To:     Simon Horman <horms@verge.net.au>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 16, 2018 at 9:50 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Jun 20, 2018 at 11:14:17AM +0200, Simon Horman wrote:
> > On Sun, Jun 17, 2018 at 07:42:04PM +0900, Magnus Damm wrote:
> > > arm64: dts: renesas: Add IPMMU device nodes V2
> > >
> > > [PATCH v2 01/03] arm64: dts: renesas: r8a77965: Add IPMMU devices nodes
> > > [PATCH v2 02/03] arm64: dts: renesas: r8a77980: Add IPMMU devices nodes
> > > [PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
> > >
> > > This series is the second attempt to add IPMMU device nodes to R-Car M3-N,
> > > R-Car V3H and R-Car E3 SoCs.
> > >
> > > The IPMMU DT binding changes are not yet merged upstream however they
> > > have been documented by the following patches:
> > >
> > > [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings
> > > [PATCH] iommu/ipmmu-vmsa: Document R-Car V3H and E3 IPMMU DT bindings
> > >
> > > Please see each individual patch for list of changes.
> >
> > Hi Magnus,
> >
> > as per my comment on v1, did you consider merging these patches into one
> > patch. Olof has asked that we consider such consolidation.
>
> The above dependencies now appear have been accepted for v4.19.
>
> I have now applied this series. I took the liberty of squashing all three
> patches into one. The result is as follows.
>
>
> From: Magnus Damm <damm+renesas@opensource.se>
> Date: Sun, 17 Jun 2018 19:42:13 +0900
> Subject: [PATCH] arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices
>  nodes
>
> Add IPMMU device nodes for the R-Car M3-N (r8a77965),
> V3H (r8a77980) and E3 (r8a77990) SoCs.
>
> * The r8a77965 IPMMU is quite similar to r8a7796 however VP0
>   has been added and PV1 has been removed. Also the IMSSTR
>   bit assignment has been reworked.

> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi

> +               ipmmu_ir: mmu@ff8b0000 {
> +                       compatible = "renesas,ipmmu-r8a77965";
> +                       reg = <0 0xff8b0000 0 0x1000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 3>;
> +                       power-domains = <&sysc R8A77965_PD_A3IR>;
> +                       #iommu-cells = <1>;
> +               };

Please note that R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Aug 24,
2018) removed the IPMMU-IR IOMMU instance on R-Car M3-N, as this SoC
does not have an Image Processing Unit (IMP-X5) nor the A3IR power domain.

I've sent a patch to fix that.

> * The r8a77980 IPMMU is quite similar to r8a77970 however VC0
>   has been added. The IMSSTR bit assignment has also been
>   reworked. Power domains are also quite different however the
>   the documentation is rather unclear about this topic.
>
>   Until we know better VC0 gets assigned to R8A77980_PD_ALWAYS_ON.

JFTR, this matches the R-Car Gen3 HardWare Manual Errata for Rev. 1.00
(Jul 20, 2018).

> * The r8a77990 IPMMU is similar to r8a77995. Power domains are
>   however different and the public documentation is still unclear.
>
>   Based on preliminary information from the hardware team the R-Car E3
>   SoC comes with an IPMMU-VP0 device in an Always-on power domain and
>   the IPMMU-VC0 is placed as expected in the A3VC power domain.

JFTR, this matches the R-Car Gen3 HardWare Manual Errata for Rev. 1.00
(Jul 20, 2018).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
