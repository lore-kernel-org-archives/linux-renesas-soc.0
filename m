Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41163 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731324AbeKNBTK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 20:19:10 -0500
Received: by mail-vs1-f67.google.com with SMTP id t17so7473817vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Nov 2018 07:20:35 -0800 (PST)
MIME-Version: 1.0
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
 <20181107112115.5d2l2tfpf6nvuvca@verge.net.au> <20181113142909.mp3wxbao6ehs3776@verge.net.au>
In-Reply-To: <20181113142909.mp3wxbao6ehs3776@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Nov 2018 16:20:23 +0100
Message-ID: <CAMuHMdWFcp=6fQ50kDaBsFFE9NG=hW=XeS1a2KG-KTtn+usbuA@mail.gmail.com>
Subject: Re: [PATCH 00/03] Connect R-Car Gen3 Ethernet-AVB to IPMMU
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Nov 13, 2018 at 3:31 PM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Nov 07, 2018 at 12:21:16PM +0100, Simon Horman wrote:
> > On Mon, Oct 22, 2018 at 02:14:34AM +0900, Magnus Damm wrote:
> > > Connect R-Car Gen3 Ethernet-AVB to IPMMU
> > >
> > > [PATCH 01/03] arm64: dts: renesas: r8a77965: Connect R-Car M3-N AVB to IPMMU
> > > [PATCH 02/03] arm64: dts: renesas: r8a77980: Connect R-Car V3H AVB to IPMMU
> > > [PATCH 03/03] arm64: dts: renesas: r8a77990: Connect R-Car E3 AVB to IPMMU
> > >
> > > For each SoC describe Ethernet-AVB to IPMMU hardware connection in the
> > > Device Tree. This series affects R-Car M3-N, V3H and E3. Other members
> > > of the R-Car Gen3 family such as H3, M3-W, V3M and D3 already includes
> > > this information in their DT files.
> > >
> > > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >
> > Hi,
> >
> > I have already queued-up these patches but I noticed that
> > they do the same thing to different SoCs and recently the ARM-SoC
> > maintainers have asked us to consolidate such patches. With that in mind
> > I am considering squashing the three patches that comprise this series into
> > one. Are there any objections?
>
> I have now gone ahead and done so. The result is as follows:
>
> From: Magnus Damm <damm@opensource.se>
> Subject: [PATCH] ARM: dts: r8a7740, emev2, sh73a0: Include SoC name in DTSI
>
> Update the R-Mobile A1 (r8a7740), Emma Mobile EV2 (emev2) and
> SH-Mobile AG5 (sh72a0) DTSI to include product name.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> [simon: squashed similar patches]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Wrong email thread?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
