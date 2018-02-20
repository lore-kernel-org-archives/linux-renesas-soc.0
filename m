Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-bl2nam02on0048.outbound.protection.outlook.com ([104.47.38.48]:39078
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751338AbeBTKWU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 05:22:20 -0500
Subject: Re: [PATCH 9/9] serial: xuartps: Fix out-of-bounds access through DT
 alias
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Barry Song <baohua@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
        Jiri Slaby <jslaby@suse.com>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-serial@vger.kernel.org>,
        <linux-snps-arc@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1519119624-1268-1-git-send-email-geert+renesas@glider.be>
 <1519119624-1268-10-git-send-email-geert+renesas@glider.be>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <c16b025a-a302-8515-2697-f7eca478e939@xilinx.com>
Date: Tue, 20 Feb 2018 11:22:05 +0100
MIME-Version: 1.0
In-Reply-To: <1519119624-1268-10-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 20.2.2018 10:40, Geert Uytterhoeven wrote:
> The cdns_uart_port[] array is indexed using a value derived from the
> "serialN" alias in DT, which may lead to an out-of-bounds access.
> 
> Fix this by adding a range check.
> 
> Fixes: 1f118c02a1819856 ("serial: xuartps: Fix out-of-bounds access through DT alias")

I didn't find this sha1 - patch name is this one.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/xilinx_uartps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
> index b9b2bc76bcac606c..abcb4d09a2d866d0 100644
> --- a/drivers/tty/serial/xilinx_uartps.c
> +++ b/drivers/tty/serial/xilinx_uartps.c
> @@ -1110,7 +1110,7 @@ static struct uart_port *cdns_uart_get_port(int id)
>  	struct uart_port *port;
>  
>  	/* Try the given port id if failed use default method */
> -	if (cdns_uart_port[id].mapbase != 0) {
> +	if (id < CDNS_UART_NR_PORTS && cdns_uart_port[id].mapbase != 0) {
>  		/* Find the next unused port */
>  		for (id = 0; id < CDNS_UART_NR_PORTS; id++)
>  			if (cdns_uart_port[id].mapbase == 0)
> 

Below should be better fix for this driver.

Thanks,
Michal

diff --git a/drivers/tty/serial/xilinx_uartps.c
b/drivers/tty/serial/xilinx_uartps.c
index b9b2bc76bcac..b77c6477ed93 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -1109,6 +1109,9 @@ static struct uart_port *cdns_uart_get_port(int id)
 {
        struct uart_port *port;

+       if (id >= CDNS_UART_NR_PORTS)
+               return NULL;
+
        /* Try the given port id if failed use default method */
        if (cdns_uart_port[id].mapbase != 0) {
                /* Find the next unused port */
@@ -1117,9 +1120,6 @@ static struct uart_port *cdns_uart_get_port(int id)
                                break;
        }

-       if (id >= CDNS_UART_NR_PORTS)
-               return NULL;
-
        port = &cdns_uart_port[id];

        /* At this point, we've got an empty uart_port struct,
initialize it */
