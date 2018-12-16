Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26025C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7A78217FA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 10:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ZiVhPO2z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbeLPKeD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 05:34:03 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:55592 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbeLPKeD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 05:34:03 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EF42225BDFF;
        Sun, 16 Dec 2018 21:34:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544956441; bh=oLQ0WbbizZEHuqQKwz9NAOmRVNq1wF+u4d8brk/gfro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZiVhPO2zd0iqxTqfGztrWV6T/HZsFq1ctI92facMZCVx4B8wEqsL46LzxrFggskPi
         YwvQcX5fvhUqbrudy4YZt+wSn0PWhvFC6I0FfUvslhdUlWxrRBGbppJVix+Uq8HlRF
         gS6gUzTM1HcYTUJFwXN422Z9t7ZekHVwcVDyDCiU=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 35C00E20E06; Sun, 16 Dec 2018 02:33:59 -0800 (PST)
Date:   Sun, 16 Dec 2018 11:33:59 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/6] pinctrl: sh-pfc: r8a7740: Add missing LCD0 marks to
 lcd0_data24_1 group
Message-ID: <20181216103358.jtcoq6payntloolw@verge.net.au>
References: <20181213162855.14190-1-geert+renesas@glider.be>
 <20181213162855.14190-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213162855.14190-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 05:28:51PM +0100, Geert Uytterhoeven wrote:
> The lcd0_data24_1_pins[] array contains the LCD0 D1[2-5] pin numbers,
> but the lcd0_data24_1_mux[] array lacks the corresponding pin marks.
> 
> Fixes: 06c7dd866da70f6c ("sh-pfc: r8a7740: Add LCDC0 and LCDC1 pin groups and functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

