Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDFAC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 074FC217FB
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XzNdTCkd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbeLPLAt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 06:00:49 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:55805 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729819AbeLPLAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 06:00:49 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A78AA25BDFF;
        Sun, 16 Dec 2018 22:00:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544958047; bh=YokTZ6pvlL5P+Bnn7M3JbapA0YLik6YGrxyiwVo0UzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XzNdTCkdAE3mZIHbeqXewVIsQTdUJHyq4RCsP/LbpfjQWUgRIXLZyh+8STqAG17A+
         JLgm0KUS2XIlWj48MkQKrPJvE5EDDgAK7keqyallCUICBiS72TK3LEhVnbszCkVL8L
         LCS1QNeLJClHbdYxv6HrlbqVp3eIRCKY2+7Qg1hg=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id D43BCE20E06; Sun, 16 Dec 2018 03:00:44 -0800 (PST)
Date:   Sun, 16 Dec 2018 12:00:44 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/6] pinctrl: sh-pfc: sh73a0: Add missing TO pin to
 tpu4_to3 group
Message-ID: <20181216110043.7uu4fehyde5ovlhi@verge.net.au>
References: <20181213162855.14190-1-geert+renesas@glider.be>
 <20181213162855.14190-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213162855.14190-6-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 05:28:54PM +0100, Geert Uytterhoeven wrote:
> The tpu4_to3_mux[] array contains the TPU4TO3 pin mark, but the
> tpu4_to3_pins[] array lacks the corresponding pin number.
> 
> Add the missing pin number, for non-GPIO pin F26.
> 
> Fixes: 5da4eb049de803c7 ("sh-pfc: sh73a0: Add TPU pin groups and functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

