Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0867C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:29:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7B3120657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 12:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="AKaxMk5S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfAQM3J (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 07:29:09 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:32926 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfAQM3J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 07:29:09 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3E0DB25B760;
        Thu, 17 Jan 2019 23:29:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547728146; bh=vZSEbyMTXcO0Y0gpbGKvVOHS/kORxy8nbvo2EU40o0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AKaxMk5Szo+Dk/fgiDhPSZ8+8uyUyB2/RfIksRH8Bq+Q7oDXKaWeQigaNer9KgwLv
         tm546r0V7HiZPZIlVHnuHv9P1c+jkKzTcC1TK1EKM+zPA7bYp1gDNHEqd9vkzMPtqs
         U4qjU4gzLHobIJG8QrBKni4iXeYOHrF5Bgm+LpsA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B0207940459; Thu, 17 Jan 2019 13:29:04 +0100 (CET)
Date:   Thu, 17 Jan 2019 13:29:04 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: Print pin group when debugging
Message-ID: <20190117122858.2x54eddmroi62apq@verge.net.au>
References: <20190116132058.6716-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116132058.6716-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 16, 2019 at 02:20:58PM +0100, Geert Uytterhoeven wrote:
> Knowing which pin group is being configured is useful information when
> debugging pin configuration.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v5.1.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

