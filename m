Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5927C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:25:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6F532146E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="X3rNT5AH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732718AbeLQNZ3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:25:29 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40623 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732712AbeLQNZ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:25:28 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5500E25B781;
        Tue, 18 Dec 2018 00:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545053126; bh=qQKDY8AyjZ0Vk6CLNSrARU1Ac8BcSOLsojFRweI5tA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X3rNT5AH20EmMSee2dxzPkpyitmFBm3tY+QnZON+R6aE9xOQWVwJ53IJVRWRhsSwp
         FjqogHP9x/J0vJK41TkFe64z/FbCYu4MPzFczQywn51V1WKuLWeGaXJCsHuCdBgK02
         6+H6nEU+3gf9REplbTGJIFFAp7x41XdfmJJQP0fg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4F34A94048A; Mon, 17 Dec 2018 14:25:24 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:25:24 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 3/4] serial: sh-sci: Resume PIO in sci_rx_interrupt()
 on DMA failure
Message-ID: <20181217132523.zqoqtebobcs4oajt@verge.net.au>
References: <20181213184444.21904-1-geert+renesas@glider.be>
 <20181213184444.21904-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213184444.21904-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:44:43PM +0100, Geert Uytterhoeven wrote:
> On (H)SCIF, sci_submit_rx() is called in the receive interrupt handler.
> Hence if DMA submission fails, the interrupt handler should resume
> handling reception using PIO, else no more data is received.
> 
> Make sci_submit_rx() return an error indicator, so the receive interrupt
> handler can act appropriately.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
