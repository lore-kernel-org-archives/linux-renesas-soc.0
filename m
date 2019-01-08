Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F3AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 14:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D380B206BB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 14:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="b7+ZQ978"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfAHOnB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 09:43:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33717 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728112AbfAHOnB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 09:43:01 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7FADC25AD76;
        Wed,  9 Jan 2019 01:42:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1546958578; bh=PTTo1YtmDlNErySVlulaYUEpDYx3If9SH2mXC4cdLBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b7+ZQ978kKCfd8o/LjsUj7ou94n/4DaBmSSeyIXis/aIfMGIPg1cDO1Oo4G6ezyz7
         cz75cPa92m/ONS4wZ3g2fNrSeN4TwqR0pYMNaP+oDwQlEYmQv1/ysrxkRWYh5aTqDZ
         xfP+ZdqNHAY7sjTnzTLLFHyXfl3343k9wbeJrHNk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8E854940420; Tue,  8 Jan 2019 15:42:56 +0100 (CET)
Date:   Tue, 8 Jan 2019 15:42:56 +0100
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
Subject: Re: [PATCH v5 1/4] serial: sh-sci: Extract
 sci_dma_rx_chan_invalidate()
Message-ID: <20190108144255.qepufy43ptdac4px@verge.net.au>
References: <20190107162320.15530-1-geert+renesas@glider.be>
 <20190107162320.15530-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190107162320.15530-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 07, 2019 at 05:23:17PM +0100, Geert Uytterhoeven wrote:
> The cookies and channel pointer for the DMA receive channel are
> invalidated in two places, and one more is planned.
> Extract this functionality in a common helper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

