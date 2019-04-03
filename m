Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0910C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:38:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 817422082C
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:38:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="OVaKqGtP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfDCJiI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:38:08 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36084 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfDCJiH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:38:07 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3199825AD6C;
        Wed,  3 Apr 2019 20:38:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554284285; bh=Li9SzjLUkUqzuJmKs8AkXIK0AzPAmE2uIacyLVBplZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OVaKqGtP+dYuo4KBRAU2VYNchxJhUda1aesVqw+UHHZfbQfiehmYtwyjCIf/YSnb6
         1GjvX+PrX5qpIVRCJd9FnpV4hJHUKrGQQgh4vGOq5ePvgKGJ6K7800+8KUaUpInY2c
         AD6tN6yPTsCPFjp6TFQAWi/cDtsyDwihjtzpq0DI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 50AED940361; Wed,  3 Apr 2019 11:38:03 +0200 (CEST)
Date:   Wed, 3 Apr 2019 11:38:03 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH LOCAL] arm64: renesas_defconfig: Reduce NR_CPUS to 8
Message-ID: <20190403093803.5psmp7pglheh7mw5@verge.net.au>
References: <20190402130619.14145-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190402130619.14145-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Apr 02, 2019 at 03:06:19PM +0200, Geert Uytterhoeven wrote:
> The maximum number of arm64 CPU cores (excluding the real-time core) in
> Renesas ARM SoCs is 8.
> 
> The default value of NR_CPUS used to be 64, causing a negligible kernel
> size increase of ca. 16 KiB, compared to the minimum needed value of 8.
> As of commit 846a415bf4408ccd ("arm64: default NR_CPUS to
> 256"), the default value of NR_CPUS was increased to 256, increasing the
> waste by another 78 KiB.
> 
> Reduce NR_CPUS to 8, reducing kernel size by ca. 94 KiB.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

I have applied this to the topic/renesas-defconfig branch which is included
in the devel branch and tags of the Renesas tree as a convenience to
developers.  The branch is not, however, included in the next branch or
tags nor is it targeted at upstream.
