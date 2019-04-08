Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40600C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 13:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 106DD213F2
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 13:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MTkHBjuR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfDHNCE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 09:02:04 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52553 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfDHNCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 09:02:04 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 333E025B80D;
        Mon,  8 Apr 2019 23:02:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554728522; bh=Jq9WC78y7JQExyO2QDR6/NjGWNWUXF5nZ4tXicdmbAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MTkHBjuRCopscrPYT1urTIKcCIUMYihykY+UreYbmOm0xga4x5OKd5jx9+RQqVQZ9
         OeUUX+iJ8o90w3BlLOqpKV9ZpAU6QjWR6m0j2TFXAcTyRinPR7rjJkWq/cJRhtLqXP
         01hZCBsf6fziLMy2dL4SJR7VpsdxBTSrWUkOJ4UE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6462E94069B; Mon,  8 Apr 2019 15:02:00 +0200 (CEST)
Date:   Mon, 8 Apr 2019 15:02:00 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190408130159.qwqttnl747tyiqwz@verge.net.au>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <20190408090104.GB1615@kunai>
 <20190408094823.24bbzfp63mhzdkaa@verge.net.au>
 <20190408111252.GB4553@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408111252.GB4553@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 08, 2019 at 01:12:52PM +0200, Wolfram Sang wrote:
> ^
> > > > +static const struct soc_device_attribute ravb_delay_mode_quirk_match[] = {
> > > > +	{ .soc_id = "r8a77990", .revision = "ES1.*" },
> > > > +	{ .soc_id = "r8a77995", .revision = "ES1.*" },
> > > > +	{ /* sentinel */ }
> > > > +};
> > > 
> > > I might have missed it but is there a plan to fix this in later
> > > revisions of D3/E3? I was under the impression that it is not and then
> > > we could base it on compatible rather than soc_device_match?
> > 
> > I am not aware of any such plan (or the absence of such a plan).
> > 
> > I was unsure weather to go with the compat approach of the quirk approach.
> > In the end I went with the quirk approach as it seems simpler. But
> > I'm happy to re-arrange things.
> 
> I see. Well, I don't care super much. The tiny drawback here is that we
> will have a potentially broken D3/E3 ES2.0, if they have not fixed TXID
> there. Then we need to update the above pattern. So, revision = "*" (or
> the compatible approach) might be a tad better. Then we "only" have 1G
> disabled for no reason until we whitelist it.

I do think that the quirk approach is cleaner, So all things being equal
I'd slightly prefer to stick with that approach. Shall I drop
the .revision portion?
