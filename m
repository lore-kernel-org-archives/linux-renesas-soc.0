Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99D8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:21:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3B0620842
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="a4v/TLhD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfBYJVE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:21:04 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40447 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfBYJVE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:21:04 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A4CA825B784;
        Mon, 25 Feb 2019 20:21:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551086461; bh=0mCUDLyeKDQP1lyU9vw1NRCeWS2QsXtoPB/0dBi+M8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a4v/TLhDn/THU8aTMopRP0zlnAAQmgOnfY1wxxFQi3xdhcMt6MXKnBGf9o/KgGKIr
         G+Y6N5G8eztdAjvHq2w3m7DuG7Pce/6Bw05sxTTv4qBIKPy6gLce2RtLDUqhOlr7fh
         Q2At63lBsbltAGNcByjr6v6Aw9dVKfqlf0JXBuj8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C542694056F; Mon, 25 Feb 2019 10:20:59 +0100 (CET)
Date:   Mon, 25 Feb 2019 10:20:59 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: Re: [PATCH] mmc: tmio: fix access width of Block Count Register
Message-ID: <20190225092059.rypo3kgfbyyrg7in@verge.net.au>
References: <20190221193805.1427-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190221193805.1427-1-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 08:38:05PM +0100, Wolfram Sang wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
> 
> In R-Car Gen2 or later, the maximum number of transfer blocks are
> changed from 0xFFFF to 0xFFFFFFFF. Therefore, Block Count Register
> should use iowrite32().
> 
> If another system (U-boot, Hypervisor OS, etc) uses bit[31:16], this
> value will not be cleared. So, SD/MMC card initialization fails.
> 
> So, check for the bigger register and use apropriate write. Also, mark
> the register as extended on Gen2.
> 
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: use max_blk_count in if(), add Gen2, update commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: stable@kernel.org

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
