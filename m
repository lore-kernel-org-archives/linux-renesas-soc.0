Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41840 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932253AbcHKPg6 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 11 Aug 2016 11:36:58 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: salvator-x: Enable DU
Date: Thu, 11 Aug 2016 18:37:03 +0300
Message-ID: <2249176.5GrCTAfsB5@avalon>
In-Reply-To: <CAMuHMdXKVocK4pCF8h6h53263AzFfO9wdmN7wigH5xvLUpTA-g@mail.gmail.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1470745752-23738-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXKVocK4pCF8h6h53263AzFfO9wdmN7wigH5xvLUpTA-g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday 11 Aug 2016 11:17:17 Geert Uytterhoeven wrote:
> On Tue, Aug 9, 2016 at 2:29 PM, Laurent Pinchart wrote:
> > Only the VGA output is supported for now.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> One question below, though...
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> > @@ -135,6 +135,50 @@
> > 
> > +&du {
> > +       status = "okay";
> 
> Don't you need pinctrl properties? Or are you relying on initial settings?
> 
> GPSR initial settings for DU depend on MD[4:1] i.e. SW10[5:8].
> The defaults on my board are not 0000, so all DU pins are GPIOs?
> IPSR initial settings don't seem to be documented.

pinctrl configuration is needed, but isn't available yet in the sh-pfc driver. 
I guess I'll just have to bite the bullet and add it :-)

-- 
Regards,

Laurent Pinchart
