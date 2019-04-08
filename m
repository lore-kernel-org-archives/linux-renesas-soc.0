Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4018EC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6E6320870
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="MwnGa9v8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfDHJsa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:48:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49715 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbfDHJsa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 05:48:30 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1FE8925B766;
        Mon,  8 Apr 2019 19:48:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554716908; bh=SHnoSWsB6gcDfAFx6zke2Otd7TQibxqmk22q+2cmjNM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MwnGa9v8X01aptpVidsrbmSwSLcfTdpzFuQWn6Hr9q+bEFFA+yMNrdcSdJVVXZ8vZ
         DG2BXQnT28OULi4ZLk8JD6VdwDuCI13AuT+GRi92ECFCnLA3c5i3B+VYo3giqz9n1p
         p29rE8KU6hhtgs2omUhG/a5IpLoVKnWsMMZeLl1A=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 29C5394069B; Mon,  8 Apr 2019 11:48:26 +0200 (CEST)
Date:   Mon, 8 Apr 2019 11:48:26 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190408094823.24bbzfp63mhzdkaa@verge.net.au>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <20190408090104.GB1615@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408090104.GB1615@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 08, 2019 at 11:01:04AM +0200, Wolfram Sang wrote:
> On Mon, Apr 08, 2019 at 10:29:28AM +0200, Simon Horman wrote:
> > According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> > August 24, 2018, the TX clock internal delay mode isn't supported
> > on R-Car E3 (r8a77990) and D3 (r8a77995).
> 
> Yes, it made it also into the revised documentation v1.50, see chapter
> 50.2.7., bit 14.
> 
> > +static const struct soc_device_attribute ravb_delay_mode_quirk_match[] = {
> > +	{ .soc_id = "r8a77990", .revision = "ES1.*" },
> > +	{ .soc_id = "r8a77995", .revision = "ES1.*" },
> > +	{ /* sentinel */ }
> > +};
> 
> I might have missed it but is there a plan to fix this in later
> revisions of D3/E3? I was under the impression that it is not and then
> we could base it on compatible rather than soc_device_match?

I am not aware of any such plan (or the absence of such a plan).

I was unsure weather to go with the compat approach of the quirk approach.
In the end I went with the quirk approach as it seems simpler. But
I'm happy to re-arrange things.

