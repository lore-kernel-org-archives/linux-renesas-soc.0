Return-Path: <SRS0=BEXM=RC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CE3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 11:30:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67CA321734
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 11:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="k1RbgSNY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbfB0La0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Feb 2019 06:30:26 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:52588 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728189AbfB0LaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Feb 2019 06:30:25 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3347425B7D6;
        Wed, 27 Feb 2019 22:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551267023; bh=ZMbNpkAr58NK0FJIR0TN2EeIWNnp05ZlqkrBrlGuPrc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k1RbgSNYMqc80uwZuc7HixXaG4V9KDdjuaAOltAMnMF6lC9Fd5/Av5qjwzeHB0XVZ
         zVZayIGlZkaV3r+UfExgusr3OyP+wHlXKWu6AnSH0M92oNOSwZHiHn4qtJvy5A2UJb
         TwWkSppBuiawxKJ+TxLaw7HVM8mHQfsaPDJm1tPY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 03EED9402DD; Wed, 27 Feb 2019 12:30:20 +0100 (CET)
Date:   Wed, 27 Feb 2019 12:30:20 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2]   arm64: dts: renesas: r8a77965-salvator-x: enable
 HDMI sound
Message-ID: <20190227113020.byiwz4dpmn2s35hn@verge.net.au>
References: <87pnrdsum0.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnrdsum0.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 27, 2019 at 02:02:21PM +0900, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> These are HDMI sound support for r8a77965.
> I didn't/can't test these.

Thanks Morimoto-san,

Is this because of lack of hardware or some deeper reason?

> 
> Kuninori Morimoto (2):
>   arm64: dts: renesas: r8a77965-salvator-x: enable HDMI sound
>   arm64: dts: renesas: r8a77965-salvator-xs: enable HDMI sound
> 
>  .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts | 28 ++++++++++++++++++++++
>  .../boot/dts/renesas/r8a77965-salvator-xs.dts      | 28 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> -- 
> 2.7.4
> 
