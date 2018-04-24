Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60946 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754626AbeDXJNq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:13:46 -0400
Date: Tue, 24 Apr 2018 11:13:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: r8a77965: Add R-Car Gen3 thermal support
Message-ID: <20180424091340.abrjq5qkfwmkk5vs@verge.net.au>
References: <20180417210342.16061-1-niklas.soderlund@ragnatech.se>
 <CAMuHMdWWtv0EKx4hjYNqp9zCvNCfV1Y0A-5LONwhf6FebetmmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWWtv0EKx4hjYNqp9zCvNCfV1Y0A-5LONwhf6FebetmmA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 18, 2018 at 03:55:34PM +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Apr 17, 2018 at 11:03 PM, Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Based on previous work by Ryo Kataoka <ryo.kataoka.wt@renesas.com>.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 59 +++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >
> > Hi Simon,
> >
> > This patch depends on '[PATCH 0/2] thermal: rcar_gen3_thermal: add
> > r8a77965 support'. So it's probably best you hold back applying it to
> 
> Does it? Just on the (trivial) addition of a new compatible value, right?
> 
> > such time it's dependency are accepted. I post it in any case to get
> > review comments and keep it ready for future integration in
> > renesas-drivers branches.
> 
> So I don't think the above is a blocker, but...
> 
> > It also uses numerical values for the power-doamains propery as the
> > defines where not yet available for me. This shall of course be updated
> > before they are accepted.
> 
> They're in v4.17-rc1, so you can update the patch now?

Hi Niklas,

could you find some time to address Geert's feedback.
It sounds like we could apply a v2 without further delay.
