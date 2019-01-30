Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C9DC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB2902184D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="LbSig1/A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbfA3KEj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:04:39 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39049 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfA3KEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 05:04:39 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 67BA125B74E;
        Wed, 30 Jan 2019 21:04:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548842677; bh=RXtWlUA5u1VF1lTuQR7oU1DyQmUBXl8w09W8LIhqnXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LbSig1/AUeUhdwtuIY6MZCcL4LMoC6J5iXTNFvCpjrrBJjDIV/FZS5DRS5atrshdz
         V2rIzqhkoCXj9sfF6e2ywesDKhjEyOMziBiWQ/WScWwY0IvTPwFtu1T7jP6oONlo6I
         3CH+jH+tErW3APt8vdCAsOazG435DMG0r1AXiqPE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9FAEC94043D; Wed, 30 Jan 2019 11:04:35 +0100 (CET)
Date:   Wed, 30 Jan 2019 11:04:35 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] serial: sh-sci: Do not free irqs that have already
 been freed
Message-ID: <20190130100434.kxpmxt7hrp35gulq@verge.net.au>
References: <20190128182556.34359-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128182556.34359-1-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 01:25:56PM -0500, Chris Brandt wrote:
> Since IRQs might be muxed on some parts, we need to pay attention when we
> are freeing them.
> Otherwise we get the ugly WARNING "Trying to free already-free IRQ 20".
> 
> Fixes: 628c534ae735 ("serial: sh-sci: Improve support for separate TEI and DRI interrupts")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v2:
>  * fix bad commit grammer

s/grammer/grammar/ :)

> ---
>  drivers/tty/serial/sh-sci.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index cb3d5d37674f..060fcd42b6d5 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1936,7 +1936,7 @@ static int sci_request_irq(struct sci_port *port)
>  
>  static void sci_free_irq(struct sci_port *port)
>  {
> -	int i;
> +	int i, j;
>  
>  	/*
>  	 * Intentionally in reverse order so we iterate over the muxed
> @@ -1952,6 +1952,13 @@ static void sci_free_irq(struct sci_port *port)
>  		if (unlikely(irq < 0))
>  			continue;
>  
> +		/* Check if already freed (irq was muxed) */
> +		for (j = 0; j < i; j++)
> +			if (port->irqs[j] == irq)
> +				j = i + 1;
> +		if (j > i)
> +			continue;
> +
>  		free_irq(port->irqs[i], port);
>  		kfree(port->irqstr[i]);
>  
> -- 
> 2.16.1
> 
