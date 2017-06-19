Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:44640 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751824AbdFSITo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 04:19:44 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: Add support for the DU
Date: Mon, 19 Jun 2017 11:20:17 +0300
Message-ID: <10362663.vLNLkENAvz@avalon>
In-Reply-To: <20170616123809.GC23030@verge.net.au>
References: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdX=ufC1=tSodCDzy_THK1HjdJ9fXnu9W3P8CBso6uyZNA@mail.gmail.com> <20170616123809.GC23030@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Friday 16 Jun 2017 14:38:10 Simon Horman wrote:
> On Fri, Jun 16, 2017 at 09:34:02AM +0200, Geert Uytterhoeven wrote:
> > On Thu, Jun 15, 2017 at 9:37 AM, Laurent Pinchart wrote:
> >> Add a compatible string and VSP links to the DU node. The H3 ES1.x and
> >> H3 ES2.0 are compatible save for the links to the VSPs that are
> >> described explicitly in DT, so there's no need for a new ES2-specific
> >> compatible string.
> >> 
> >> Signed-off-by: Laurent Pinchart
> >> <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> >> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> >> @@ -1743,6 +1743,7 @@
> >>                 };
> >>                 
> >>                 du: display@feb00000 {
> >> +                       compatible = "renesas,du-r8a7795";
> > 
> > Hence the "override" in r8a7795-es1.dtsi can be removed.
> 
> Laurent do you want me to queue this up with the expectation of
> you providing a follow-up patch?

There will be a v2 of this series, so I think you can ignore v1 for now.

-- 
Regards,

Laurent Pinchart
