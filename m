Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:40636 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751840AbdLEIjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 03:39:36 -0500
MIME-Version: 1.0
In-Reply-To: <607df840-613e-b86c-2224-43815b50627c@cogentembedded.com>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
 <20171204133327.3505-2-thomas.petazzoni@free-electrons.com> <607df840-613e-b86c-2224-43815b50627c@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2017 09:39:35 +0100
Message-ID: <CAMuHMdVzzVZcR+oCJsHeuP-nyav=kMbjmipiJGfrY7s_DZ5qnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: sh_eth: use correct "struct device" when calling
 DMA mapping functions
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Dec 4, 2017 at 9:05 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 12/04/2017 04:33 PM, Thomas Petazzoni wrote:
>> There are two types of "struct device": the one representing the
>> physical device on its physical bus (platform, SPI, PCI, etc.), and
>> the one representing the logical device in its device class (net,
>> etc.).
>>
>> The DMA mapping API expects to receive as argument a "struct device"
>> representing the physical device, as the "struct device" contains
>> information about the bus that the DMA API needs.
>>
>> However, the sh_eth driver mistakenly uses the "struct device"
>> representing the logical device (embedded in "struct net_device")
>> rather than the "struct device" representing the physical device on
>> its bus.
>>
>> This commit fixes that by adjusting all calls to the DMA mapping API.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>   drivers/net/ethernet/renesas/sh_eth.c | 19 ++++++++++---------
>>   1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/renesas/sh_eth.c
>> b/drivers/net/ethernet/renesas/sh_eth.c
>> index 7e060aa9fbed..91e918e654fe 100644
>> --- a/drivers/net/ethernet/renesas/sh_eth.c
>> +++ b/drivers/net/ethernet/renesas/sh_eth.c
>> @@ -1149,7 +1149,8 @@ static int sh_eth_tx_free(struct net_device *ndev,
>> bool sent_only)
>>                            entry, le32_to_cpu(txdesc->status));
>>                 /* Free the original skb. */
>>                 if (mdp->tx_skbuff[entry]) {
>> -                       dma_unmap_single(&ndev->dev,
>> le32_to_cpu(txdesc->addr),
>> +                       dma_unmap_single(&mdp->pdev->dev,
>
>
>    Using 'ndev->dev.parent' (as in ravb) also should work... not sure which
> is better

That was going to be my comment, too. I also haven't checked which
generates the smallest code.

> (although I'm seeing very strange things in the ravb driver built
> with AArch654 gcc 4.8.5).

Don't worry, you've just been bitten by the %p pointer hashing :-(
Use %px instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
