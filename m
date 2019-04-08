Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DA5C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 21:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C26220857
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 21:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="x2TMA0v+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfDHV0c (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 17:26:32 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:54247 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726882AbfDHV0c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 17:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=8ZrjxfZArJ42TQCA9BEkf2udlOhMEfO6UuMZ/a1FZTY=; b=x2TMA0v+B8Sj5+LbosNv/lCaSB
        eJXe1VqseArNw3y5mZj1Z60N2rWlWYU0p29kzOs2Ll9U9mtRgf0BZX5nvCOS431d6mgcSp7YmsThD
        +9MlnvaKWq+Od5zS+RG9ffwvk7HLOFbGKMZru4SzyuwFm7FnU5nrckJAojhera2GO2a0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hDbme-0006bO-Jh; Mon, 08 Apr 2019 23:26:28 +0200
Date:   Mon, 8 Apr 2019 23:26:28 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFC] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to
 100Mbps
Message-ID: <20190408212628.GB23071@lunn.ch>
References: <20190408083148.23134-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408083148.23134-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 08, 2019 at 10:31:48AM +0200, Simon Horman wrote:
> * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
>   August 24, 2018, the TX clock internal delay mode isn't supported
>   on R-Car E3 (r8a77990) and D3 (r8a77995).
> 
> * TX clock internal delay mode is required for reliable 1Gbps communication
>   using the KSZ9031RNX phy present on the Ebisu and Draak boards.

Hi Simon

My reading of the KSZ9031RNX datasheet suggests the PHY can perform
the delays. MMD address 2h, Register 8h - RGMII Clock Pad Skew.

The PHY driver might even have the needed vendor specific DT
properties.

Have you look at using this?

     Andrew
