Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D22C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 17:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4274220855
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 17:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dYsjwcIz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfDHRtK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 13:49:10 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:54036 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726373AbfDHRtJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 13:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=uEGn/ZdphOKgfkBD1LC32HwzyYEwq2zXwxk9mLjh7PA=; b=dYsjwcIzGBXn46mi8NzYHG0HA9
        kVxcG+tRUXNcjqs2bCOxiNGiqXnTKV880eiE4h2D9vkN5i+5OXHUw7SFTwH59YSaGKgPNmZJw6r+z
        CBDcslCl6jGxcWuMm53rQEeiDu5t8qtQiibE4i+HCTt8OvcYrt7hUGLKEblts1Ndp6bg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hDYOF-0004oR-M6; Mon, 08 Apr 2019 19:49:03 +0200
Date:   Mon, 8 Apr 2019 19:49:03 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Simon Horman <horms+renesas@verge.net.au>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH/RFC net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190408174903.GD15267@lunn.ch>
References: <20190408082928.22840-1-horms+renesas@verge.net.au>
 <12616e19-9127-39db-4346-be642c87b596@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12616e19-9127-39db-4346-be642c87b596@cogentembedded.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> > @@ -1979,8 +1985,9 @@ static void ravb_set_delay_mode(struct net_device *ndev)
> >  	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID)
> >  		set |= APSR_DM_RDM;
> >  
> > -	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> > -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> > +	if ((priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> > +	     priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) &&
> > +	    !soc_device_match(ravb_delay_mode_quirk_match))
> 
>    But don't we need to error out of the probing as we can't set the delay mode
> requested?

Yes, if we can, we should error out. It just depends on if there are
broken DT blobs out there. We recently had a lot of pain from broken
DT blobs using the at803x PHY and getting RGMII modes wrong. In the
long run, it is best to if DT, but i've no idea how many boards are
affected.

	Andrew
