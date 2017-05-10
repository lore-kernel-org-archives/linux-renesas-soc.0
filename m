Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58292 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752066AbdEJLw0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 07:52:26 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 3/7] arm64: dts: renesas: salvator-x: Enable HDMI outputs
Date: Wed, 10 May 2017 14:52:24 +0300
Message-ID: <3272565.o4gaMbvL4P@avalon>
In-Reply-To: <CAMuHMdU1UPjwEQh4LoNUqUEv58ML=BWOA_VMKLGn2YE7L-22Lg@mail.gmail.com>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com> <20170510070458.21193-4-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdU1UPjwEQh4LoNUqUEv58ML=BWOA_VMKLGn2YE7L-22Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday 10 May 2017 10:28:11 Geert Uytterhoeven wrote:
> On Wed, May 10, 2017 at 9:04 AM, Laurent Pinchart wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > 
> > Instantiate the HDMI connectors and enable the encoders.
> > 
> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  arch/arm64/boot/dts/renesas/salvator-x.dtsi | 50 ++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> > b/arch/arm64/boot/dts/renesas/salvator-x.dtsi index
> > d5eb022d247c..2cd0cce818e7 100644
> > --- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
> > @@ -151,6 +151,30 @@
> >                           1800000 0>;
> >         };
> > 
> > +       hdmi0-out {
> 
> Can you please respect sort order when inserting new nodes?
> Thanks!

Doesn't it make more sense to keep all display outputs grouped together 
instead of scattering them over the file ?

-- 
Regards,

Laurent Pinchart
