Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD6AC10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 08:40:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD021217D4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 08:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfDKIkb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 04:40:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45070 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfDKIkb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 04:40:31 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 025FE25AD6D;
        Thu, 11 Apr 2019 18:40:29 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 13117940356; Thu, 11 Apr 2019 10:40:27 +0200 (CEST)
Date:   Thu, 11 Apr 2019 10:40:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190411084026.5crg7yiphm6zsk5s@verge.net.au>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
 <20190410161906.GD8916@lunn.ch>
 <fa67b9d8-8b7c-3929-415f-e37f880de874@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa67b9d8-8b7c-3929-415f-e37f880de874@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 10, 2019 at 08:17:16PM +0300, Sergei Shtylyov wrote:
> On 04/10/2019 07:19 PM, Andrew Lunn wrote:
> 
> >> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> >> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> >> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
> >>
> >> This matches all ES versions of the affected SoCs as it is
> >> not clear if this problem will be resolved in newer chips.
> >> This can be revisited, as necessary.
> >>
> >> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> >> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> >> mode is not supported as there is a risk of introducing a regression
> >> when used in conjunction with older DT blobs present in the field.
> > 
> > Hi Simon
> > 
> > I think it should at least WARN_ON(). Such blobs are broken, even if
> > they do kind of work.
> 
>    Good idea! Simon, third time's a charm? :-)

Sure, can do.

> 
> >      Andrew
> 
> MBR, Sergei
> 
