Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FFCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E121220823
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="k15Rl2mE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbfCDKXJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:23:09 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39192 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfCDKXJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 05:23:09 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C968325B74E;
        Mon,  4 Mar 2019 21:23:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551694987; bh=wo/2J9Yij7N0LqaOYSrJjfP9zXWKAOJQJFGcLGLfWnI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k15Rl2mE+PflnzbFGZfAvDcWANZIrSKLD5506YeAHICKHkrx3Kwd7FZj4sOUuVYO5
         WTmJDnSOvCgLikUzjDYNlo+tgW6TVxtUsqWoSxuIVFhBSXMAnleBw369nJNIdC8Mb6
         0uRo/qRCZCN5eDR1GjGrrOZgaZwegrNI6BIctIKM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 151FA94030D; Mon,  4 Mar 2019 11:23:05 +0100 (CET)
Date:   Mon, 4 Mar 2019 11:23:05 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     marek.vasut@gmail.com, linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: shmobile: porter: enable R-Car Gen2 regulator quirk
Message-ID: <20190304102300.4b7hmbtvk3jtm4mv@verge.net.au>
References: <20190303194140.11757-1-marek.vasut@gmail.com>
 <20190303230842.GA3949@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190303230842.GA3949@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 04, 2019 at 12:08:42AM +0100, Wolfram Sang wrote:
> On Sun, Mar 03, 2019 at 08:41:40PM +0100, marek.vasut@gmail.com wrote:
> > From: Marek Vasut <marek.vasut+renesas@gmail.com>
> > 
> > Porter needs the regulator quirk, just like the other boards.
> > But unlike the other boards, the Porter uses DA9063L, which
> > is at 0x5a. Otherwise, DA9063L and DA9210 IRQ line is still
> > connected to CPU IRQ2 .
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for v5.2.
