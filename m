Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60995 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729034AbeKPApK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 19:45:10 -0500
Date: Thu, 15 Nov 2018 06:37:02 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 00/03] Connect R-Car Gen3 Ethernet-AVB to IPMMU
Message-ID: <20181115143701.m6ula4o7vigkn2yo@verge.net.au>
References: <154014207424.4344.6894320987219157257.sendpatchset@octo>
 <20181107112115.5d2l2tfpf6nvuvca@verge.net.au>
 <20181113142909.mp3wxbao6ehs3776@verge.net.au>
 <CAMuHMdWFcp=6fQ50kDaBsFFE9NG=hW=XeS1a2KG-KTtn+usbuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWFcp=6fQ50kDaBsFFE9NG=hW=XeS1a2KG-KTtn+usbuA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 13, 2018 at 04:20:23PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Nov 13, 2018 at 3:31 PM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Nov 07, 2018 at 12:21:16PM +0100, Simon Horman wrote:
> > > On Mon, Oct 22, 2018 at 02:14:34AM +0900, Magnus Damm wrote:
> > > > Connect R-Car Gen3 Ethernet-AVB to IPMMU
> > > >
> > > > [PATCH 01/03] arm64: dts: renesas: r8a77965: Connect R-Car M3-N AVB to IPMMU
> > > > [PATCH 02/03] arm64: dts: renesas: r8a77980: Connect R-Car V3H AVB to IPMMU
> > > > [PATCH 03/03] arm64: dts: renesas: r8a77990: Connect R-Car E3 AVB to IPMMU
> > > >
> > > > For each SoC describe Ethernet-AVB to IPMMU hardware connection in the
> > > > Device Tree. This series affects R-Car M3-N, V3H and E3. Other members
> > > > of the R-Car Gen3 family such as H3, M3-W, V3M and D3 already includes
> > > > this information in their DT files.
> > > >
> > > > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > >
> > > Hi,
> > >
> > > I have already queued-up these patches but I noticed that
> > > they do the same thing to different SoCs and recently the ARM-SoC
> > > maintainers have asked us to consolidate such patches. With that in mind
> > > I am considering squashing the three patches that comprise this series into
> > > one. Are there any objections?
> >
> > I have now gone ahead and done so. The result is as follows:
> >
> > From: Magnus Damm <damm@opensource.se>
> > Subject: [PATCH] ARM: dts: r8a7740, emev2, sh73a0: Include SoC name in DTSI
> >
> > Update the R-Mobile A1 (r8a7740), Emma Mobile EV2 (emev2) and
> > SH-Mobile AG5 (sh72a0) DTSI to include product name.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > [simon: squashed similar patches]
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Wrong email thread?

Yes, oops.
