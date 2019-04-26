Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343FDC43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12A38206BA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfDZJr5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:47:57 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45318 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfDZJr5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:47:57 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B779525AEA8;
        Fri, 26 Apr 2019 19:47:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BC7659403ED; Fri, 26 Apr 2019 11:47:52 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:47:52 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: Rename 2-parameter CPU_ALL_PORT()
 variant
Message-ID: <20190426094752.lwkfe6wdyffh2wjf@verge.net.au>
References: <20190425095946.1259-1-geert+renesas@glider.be>
 <20190425095946.1259-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425095946.1259-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 11:59:44AM +0200, Geert Uytterhoeven wrote:
> There are two variants of the CPU_ALL_PORT() macro in use:
>   1. A three-parameter variant, to be provided for SoCs with a linear
>      GPIO pin space ("PORT style"),
>   2. A two-parameter variant, to be provided for SoCs with 32-port GPIO
>      banks ("GP port style").
> 
> Rename the 2-parameter variant to CPU_ALL_GP(), to avoid confusion, and
> to increase naming consistency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

