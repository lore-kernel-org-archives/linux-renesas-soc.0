Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:26261 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752845AbcJ1K3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 06:29:34 -0400
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp>
 <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
 <580620CD.50703@sang-engineering.com>
 <b7e9b4c2-1d5d-2e76-c0f4-fcc50150dc30@jinso.co.jp>
 <CAMuHMdWuHZ=5ogTE9rG=hjJxVn4dADc_cXuEcO76goq8KDf9kg@mail.gmail.com>
 <125b4831-cbdf-f8e1-da97-8ea9cf458c22@jinso.co.jp>
 <CAMuHMdU1-+AqnQpQPrsSxD0tQpjaeEPxiawULTJaUFsGO2Kc1A@mail.gmail.com>
 <SIXPR06MB0559BA3B149F002AE534F8C5D8AD0@SIXPR06MB0559.apcprd06.prod.outlook.com>
Cc: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        hideo inayoshi <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
From: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Message-ID: <c3d9097a-12c3-27e3-afe9-7730929a9468@jinso.co.jp>
Date: Fri, 28 Oct 2016 19:29:27 +0900
MIME-Version: 1.0
In-Reply-To: <SIXPR06MB0559BA3B149F002AE534F8C5D8AD0@SIXPR06MB0559.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san

Thanks for your patch.

We will apply your patch and retest this issue on v4.9-rc2 then report 
you again.


Thanks and best regards
JINSO/Truong


On 2016年10月28日 17:14, Yoshihiro Shimoda wrote:
> Hi Geert-san, Xuan-san,
>
>> From: linux-renesas-soc-owner@vger.kernel.org [mailto:linux-renesas-soc-owner@vger.kernel.org] On Behalf Of Geert
>> Uytterhoeven
>> Sent: Monday, October 24, 2016 6:21 PM
>>
>> On Mon, Oct 24, 2016 at 11:13 AM, Xuan Truong Nguyen
>> <nx-truong@jinso.co.jp> wrote:
>>>> This is with shmobile_defconfig?
>>> yes. we also attach the configs file we used
>>> (lager-scif-pio-v4.9-rc2.config)
>>>
>>>> Does it work better if you enable CONFIG_SERIAL_SH_SCI_DMA?
>>> yes, it's better a little bit. the kernel does not hangs up, but the warning
>>> message is output.
>>> please refer lager-scif-dma.log.
>>>
>>> we tested on v4.9-rc2. the issue is the same.
>>>
>>> if you need any information, please let us know.
>>> WARNING: CPU: 0 PID: 2249 at drivers/dma/sh/rcar-dmac.c:1257 rcar_dmac_tx_status+0x128/0x4
>>> No descriptor for cookie!
>>> [<c03419e8>] (rcar_dmac_tx_status) from [<c0371e04>] (rx_timer_fn+0x48/0x148)
>>> [<c0371dbc>] (rx_timer_fn) from [<c016dedc>] (call_timer_fn+0x2c/0xa0)
>> That looks like a race condition between timeout handling and actual completion
>> of the DMA?
> I found an issue in sh-sci.c and made a patch to resolve it.
> But, I'm not sure this is correct way.
> If this is correct way, we also have to fix dev_dbg() in some functions.
>
> Best regards,
> Yoshihiro Shimoda
>
> Since I send this email using Outlook, the patch format may be not good.
> ---
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Date: Fri, 28 Oct 2016 16:52:36 +0900
> Subject: [PATCH] serial: sh-sci: remove dev_warn() to avoid double spin lock
>   held
>
> If we use serial console and CONFIG_SERIAL_SH_SCI_DMA=y, since
> sci_dma_rx_push() is called with port->lock held and dev_warn() will
> call serial_console_write() finally, this is possible to call
> spin_lock{_irqsave}() twice.
> To avoid this, this patch remove dev_warn() in sci_dma_rx_push().
>
> Reported-by: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/tty/serial/sh-sci.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 4b26252..380b5d7 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1142,11 +1142,8 @@ static int sci_dma_rx_push(struct sci_port *s, void *buf, size_t count)
>   	int copied;
>   
>   	copied = tty_insert_flip_string(tport, buf, count);
> -	if (copied < count) {
> -		dev_warn(port->dev, "Rx overrun: dropping %zu bytes\n",
> -			 count - copied);
> +	if (copied < count)
>   		port->icount.buf_overrun++;
> -	}
>   
>   	port->icount.rx += copied;
>   
