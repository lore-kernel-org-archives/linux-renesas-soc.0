Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9049BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EE512133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 13:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TG6Rp6Po"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732596AbeLQNWq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 08:22:46 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40564 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727580AbeLQNWq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 08:22:46 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7166F25B781;
        Tue, 18 Dec 2018 00:22:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545052964; bh=tnwE+bx+glUZRHLKqDicqu6AWTzwMN813/QNnCFUDew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TG6Rp6PoP9mbZ460ENGjahYk5935JD5XVUskZoIDnZUZYlMjmH/bqvB/Dxt4qDmxt
         aZL/tQARzQOE7Z/qDI5dTPnLPDAUB6aGuDXvVIZi+90tTopGRRSw0GWpFTJOQl7dxa
         b2cqvczD35KDMACuHPwJMHyChD3eJ6vpCMXydVNQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6F59194048A; Mon, 17 Dec 2018 14:22:42 +0100 (CET)
Date:   Mon, 17 Dec 2018 14:22:42 +0100
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
Subject: Re: [PATCH v4 2/4] serial: sh-sci: Fix crash in rx_timer_fn() on PIO
 fallback
Message-ID: <20181217132241.4lbaeshn2rnlhjqe@verge.net.au>
References: <20181213184444.21904-1-geert+renesas@glider.be>
 <20181213184444.21904-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213184444.21904-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:44:42PM +0100, Geert Uytterhoeven wrote:
> When falling back to PIO, active_rx must be set to a different value
> than cookie_rx[i], else sci_dma_rx_find_active() will incorrectly find a
> match, leading to a NULL pointer dereference in rx_timer_fn() later.
> 
> Use zero instead, which is the same value as after driver
> initialization.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This looks good so to me long as dmaengine_submit() doesn't return 0.
Is that the case?

> ---
> v4:
>   - No changes,
> 
> v3:
>   - Split in multiple patches.
> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 2a08039f792235e5..e353e03ce2602559 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1369,7 +1369,7 @@ static void sci_submit_rx(struct sci_port *s, bool port_lock_held)
>  		dmaengine_terminate_async(chan);
>  	for (i = 0; i < 2; i++)
>  		s->cookie_rx[i] = -EINVAL;
> -	s->active_rx = -EINVAL;
> +	s->active_rx = 0;
>  	s->chan_rx = NULL;
>  	sci_start_rx(port);
>  	if (!port_lock_held)
> -- 
> 2.17.1
> 
