Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BED2C10F06
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EFFD421473
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ngtMnnSw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbfDCIjW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 04:39:22 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35008 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728942AbfDCIjU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 04:39:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6529525BDFF;
        Wed,  3 Apr 2019 19:39:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554280758; bh=WMRqSbzyPW/hxKulPUbXXG0swSoIJFE0yDiK2mXH4P0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ngtMnnSwaUD32WGtmigQrWB2aZo3A1nVshgK0ew0rLbgkauOI2z7cuYapd5oe2POX
         IYHtOSxMYecRBXXYvkHIFQmb8Ilc/i1vLj6CcXrLEqLjZZVMEoqnGfpR6e+lFV9exe
         Jf6IviGOZGkLG9JZKv2cIBBQUp7kf8CDGhQF3mdg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 309FC940361; Wed,  3 Apr 2019 10:39:16 +0200 (CEST)
Date:   Wed, 3 Apr 2019 10:39:16 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: Fix spacing
Message-ID: <20190403083915.vfn7qi5mc5iqrxbs@verge.net.au>
References: <20190401112937.23762-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190401112937.23762-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 01, 2019 at 01:29:37PM +0200, Geert Uytterhoeven wrote:
> Replace "F_(0,0)" by "F_(0, 0)".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v5.2.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

...
