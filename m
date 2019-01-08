Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9399CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 14:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 595BF206BB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 14:48:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ruglk+75"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfAHOsh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 09:48:37 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34280 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbfAHOsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 09:48:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4319925B781;
        Wed,  9 Jan 2019 01:48:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546958914; bh=yUZfw+awfVYZRz+vcH+kvka/WGgXXraVAsmofnK3ScE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ruglk+75bXSvSaJYxvf1B/YLQTVm2jp2K+J5GQJ+hMaEHFMtMjyrZ0RruDpPZWUpm
         +fbvJ3nzGtbzfp1ZQUTry0osIyHYfezX+RWC2MAz8Cz/0fd2jq15a49VkR6ZVSa3Gm
         Gs+8gc+HM6dyHF5x31vn3CyoONSyWZqqHNPNz2ZY=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5F92B940420; Tue,  8 Jan 2019 15:48:32 +0100 (CET)
Date:   Tue, 8 Jan 2019 15:48:32 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH v5 4/4] serial: sh-sci: Make RX/TX DMA function names
 consistent
Message-ID: <20190108144831.gxqexjoalkon33jb@verge.net.au>
References: <20190107162320.15530-1-geert+renesas@glider.be>
 <20190107162320.15530-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107162320.15530-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 07, 2019 at 05:23:20PM +0100, Geert Uytterhoeven wrote:
> Most RX/TX-specific DMA functions are prefixed with "sci_dma_[rt]x_".
> Rename the exceptions to increase consistency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

