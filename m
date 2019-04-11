Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ACCC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 13:34:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3ECD217F4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 13:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="E3cgPJCj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfDKNeJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 09:34:09 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:57757 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbfDKNeI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 09:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Z8uXWlOTpka/7diwHKNrHD1zfv1kWas5Y/EaPR4Pfe4=; b=E3cgPJCjNqFVQnsRBAi8EnEhgP
        ScexlldeAuWXVECV2DGQFKdFPKuEmyb2gXP7Vpl0lRTtSJh/11k6USV6yqRcQFC0q/6nl+FU7QKxR
        rnJUWhT3+g9tGklVbwyicQJHvaCqdHFGZWHTTpFhGE7czp//OMSs8H4SdZlFWWInKGyw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hEZq1-0004QI-3B; Thu, 11 Apr 2019 15:33:57 +0200
Date:   Thu, 11 Apr 2019 15:33:57 +0200
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
Message-ID: <20190411133357.GE8916@lunn.ch>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
 <20190410161906.GD8916@lunn.ch>
 <fa67b9d8-8b7c-3929-415f-e37f880de874@cogentembedded.com>
 <20190411084026.5crg7yiphm6zsk5s@verge.net.au>
 <20190411092056.jmnsx6mnfylfrsh4@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411092056.jmnsx6mnfylfrsh4@verge.net.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 11, 2019 at 11:20:57AM +0200, Simon Horman wrote:
> On Thu, Apr 11, 2019 at 10:40:27AM +0200, Simon Horman wrote:
> > On Wed, Apr 10, 2019 at 08:17:16PM +0300, Sergei Shtylyov wrote:
> > > On 04/10/2019 07:19 PM, Andrew Lunn wrote:
> > > 
> > > >> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> > > >> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> > > >> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
> > > >>
> > > >> This matches all ES versions of the affected SoCs as it is
> > > >> not clear if this problem will be resolved in newer chips.
> > > >> This can be revisited, as necessary.
> > > >>
> > > >> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> > > >> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> > > >> mode is not supported as there is a risk of introducing a regression
> > > >> when used in conjunction with older DT blobs present in the field.
> > > > 
> > > > Hi Simon
> > > > 
> > > > I think it should at least WARN_ON(). Such blobs are broken, even if
> > > > they do kind of work.
> > > 
> > >    Good idea! Simon, third time's a charm? :-)
> > 
> > Sure, can do.
> 
> How about something like this?
> 
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1980,8 +1987,14 @@ static void ravb_set_delay_mode(struct net_device *ndev)
>  		set |= APSR_DM_RDM;
>  
>  	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID)
> -		set |= APSR_DM_TDM;
> +	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
> +		if (soc_device_match(ravb_delay_mode_quirk_match))
> +			dev_warn(ndev->dev.parent,
> +				 "phy-mode %s requires TX clock internal delay mode which is not supported by this hardwre revision",
> +				 phy_modes(priv->phy_interface));

Hi Simon

The point of the warning is to tell users they should upgrade their DT
blob to one that is not broken. So i think the message should say
this. Also, we want users to notice this, which is why i said
WARN_ON(). Something big so it gets noticed.

	   Andrew
