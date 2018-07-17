Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57053 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731239AbeGQMuU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 08:50:20 -0400
Date: Tue, 17 Jul 2018 14:17:53 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: sh-sci: Fix use-after-free on subsequent port
 startup
Message-ID: <20180717121752.jdsefuqhlidxkztp@verge.net.au>
References: <20180717085810.23502-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180717085810.23502-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 17, 2018 at 10:58:10AM +0200, Geert Uytterhoeven wrote:
> sci_request_irq() checks port->irqstr[j] for a NULL pointer, to decide
> if a fallback interrupt name string should be allocated or not.
> 
> While this string is freed during port shutdown, the pointer is not
> zeroed.  Hence on a subsequent startup of the port, it will still be
> pointing to the freed memory, leading to e.g.
> 
>     WARNING: CPU: 0 PID: 404 at fs/proc/generic.c:388 __proc_create+0xbc/0x260
>     name len 0
> 
> or to a crash (the latter is more likely with CONFIG_DEBUG_SLAB=y, due
> to the poisoning of freed memory).
> 
> Instead of zeroeing the pointer at multiple places, preinitialize
> port->irqstr[j] to zero to fix this.
> 
> Fixes: 8b0bbd956228ae87 ("serial: sh-sci: Add support for R7S9210")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
