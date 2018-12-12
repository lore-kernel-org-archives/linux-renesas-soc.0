Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80717C04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46EAE20839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 10:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="LUPrtJrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46EAE20839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbeLLK6g (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 05:58:36 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:44594 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbeLLK6g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 05:58:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 39E0725AE79;
        Wed, 12 Dec 2018 21:58:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544612314; bh=CiUg4OLleTXIEM0vlkrYYbv71DzfbI887k/ZihlVdOM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LUPrtJrLy1PnNs6FqXJQWT7nF7QZ3DQxxLYIFyiHsGbVT17D81clOtnbmG4wDr3+q
         yhjxRi7mR1t9RaX2w6i8ZHP8AKVMUv6PQeSYmY1o0//Xlt2Z9UUN8Di8s4njxEVCO1
         oRA9fHqJgwex6b1Hic3eumFKFKSD0aHY9AJ3SDIQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 98B699404C7; Wed, 12 Dec 2018 11:58:32 +0100 (CET)
Date:   Wed, 12 Dec 2018 11:58:32 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a77995: draak: Add backlight
Message-ID: <20181212105831.g2pnby33iykl7xsm@verge.net.au>
References: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXq7vyo6WF1L8JigX_=HKbBSQdoMJB5hpUmyXrE0O1oTw@mail.gmail.com>
 <CAMuHMdUKxTVuroRuwQCWp9OZufJKRSM-dN_ee0zKj9OhNy273Q@mail.gmail.com>
 <4097394.UXB4c1edBM@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4097394.UXB4c1edBM@avalon>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 10, 2018 at 02:33:08PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Monday, 10 December 2018 14:30:22 EET Geert Uytterhoeven wrote:
> > On Tue, Dec 4, 2018 at 6:36 PM Geert Uytterhoeven wrote:
> > > On Sun, Nov 25, 2018 at 3:40 PM Laurent Pinchart wrote:
> > >> Add the backlight device for the LVDS1 output, in preparation for panel
> > >> support.
> > >> 
> > >> Signed-off-by: Laurent Pinchart
> > >> <laurent.pinchart+renesas@ideasonboard.com>
> > > 
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Oops, seems I missed the backlight node should be moved up, to preserve
> > sort order.
> 
> I assumed that aliases and chosen should be kept at the top of the file.
> Maybe we don't want to keep the tradition :-)

There is precedence for this tradition in salvator-common.dtsi.
I am ambivalent at this point.
