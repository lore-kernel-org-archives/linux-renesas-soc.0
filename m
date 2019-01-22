Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58FAC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 20:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9436621726
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 20:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gaAU7fu+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfAVUmb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 15:42:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54810 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbfAVUmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 15:42:31 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EEF7575;
        Tue, 22 Jan 2019 21:42:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548189749;
        bh=av0qSu37DQCEFH3fZ5I1PZrRT1wz/+ii/hG5PUoCTlM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaAU7fu+w/g6gY2TjOETYn9lSZo1pz6Pp5TvqEKUSLRv3qAcTZR4rUQIkj4J8NC5p
         UF1HpkhLC3tX/y9865osV8Mpn5vPGsOMIlVr88PM5kI3Y30KnU5enRL4TS1KRtevrO
         /dVL2D+OctE9TL1SAGzzZZydc+YPxe49YD4KhIno=
Date:   Tue, 22 Jan 2019 22:42:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a77990: ebisu: Enable LVDS1
 encoder
Message-ID: <20190122204228.GD3264@pendragon.ideasonboard.com>
References: <20190117014946.9669-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190117014946.9669-6-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWYgAnxxUud89uGWBePK6UfVt2T=gumMmzs_SF95Ap36Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdWYgAnxxUud89uGWBePK6UfVt2T=gumMmzs_SF95Ap36Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Thu, Jan 17, 2019 at 11:21:32AM +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 17, 2019 at 3:07 AM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The LVDS1 encoder must supply a pixel clock to the DU for the DPAD
> > output when the LVDS0 encoder is used. Enable it despite its output not
> > being connected.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -443,6 +443,8 @@
> >  };
> >
> >  &lvds1 {
> 
> Would it make sense to add a comment
> 
>     /* Must be enabled to supply a pixel clock to the DU for the DPAD
> output when lvds0 is used */
> 
> also for D3?

Good point, I'll add it for both.

> > +       status = "okay";
> > +
> >         clocks = <&cpg CPG_MOD 727>,
> >                  <&x13_clk>,
> >                  <&extal_clk>;

-- 
Regards,

Laurent Pinchart
