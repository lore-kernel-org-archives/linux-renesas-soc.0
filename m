Return-Path: <SRS0=HpHr=UR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C03BC31E51
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 07:22:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECC3420679
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jun 2019 07:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfFRHWr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Jun 2019 03:22:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41948 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfFRHWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:22:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7AE8125AED3;
        Tue, 18 Jun 2019 17:22:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DA3E19408C4; Tue, 18 Jun 2019 09:22:42 +0200 (CEST)
Date:   Tue, 18 Jun 2019 09:22:42 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [ANNOUNCE] Renesas tree closing for v5.3
Message-ID: <20190618072240.4cjcu33tvqhqhezt@verge.net.au>
References: <20190617100008.zyg6y6qdtwetbtid@verge.net.au>
 <8ddeda86-377f-27c3-9031-62a36120c354@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ddeda86-377f-27c3-9031-62a36120c354@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 05:48:02PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 06/17/2019 01:00 PM, Simon Horman wrote:
> 
> > I would like to stop accepting non-bug-fix patches for v5.3 on Wednesday
> > 17th April (this week) and get the last pull requests posted by the end of
> 
>   19th June, perhaps? ;-)

Yes, indeed.

> > next week.  This is in order for them to be sent before the release of
> > v5.2-rc6, the deadline set by the ARM SoC maintainers.  As patches should
> > ideally progress from the renesas tree into linux-next before sending pull
> > requests there is a few days lead time involved.
> > 
> > Once the tree has closes for v5.3 it is intended that patches
> > will start being accepted for v5.4.
> > 
> > Thanks,
> > Simon
> 
> MBR, Sergei
> 
