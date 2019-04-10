Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B34BC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 16:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E9232082E
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 16:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pX9lYKuQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732234AbfDJQTU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 12:19:20 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:56695 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731986AbfDJQTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 12:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=rdVo5/LCgxphBuhgNtBRpPpz9k6FJruqVu5NAz7jPsU=; b=pX9lYKuQOK2P0YW80FTiVOIhFt
        /hOFKczjIPPYgInSFomSORNdZl26WVuwiHNsgVdX9YfNs8xgf7juGEFuiDvddQwnYd4TSFv6je9mo
        kDnpVr5AcZ24jPFrflmyHcrJUIxCFORnUvCSagtt4FjiFzP5SmLbvxVMxo+VRXJZCi3k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hEFwI-0003U1-OK; Wed, 10 Apr 2019 18:19:06 +0200
Date:   Wed, 10 Apr 2019 18:19:06 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 net-next] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Message-ID: <20190410161906.GD8916@lunn.ch>
References: <20190410114502.30362-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190410114502.30362-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 10, 2019 at 01:45:02PM +0200, Simon Horman wrote:
> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0).
> 
> This matches all ES versions of the affected SoCs as it is
> not clear if this problem will be resolved in newer chips.
> This can be revisited, as necessary.
> 
> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> mode is not supported as there is a risk of introducing a regression
> when used in conjunction with older DT blobs present in the field.

Hi Simon

I think it should at least WARN_ON(). Such blobs are broken, even if
they do kind of work.

     Andrew
