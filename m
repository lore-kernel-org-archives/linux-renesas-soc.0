Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FC7C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:45:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7FDAC2073F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 11:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbfDOLp5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 07:45:57 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50962 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfDOLp5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 07:45:57 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C6DAF25AD78;
        Mon, 15 Apr 2019 21:45:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C67589403F0; Mon, 15 Apr 2019 13:45:52 +0200 (CEST)
Date:   Mon, 15 Apr 2019 13:45:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190415114548.4k3n7qvs4jd2vkce@verge.net.au>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
 <20190410161906.GD8916@lunn.ch>
 <fa67b9d8-8b7c-3929-415f-e37f880de874@cogentembedded.com>
 <20190411084026.5crg7yiphm6zsk5s@verge.net.au>
 <20190411092056.jmnsx6mnfylfrsh4@verge.net.au>
 <20190411133357.GE8916@lunn.ch>
 <a6bd1a3a-0c6f-6d2a-9270-f5819c34d4e7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6bd1a3a-0c6f-6d2a-9270-f5819c34d4e7@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 11, 2019 at 07:36:35PM +0300, Sergei Shtylyov wrote:
> On 04/11/2019 04:33 PM, Andrew Lunn wrote:
> 
> >>>>>> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> >>>>>> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> >>>>>> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
> >>>>>>
> >>>>>> This matches all ES versions of the affected SoCs as it is
> >>>>>> not clear if this problem will be resolved in newer chips.
> >>>>>> This can be revisited, as necessary.
> >>>>>>
> >>>>>> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> >>>>>> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> >>>>>> mode is not supported as there is a risk of introducing a regression
> >>>>>> when used in conjunction with older DT blobs present in the field.
> >>>>>
> >>>>> Hi Simon
> >>>>>
> >>>>> I think it should at least WARN_ON(). Such blobs are broken, even if
> >>>>> they do kind of work.
> >>>>
> >>>>    Good idea! Simon, third time's a charm? :-)
> >>>
> >>> Sure, can do.
> >>
> >> How about something like this?
> >>
> >> --- a/drivers/net/ethernet/renesas/ravb_main.c
> >> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> >> @@ -1980,8 +1987,14 @@ static void ravb_set_delay_mode(struct net_device *ndev)
> >>  		set |= APSR_DM_RDM;
> >>  
> >>  	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> >> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> >> -		set |= APSR_DM_TDM;
> >> +	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
> >> +		if (soc_device_match(ravb_delay_mode_quirk_match))
> >> +			dev_warn(ndev->dev.parent,
> >> +				 "phy-mode %s requires TX clock internal delay mode which is not supported by this hardwre revision",
> >> +				 phy_modes(priv->phy_interface));
> > 
> > Hi Simon
> > 
> > The point of the warning is to tell users they should upgrade their DT
> > blob to one that is not broken. So i think the message should say
> > this. Also, we want users to notice this, which is why i said
> > WARN_ON(). Something big so it gets noticed.
> 
>    I agree in general but I guess you meant WARN() -- WARN_ON() doesn't take
> a string arg...

Thanks, how about this?

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4f648394e645..9618c4881c83 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1980,8 +1987,12 @@ static void ravb_set_delay_mode(struct net_device *ndev)
 		set |= APSR_DM_RDM;
 
 	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
-	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
-		set |= APSR_DM_TDM;
+	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
+		if (!WARN(soc_device_match(ravb_delay_mode_quirk_match),
+			  "phy-mode %s requires TX clock internal delay mode which is not supported by this hardware revision. Please update device tree",
+			  phy_modes(priv->phy_interface)))
+			set |= APSR_DM_TDM;
+	}
 
 	ravb_modify(ndev, APSR, APSR_DM, set);
 }
