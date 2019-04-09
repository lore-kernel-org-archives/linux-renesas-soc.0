Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECD9C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1410320833
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="gYkfHqU0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbfDIKp2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:45:28 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41443 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfDIKp2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 06:45:28 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1ADC625BDAE;
        Tue,  9 Apr 2019 20:45:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554806726; bh=QiYXAXoYvLVUjFsTiNgmOOdiEwQexYo5fO4lbZKd5Bo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gYkfHqU0+BO97gA6AAoGA5tZAZyhzDxIEHo3s+qz0eCxNxtLIJM39GnyCAT6Jqw88
         VyK+6m1ZyhqL/yXso3rP9Ur7IBPR+u0MPEJrL9o1bI1tT2l0KlxrTc0Gk/0s7egRGB
         tyKiOAkl0XixrS4AbrGdmuCBn741poB0AZdhRFVU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3176F9402E1; Tue,  9 Apr 2019 12:45:24 +0200 (CEST)
Date:   Tue, 9 Apr 2019 12:45:24 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190409104523.nunbq6mz5633hx2m@verge.net.au>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <12616e19-9127-39db-4346-be642c87b596@cogentembedded.com>
 <20190408174903.GD15267@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408174903.GD15267@lunn.ch>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 08, 2019 at 07:49:03PM +0200, Andrew Lunn wrote:
> > > @@ -1979,8 +1985,9 @@ static void ravb_set_delay_mode(struct net_device *ndev)
> > >  	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID)
> > >  		set |= APSR_DM_RDM;
> > >  
> > > -	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> > > -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> > > +	if ((priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> > > +	     priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) &&
> > > +	    !soc_device_match(ravb_delay_mode_quirk_match))
> > 
> >    But don't we need to error out of the probing as we can't set the delay mode
> > requested?
> 
> Yes, if we can, we should error out. It just depends on if there are
> broken DT blobs out there. We recently had a lot of pain from broken
> DT blobs using the at803x PHY and getting RGMII modes wrong. In the
> long run, it is best to if DT, but i've no idea how many boards are
> affected.

Hi Andrew,

I suspect there are such blobs out there and I'm not sure
what the fall-out may or may not be.
