Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34904 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030949AbdDSTJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 15:09:55 -0400
Received: by mail-lf0-f45.google.com with SMTP id 75so17598462lfs.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2017 12:09:54 -0700 (PDT)
Subject: Re: [PATCH v2] sh_eth: unmap DMA buffers when freeing rings
To: David Miller <davem@redhat.com>
References: <20170417125532.826640693@cogentembedded.com>
 <20170417.161051.805859402797991771.davem@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        horms@verge.net.au
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <de18ee2d-b401-5542-7901-c35cee0adc70@cogentembedded.com>
Date: Wed, 19 Apr 2017 22:09:51 +0300
MIME-Version: 1.0
In-Reply-To: <20170417.161051.805859402797991771.davem@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/17/2017 11:10 PM, David Miller wrote:

>> The DMA API debugging (when enabled) causes:
>>
>> WARNING: CPU: 0 PID: 1445 at lib/dma-debug.c:519 add_dma_entry+0xe0/0x12c
>> DMA-API: exceeded 7 overlapping mappings of cacheline 0x01b2974d
>>
>> to be  printed after repeated initialization of the Ether device, e.g.
>> suspend/resume or 'ifconfig' up/down. This is because DMA buffers mapped
>> using dma_map_single() in sh_eth_ring_format() and sh_eth_start_xmit() are
>> never unmapped. Resolve this problem by unmapping the buffers when freeing
>> the descriptor  rings;  in order  to do it right, we'd have to add an extra
>> parameter to sh_eth_txfree() (we rename this function to sh_eth_tx_free(),
>> while at it).
>>
>> Based on the commit a47b70ea86bd ("ravb: unmap descriptors when freeing
>> rings").
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Applied, thanks.

    Please don;t forget to send it to -stable.
    The bug seems to be there from the very beginning.

MBR, Sergei
