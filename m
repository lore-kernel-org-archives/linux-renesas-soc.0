Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:32951 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbcLAKMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 05:12:43 -0500
Received: by mail-lf0-f45.google.com with SMTP id c13so167409298lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2016 02:12:42 -0800 (PST)
Subject: Re: [PATCH] sh_eth: add missing checks for status bits
To: Simon Horman <horms@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>
References: <20161130200148.9011-1-chris.brandt@renesas.com>
 <20161201085223.GD18042@verge.net.au>
Cc: David Miller <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <185d6cf0-6f46-9e04-a55d-5f13535c513b@cogentembedded.com>
Date: Thu, 1 Dec 2016 13:12:39 +0300
MIME-Version: 1.0
In-Reply-To: <20161201085223.GD18042@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/1/2016 11:52 AM, Simon Horman wrote:

>> When streaming a lot of data and the RZ can't keep up, some status bits
>> will get set that are not being checked or cleared which cause the
>> following messages and the Ethernet driver to stop working. This
>> patch fixes that issue.
>>
>> irq 21: nobody cared (try booting with the "irqpoll" option)
>> handlers:
>> [<c036b71c>] sh_eth_interrupt
>> Disabling IRQ #21
>>
>> Fixes: db893473d313a4ad ("sh_eth: Add support for r7s72100")
>> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>
> Hi Chris,
>
> I am wondering if the EESR_FRC but should also be checked.

    EESR.FRC is not an error bit and it's part of EESR_RX_CHECK already.

MBR, Sergei
