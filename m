Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC215C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEAEE20850
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 10:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ZuvGvixr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbfDAKTX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 06:19:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45154 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfDAKTX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 06:19:23 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C46CF25B766;
        Mon,  1 Apr 2019 21:19:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554113961; bh=5lNRAwM1HNYl55k7XjNvy88dFqNYJ4OE0uFReOCMLcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZuvGvixrZTiXzgM10OebRNSDKvMewD1DE3GCAIpVFG9HK3QaEkTLwblUCPC53UERk
         qYRNNVwBFUJMeQ1WXlp+UJbhpIG8WoCq3KqX5Ik07+MrpKkbP0NFvNUOVfKpr6a/BU
         DhF2wbafUza7LHuAR8mpZcKaG+AHe0BjAJjA2hkY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 362A094039A; Mon,  1 Apr 2019 12:19:18 +0200 (CEST)
Date:   Mon, 1 Apr 2019 12:19:18 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 5/8] pinctrl: sh-pfc: rcar-gen3: Remove CC5_OSCOUT pin
Message-ID: <20190401101917.6u5u54n6a44pylsc@verge.net.au>
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329152942.13995-6-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 29, 2019 at 04:29:39PM +0100, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> Jun 4, 2018, the CC5_OSCOUT pin is removed.  Update the pin control
> drivers to reflect this.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Update R-Car V3M, V3H]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

