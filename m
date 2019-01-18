Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C967C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C6322086D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:04:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TR7bru/C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfARMEX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 07:04:23 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:57610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfARMEX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 07:04:23 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E720525B799;
        Fri, 18 Jan 2019 23:04:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547813061; bh=ivYdF4l+05zrZZrhDKGZzgIA6+L/cOzbyhs8oS6xJ28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TR7bru/CwDGCphIbqb6w7D6ZGi1/t+906Ov4XNrbRU3xWETis9WRctAQ/3NjImI6+
         nUAHA7oK9FjPMCEJvTvpgplgEI0e4Mmmae5bngWp09lm7PUBazYxLLTjxwTZp9YZYO
         ttcFYoIzO8U2shyjuSMFn7DkdsPMN7tkPDIn7X4c=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5D613940356; Fri, 18 Jan 2019 13:04:19 +0100 (CET)
Date:   Fri, 18 Jan 2019 13:04:19 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org,
        linux-serial@vger.kernel.org, magnus.damm@gmail.com
Subject: Re: [PATCH 2/2] ARM: dts: r8a7779: Add HSCIF0/1 device nodes
Message-ID: <20190118120419.cqpsjx6apr2gxshy@verge.net.au>
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
 <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 11:48:15AM +0100, Ulrich Hecht wrote:
> Based on Rev. 1.00 of the R-Car H1 datasheet.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
