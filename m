Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36471 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858AbcDZNn2 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 09:43:28 -0400
Received: by mail-lf0-f48.google.com with SMTP id u64so16416096lff.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2016 06:43:27 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 26 Apr 2016 15:43:25 +0200
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 31/47] ARM: dts: r8a7794: Reference both DMA controllers
 in SCIFA nodes
Message-ID: <20160426134325.GO28777@bigcity.dyn.berto.se>
References: <cover.1459732726.git.horms+renesas@verge.net.au>
 <65c295f4b305330162795b0cc2508a207ed23a98.1459732726.git.horms+renesas@verge.net.au>
 <CAOesGMgBBmUvoWdb35vcq0UAJNkMk5LD6-ERWDAaSKWEpGwu9A@mail.gmail.com>
 <CAMuHMdUUz-0EhgogpHGV-yE6htbwvAjuoAm2+DtDLa3xiG1XkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUUz-0EhgogpHGV-yE6htbwvAjuoAm2+DtDLa3xiG1XkA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd and Olof,

It seems Arnd have been dropped from this thread and I would appreciate 
your feedback on this. Do you think it is a good idea to reference both 
DMA controllers in this fashion to be able to get channels from either 
of the two DMA controllers?

Also to both of you if this is a good solution would you like me to 
squash the patches per SoC and resend it? Olof pointed out it might be a 
bit silly to do this in so many patches.

On 2016-04-13 21:55:14 +0200, Geert Uytterhoeven wrote:
> Hi Olof,
> 
> On Wed, Apr 13, 2016 at 9:48 PM, Olof Johansson <olof@lixom.net> wrote:
> > On Sun, Apr 3, 2016 at 6:23 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> >> diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
> >> index eacb2b291361..4256557ca041 100644
> >> --- a/arch/arm/boot/dts/r8a7794.dtsi
> >> +++ b/arch/arm/boot/dts/r8a7794.dtsi
> >> @@ -296,8 +296,9 @@
> >>                 interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> >>                 clocks = <&mstp2_clks R8A7794_CLK_SCIFA0>;
> >>                 clock-names = "fck";
> >> -               dmas = <&dmac0 0x21>, <&dmac0 0x22>;
> >> -               dma-names = "tx", "rx";
> >> +               dmas = <&dmac0 0x21>, <&dmac0 0x22>,
> >> +                      <&dmac1 0x21>, <&dmac1 0x22>;
> >> +               dma-names = "tx", "rx", "tx", "rx";
> >>                 power-domains = <&cpg_clocks>;
> >>                 status = "disabled";
> >>         };
> >
> > The names are no longer unique. So a get_<foo>_by_name() function no
> > longer can work as expected.
> 
> That's intentional, and a relic of how dma_request_slave_channel_compat()
> works: if e.g. the first "tx" channel can't be gotten (e.g. because
> the referenced
> DMAC instance ran out of channels), it will try the next one.

-- 
Regards,
Niklas S�derlund
