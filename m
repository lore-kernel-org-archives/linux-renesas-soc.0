Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085C0C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 10:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92304218A2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 10:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="cPb5oB4M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbfAYKDd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 05:03:33 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53659 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbfAYKDd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 05:03:33 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B356425BE52;
        Fri, 25 Jan 2019 21:03:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548410611; bh=lnvJGWz38jIg4upa0glnv4+Pgqon1ApASKT2L3fOX9M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPb5oB4M0y486Gz/RGfJwmwrFyGnmlhOud3vvP03Da/dOcBI8/bM5hE3byQK0md4/
         T7NPQ+ZhK7NPoHhnVIzWo/0dztw/ZYAy4vyhBnLQtVAnsnkJhD1rJrieNlxByvO6Xr
         /D7eIHZInxYqSPvgHqMpm2rpJ6pYzFHXLm3/8tcQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EF48D94048D; Fri, 25 Jan 2019 11:03:28 +0100 (CET)
Date:   Fri, 25 Jan 2019 11:03:28 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: defconfig: Enable support for RZ/A2
Message-ID: <20190125100328.tupij36uclthrlgb@verge.net.au>
References: <20190124164022.9810-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124164022.9810-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 24, 2019 at 05:40:20PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series enables support for the RZ/A2 SoC in the Renesas and
> ARM V7 multiplatform defconfigs, now the DTS for the Renesas RZ/A2M
> evaluation board is included.

Thanks, applied for v5.1.
