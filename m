Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D01C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 03:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AC292085A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 03:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iIbOLdPy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfAVDHN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 22:07:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33396 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfAVDHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 22:07:13 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8C6F53E;
        Tue, 22 Jan 2019 04:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1548126431;
        bh=FN/fQpvqKol+NSaTB3FvscETpK00SgiyXoJW1odQdIY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iIbOLdPyF9sn914mGcyheoidCNc62/oP99vCEa1fCFJgWmjwZUOGT2ONiObUPHDuX
         XT2aR17Yo4Bg6siD+f5ALV1CQFEngPSBYKzPEbzf3YzjdXLdwkfjkb/je0dRyRL2w8
         pDR7jm6LaON44znmJLx3jNHn5qncvkVo6mCpt/rw=
Date:   Tue, 22 Jan 2019 05:07:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFC] drm: Remove unused Renesas SH Mobile DRM driver
Message-ID: <20190122030710.GA11769@pendragon.ideasonboard.com>
References: <20190118162258.14592-1-geert+renesas@glider.be>
 <20190121093506.GQ3271@phenom.ffwll.local>
 <CAMuHMdUzhPg_sR93J2jADS-x-NFofPJR=d6a6qpt50mhyhU-xQ@mail.gmail.com>
 <20190121101826.GT3271@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190121101826.GT3271@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Mon, Jan 21, 2019 at 11:18:26AM +0100, Daniel Vetter wrote:
>  On Mon, Jan 21, 2019 at 11:03:44AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Jan 21, 2019 at 10:35 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> On Fri, Jan 18, 2019 at 05:22:58PM +0100, Geert Uytterhoeven wrote:
> >>> Since its incarnation in v3.7 almost 7 years ago, no users of the SH
> >>> Mobile DRM driver have appeared.
> >>> 
> >>> Hence remove the driver.  It can be resurrected from git history,
> >>> if/when needed.
> >>> 
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> 
> >> I'd prefer removing the fbdev variant tbh ...
> > 
> > I understand ;-)
> > 
> > But sh_mobile_lcdc_fb is used on 5 legacy SuperH platforms, and 1 ARM
> > platform. At least the latter is working fine.
> > 
> >> Not sure why exactly the switch never happened.
> > 
> > Me neither.  I^HGoogle can't even find posted patches of board integration.
> > 
> > Note that both drivers lack DT support, which would be very desirable on
> > ARM, as graphics is the single remaining working driver on the Atmark
> > Techno Armadillo 800 EVA board not using DT.
>  
>  Ah I wondered why the drm driver isn't just automatically picked up in
>  today's neat world of DT (if you enable it in .config instead of the fbdev
>  one). It's not even using DT yet :-/

I'd prefer dropping the fbdev driver too, but that would require porting
the SH boards to the DRM driver, and implement DT support for the ARM
board. I don't think anyone is willing to invest time in this, so I'm
fine dropping this driver as the boards are pretty much dead. I would,
however, also drop the fbdev driver in that case.

-- 
Regards,

Laurent Pinchart
