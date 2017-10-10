Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41768 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752207AbdJJHs6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 03:48:58 -0400
Date: Tue, 10 Oct 2017 09:48:42 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: eagle: add EtherAVB support
Message-ID: <20171010074842.GN2518@verge.net.au>
References: <20170915194449.538504992@cogentembedded.com>
 <CAMuHMdXQXFuVzwW7G-U7XWZUEj8qFRjtfDQF1+TgyzO0Xb+eYg@mail.gmail.com>
 <c0390fc1-7da4-ac60-afee-97126d1fd372@cogentembedded.com>
 <CAMuHMdVCTORpfKN+GTka_6pT1VWjOneV2GBhGo7Y8DsZYSxdvw@mail.gmail.com>
 <20171005090500.GC26369@verge.net.au>
 <d5940a12-3823-eebb-50d9-c0fd0fcf0fd1@cogentembedded.com>
 <20171010073346.GL2518@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171010073346.GL2518@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 10, 2017 at 09:33:46AM +0200, Simon Horman wrote:
> On Mon, Oct 09, 2017 at 08:57:42PM +0300, Sergei Shtylyov wrote:
> > On 10/05/2017 12:05 PM, Simon Horman wrote:
> > 
> > >>>On 9/21/2017 4:08 PM, Geert Uytterhoeven wrote:
> > >>>>>Define the Eagle board  dependent part of the EtherAVB device node.
> > >>>>>Enable DHCP  and NFS root for the kernel booting.
> > >>>>>
> > >>>>>Based  on the original (and large) patch by Vladimir Barinov.
> > >>>>>
> > >>>>>Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > >>>>>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > >>>>
> > >>>>
> > >>>>>--- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> > >>>>>+++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> > >>>
> > >>>[...]
> > >>>>>
> > >>>>>@@ -43,3 +44,14 @@
> > >>>>>   &scif0 {
> > >>>>>          status = "okay";
> > >>>>>   };
> > >>>>>+
> > >>>>>+&avb {
> > >>>>>+       renesas,no-ether-link;
> > >>>>>+       phy-handle = <&phy0>;
> > >>>>>+       status = "okay";
> > >>>>>+
> > >>>>>+       phy0: ethernet-phy@0 {
> > >>>>>+               rxc-skew-ps = <1500>;
> > >>>>>+               reg = <0>;
> > >>>>
> > >>>>
> > >>>>Any specific reason why you don't want to wire up the interrupt?
> > >>>>
> > >>>>                  interrupt-parent = <&gpio2>;
> > >>>
> > >>>
> > >>>    I thought it's quite obvious -- we don't have GPIOs yet, and GPIOs seem
> > >>>to require PFC.
> > >>
> > >>Of course. And these can be added later.
> > >>
> > >>Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > >Thanks, applied.
> > 
> >    Unfortunately, you applied an outdated version of this patch. :-(
> 
> Sorry, I think patchwork has been playing up of late - or my use of it!
> 
> Could you repost the correct patch so I am sure to get the right one
> the second time around?

Please ignore that request. I'll go ahead and apply v2.
