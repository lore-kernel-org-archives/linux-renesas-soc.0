Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:41516 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752158AbdBCJQH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Feb 2017 04:16:07 -0500
Date: Fri, 3 Feb 2017 10:16:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de,
        geert@linux-m68k.org, linux-serial@vger.kernel.org,
        magnus.damm@gmail.com, sergei.shtylyov@cogentembedded.com
Subject: Re: [PATCH v3 4/7] serial: sh-sci: increase RX FIFO trigger defaults
 for (H)SCIF
Message-ID: <20170203091611.GA28577@kroah.com>
References: <1486055420-31595-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1486055420-31595-5-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486055420-31595-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 02, 2017 at 06:10:17PM +0100, Ulrich Hecht wrote:
> Sets reasonable trigger defaults for the various SCIF variants.
> Also corrects the FIFO size for SH7705-style ports.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/sh-sci.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)

This patch doesn't apply cleanly, so I've stopped here in the series.
Please rebase and resend the rest.

thanks,

greg k-h
