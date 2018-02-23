Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-bn3nam01on0068.outbound.protection.outlook.com ([104.47.33.68]:33696
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751762AbeBWNlv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 08:41:51 -0500
Subject: Re: [PATCH v2 9/9] serial: xuartps: Fix out-of-bounds access through
 DT alias
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
References: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
 <1519393117-31998-10-git-send-email-geert+renesas@glider.be>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <8e402b43-e773-4a44-6a0a-6bac2e46aaa3@xilinx.com>
Date: Fri, 23 Feb 2018 14:41:38 +0100
MIME-Version: 1.0
In-Reply-To: <1519393117-31998-10-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 23.2.2018 14:38, Geert Uytterhoeven wrote:
> The cdns_uart_port[] array is indexed using a value derived from the
> "serialN" alias in DT, which may lead to an out-of-bounds access.
> 
> Fix this by adding a range check.
> 
> Fixes: 928e9263492069ee ("tty: xuartps: Initialize ports according to aliases")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Fix Fixes reference.
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

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
