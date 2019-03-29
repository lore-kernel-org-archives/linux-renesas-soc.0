Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A03C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 10:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 026902075E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 10:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Ln4J+7MD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbfC2KmK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 06:42:10 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:48163 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbfC2KmI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 06:42:08 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8B4B025BF12;
        Fri, 29 Mar 2019 21:42:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553856126; bh=5fB/ROVv7w6dzl469Z26MR4zgjTiql+hLtnRUOapjtM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ln4J+7MDQ+6UQYaWyXSXDRYaodV6yVE2m1FSfbuj/rS3Zo7xfY43Ri5Tz5b2iLzqu
         4KsSiRsU4jipNg3rlQ6afHj4OVWsD17Mu/ACASWCynxRrwmAjnB7LLByQcYikkZ7RM
         tmf5vclZ7BnRW1L6VxxUT5fZawWBjYoz0B/XZBT0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B1716940381; Fri, 29 Mar 2019 11:42:04 +0100 (CET)
Date:   Fri, 29 Mar 2019 11:42:04 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Fix HSCIF RX sampling point adjustment
Message-ID: <20190329104204.vw72ltile6a725kn@verge.net.au>
References: <20190329091026.18958-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190329091026.18958-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 29, 2019 at 10:10:26AM +0100, Geert Uytterhoeven wrote:
> The calculation of the sampling point has min() and max() exchanged.
> Fix this by using the clamp() helper instead.
> 
> Fixes: 63ba1e00f178a448 ("serial: sh-sci: Support for HSCIF RX sampling point adjustment")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/tty/serial/sh-sci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 060fcd42b6d56010..2bdaeba5d527a6ce 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2529,7 +2529,7 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>  				 * last stop bit; we can increase the error
>  				 * margin by shifting the sampling point.
>  				 */
> -				int shift = min(-8, max(7, deviation / 2));
> +				int shift = clamp(deviation / 2, -8, 7);
>  
>  				hssrr |= (shift << HSCIF_SRHP_SHIFT) &
>  					 HSCIF_SRHP_MASK;
> -- 
> 2.17.1
> 
