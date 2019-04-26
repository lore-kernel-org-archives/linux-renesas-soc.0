Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9B1C4321A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46C4E206BA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfDZJsG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:48:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45336 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfDZJsF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:48:05 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DF87425AEA8;
        Fri, 26 Apr 2019 19:48:02 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F263D9403ED; Fri, 26 Apr 2019 11:48:00 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:48:00 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: sh-pfc: Add SH_PFC_PIN_CFG_PULL_UP_DOWN
 shorthand
Message-ID: <20190426094800.rxzvoox7dzfqsmms@verge.net.au>
References: <20190425095946.1259-1-geert+renesas@glider.be>
 <20190425095946.1259-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425095946.1259-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 11:59:45AM +0200, Geert Uytterhoeven wrote:
> It is very common for a pin to support both pull-up and pull-down
> functionality.  Hence add a shorthand SH_PFC_PIN_CFG_PULL_UP_DOWN.
> This not only reduces typing, but also avoids the need for several line
> breaks, and makes many overly long lines shorter, improving
> readability.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

