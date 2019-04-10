Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FEBC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EAAB2133D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfDJJh6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:37:58 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40614 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728563AbfDJJh5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:37:57 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DD5D325B7EA;
        Wed, 10 Apr 2019 19:37:55 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DEE3E940356; Wed, 10 Apr 2019 11:37:53 +0200 (CEST)
Date:   Wed, 10 Apr 2019 11:37:53 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190410093753.hh7j5orewgrys572@verge.net.au>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <12616e19-9127-39db-4346-be642c87b596@cogentembedded.com>
 <20190408174903.GD15267@lunn.ch>
 <20190409104523.nunbq6mz5633hx2m@verge.net.au>
 <fa729acf-33cd-4766-10a5-bdbd21f29262@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa729acf-33cd-4766-10a5-bdbd21f29262@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 09, 2019 at 06:03:24PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 04/09/2019 01:45 PM, Simon Horman wrote:
> 
> >>>> @@ -1979,8 +1985,9 @@ static void ravb_set_delay_mode(struct net_device *ndev)
> >>>>  	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID)
> >>>>  		set |= APSR_DM_RDM;
> >>>>  
> >>>> -	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> >>>> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> >>>> +	if ((priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> >>>> +	     priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) &&
> >>>> +	    !soc_device_match(ravb_delay_mode_quirk_match))
> >>>
> >>>    But don't we need to error out of the probing as we can't set the delay mode
> >>> requested?
> >>
> >> Yes, if we can, we should error out. It just depends on if there are
> >> broken DT blobs out there. We recently had a lot of pain from broken
> >> DT blobs using the at803x PHY and getting RGMII modes wrong. In the
> >> long run, it is best to if DT, but i've no idea how many boards are
> >> affected.
> > 
> > Hi Andrew,
> > 
> > I suspect there are such blobs out there and I'm not sure
> > what the fall-out may or may not be.
> 
>    You mean the out-of-tree blobs? Because I'm not seeing any in-kernel
> breakage... 

I am referring to older upstream blobs built from older upstream or
out-of-tree BSP kernel source where the phy mode is rgmii-txid or rgmii-id.
F.e. Ebisu and upstream v5.0 or out-of-tree R-Car Gen3 BSP v3.8.0.
