Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B197BC282DA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 16:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79F7A2087C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 16:49:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="v5y97EyS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfDOQth (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 12:49:37 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:33726 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbfDOQtg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 12:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=9GUyQmKWFdaLFqgchYx1hFPPe82EEbXXLqZUWtu3SI4=; b=v5y97EySfHSEsZpribhAP/LaAA
        HnAdUrG8wqpOFXlOgevo4zPk+I/V3Lx9EKrf+fh9CVwmSfZs6cO9+VbCzJg7kLhF3WHnhHtjj7pLh
        yAX463IUjpfEFBGiSvaDWMllWcNumwsy8cuR9ujLPzK/jCikuwOmrNjq76bg1GfeTYDA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hG4nJ-0005hj-1E; Mon, 15 Apr 2019 18:49:21 +0200
Date:   Mon, 15 Apr 2019 18:49:21 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Simon Horman <horms@verge.net.au>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190415164921.GB9343@lunn.ch>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
 <20190410161906.GD8916@lunn.ch>
 <fa67b9d8-8b7c-3929-415f-e37f880de874@cogentembedded.com>
 <20190411084026.5crg7yiphm6zsk5s@verge.net.au>
 <20190411092056.jmnsx6mnfylfrsh4@verge.net.au>
 <20190411133357.GE8916@lunn.ch>
 <a6bd1a3a-0c6f-6d2a-9270-f5819c34d4e7@cogentembedded.com>
 <20190415114548.4k3n7qvs4jd2vkce@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415114548.4k3n7qvs4jd2vkce@verge.net.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 4f648394e645..9618c4881c83 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1980,8 +1987,12 @@ static void ravb_set_delay_mode(struct net_device *ndev)
>  		set |= APSR_DM_RDM;
>  
>  	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> -		set |= APSR_DM_TDM;
> +	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
> +		if (!WARN(soc_device_match(ravb_delay_mode_quirk_match),
> +			  "phy-mode %s requires TX clock internal delay mode which is not supported by this hardware revision. Please update device tree",
> +			  phy_modes(priv->phy_interface)))
> +			set |= APSR_DM_TDM;
> +	}
>  
>  	ravb_modify(ndev, APSR, APSR_DM, set);
>  }

Hi Simon

This looks good. Please add my:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

To the real patch.

    Andrew
