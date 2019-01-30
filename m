Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3239DC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7BA32184D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="hrWWsRTB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfA3KI3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:08:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39126 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbfA3KI3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 05:08:29 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D915625B74E;
        Wed, 30 Jan 2019 21:08:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548842907; bh=EvugcOPP8GfhvpjKdJAoIcBLkgNRdNuTZzEBsA6u9aw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hrWWsRTB+smlsTYO1MHQKHkwCZu1wPNTLIpHaDmcivqLvLz1i7sQ9bumL23plMuok
         R9DSku+yLdwoouJK3KOM4WKjEajwWGlP+iKQF+QWSHaHZ3ai4y2RjEedmjAZyaGsdj
         zXIoqZAWudzEMc0TY9knCuTXu6v+fDv7TeYXBKH8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1D19394043D; Wed, 30 Jan 2019 11:08:25 +0100 (CET)
Date:   Wed, 30 Jan 2019 11:08:25 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
Message-ID: <20190130100824.haahigx6r3aglgz3@verge.net.au>
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <0476beba-ea1f-7675-aa08-573b74e84f4e@cogentembedded.com>
 <20190128122053.vb5ifhf34zbnuclp@verge.net.au>
 <916ed105-d499-4ca1-8418-4743b5a7a60d@cogentembedded.com>
 <20190129080004.blc3jrt5y2j7dauo@verge.net.au>
 <e5b05616-d9b3-3c0a-189b-4fc02190c8a5@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b05616-d9b3-3c0a-189b-4fc02190c8a5@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 29, 2019 at 01:37:38PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 01/29/2019 11:00 AM, Simon Horman wrote:
> 
> >>>> The RZ/A1H (R7S721000) SoC manual describes the Ether MAC's RX checksum
> >>>> offload the same way as it's implemented in the EtherAVB MACs...
> >>>>
> >>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>>
> >>> Regarding this and the remaining patches in this series,
> >>> which add rx-csum offload support in the sh_eth driver for
> >>> various SoCs: has this been tested?
> >>
> >>    As I said, I've only tested it on R8A77980.
> 
>    And still hoping Geert would be able to test on R8A7740.
> 
> > 
> > Thanks, I missed that.
> > 
> > As you may have guessed the implication of my question is that
> > IMHO it would be best only to add this feature to SoCs where
> > it has been tested.
> 
>    You don't trust the manuals? :-)

As a rule I do not.
But sometimes I have to anyway.
