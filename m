Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30409C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 02:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECDE920870
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 02:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C9PlEwDW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbfCYCan (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 24 Mar 2019 22:30:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34180 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729154AbfCYCan (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Mar 2019 22:30:43 -0400
Received: from pendragon.ideasonboard.com (30.net042126252.t-com.ne.jp [42.126.252.30])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EB77E2;
        Mon, 25 Mar 2019 03:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1553481041;
        bh=prKl9SlIgqLCcpuQsf8DsrM8847AWpMs5QuZA8LCoHg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C9PlEwDWoJ9xNFtVNg7hB6Qg4C9UvNQjGg+qjo8a4vbtF6pkyFsT/WsXsFBjHnyZD
         GI1kdurZ1ms0T4r5WvmTaTFfeQEwFKOdsWsGutALS9zdKa+hArImAVKdLaD8xqBwIR
         Hg2/VH/dTqOvUeXJBNWY2WnTuFEUv1L7GtBJaNgY=
Date:   Mon, 25 Mar 2019 04:30:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Add GPIO keys
 support
Message-ID: <20190325023029.GB12029@pendragon.ideasonboard.com>
References: <20180819194455.25096-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdW4ium4s97+1iOHkhBGw3LdfPyfxXq4_7ic+VtXzRpE2g@mail.gmail.com>
 <20180906094231.eccvg2asl7kgotu2@verge.net.au>
 <2032675.nQfVxexfDx@avalon>
 <20180912102534.vrocfv2mdrjuk2ev@verge.net.au>
 <CAMuHMdU0NqdN7efjDMcabXuWAFJy3eQSFHWxcjYaRMjz=+vKJQ@mail.gmail.com>
 <20180917071041.jobxfznnla3mnuga@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180917071041.jobxfznnla3mnuga@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Sep 17, 2018 at 09:10:42AM +0200, Simon Horman wrote:
> On Wed, Sep 12, 2018 at 01:59:53PM +0200, Geert Uytterhoeven wrote:
> > On Wed, Sep 12, 2018 at 12:25 PM Simon Horman <horms@verge.net.au> wrote:
> >> On Thu, Sep 06, 2018 at 12:59:20PM +0300, Laurent Pinchart wrote:
> >>> On Thursday, 6 September 2018 12:42:32 EEST Simon Horman wrote:
> >>>> On Thu, Aug 23, 2018 at 11:58:54AM +0200, Geert Uytterhoeven wrote:
> >>>>> On Sun, Aug 19, 2018 at 9:44 PM Laurent Pinchart wrote:
> >>>>>> The Salvator-X and XS boards have a 4 lines DIP switch and 3 push
> >>>>>> buttons connected to SoC GPIOs, meant to be used as general-purpose test
> >>>>>> keys. Add a corresponding node in DT, mapping (semi-randomly) the DIP
> >>>>>> switch to keys 1-4 and the push buttons to keys A-C.
> >>>>>>
> >>>>>> Signed-off-by: Laurent Pinchart
> >>>>>> <laurent.pinchart+renesas@ideasonboard.com>
> >>>>>
> >>>>> Given GP6_1[123] are not just wired to the 3 push buttons, but also to 3
> >>>>> LEDs, I wonder if we shouldn't postpone that part until Linux can handle
> >>>>> GPIOs connected to both?
> >>>>
> >>>> Laurent, any thoughts on that?
> >>>
> >>> Right now the GPIOs are not wired in DT, and we're thus without a way to
> >>> interface to both LEDs and push buttons. While I agree that an ideal
> >>> solution would be to support both, I think that moving from nothing to
> >>> support for push buttons would be a step forward already.
> >>
> >> I tend to agree. Geert, what are your thoughts?
> > 
> > Fine for me.
> > 
> > Just one more bikeshedding question: what's most useful, buttons or LEDs? ;-)
> 
> Lets go with the buttons.
> 
> Applied for v4.20.

Shouldn't it have made it to Linus' tree then ? :-)

-- 
Regards,

Laurent Pinchart
