Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85DBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC6AC20693
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbfC2Jle (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:41:34 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:20978 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbfC2Jle (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 05:41:34 -0400
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id L0be16v2T9fUEed
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 29 Mar 2019 10:41:30 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:41:30 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-ID: <1002519656.1529086.1553852490561@webmail.strato.com>
In-Reply-To: <20190329091026.18958-1-geert+renesas@glider.be>
References: <20190329091026.18958-1-geert+renesas@glider.be>
Subject: Re: [PATCH] serial: sh-sci: Fix HSCIF RX sampling point adjustment
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev51
X-Originating-IP: 188.195.25.140
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On March 29, 2019 at 10:10 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> The calculation of the sampling point has min() and max() exchanged.
> Fix this by using the clamp() helper instead.
> 
> Fixes: 63ba1e00f178a448 ("serial: sh-sci: Support for HSCIF RX sampling point adjustment")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
