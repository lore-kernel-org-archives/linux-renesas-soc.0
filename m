Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21368C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:27:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFA2C2083E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbfDJJ1R (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:27:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40174 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbfDJJ1R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:27:17 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3D22725BE4C;
        Wed, 10 Apr 2019 19:27:15 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 469C7940356; Wed, 10 Apr 2019 11:27:13 +0200 (CEST)
Date:   Wed, 10 Apr 2019 11:27:13 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to
 100Mbps
Message-ID: <20190410092712.4neevfmz4o666lrm@verge.net.au>
References: <20190408083148.23134-1-horms+renesas@verge.net.au>
 <20190408212628.GB23071@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408212628.GB23071@lunn.ch>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 08, 2019 at 11:26:28PM +0200, Andrew Lunn wrote:
> On Mon, Apr 08, 2019 at 10:31:48AM +0200, Simon Horman wrote:
> > * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> >   August 24, 2018, the TX clock internal delay mode isn't supported
> >   on R-Car E3 (r8a77990) and D3 (r8a77995).
> > 
> > * TX clock internal delay mode is required for reliable 1Gbps communication
> >   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
> 
> Hi Simon
> 
> My reading of the KSZ9031RNX datasheet suggests the PHY can perform
> the delays. MMD address 2h, Register 8h - RGMII Clock Pad Skew.
> 
> The PHY driver might even have the needed vendor specific DT
> properties.
> 
> Have you look at using this?

Thanks for the suggestion Andrew, I will ask Renesas about this.
