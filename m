Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:44040 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750863AbdAPQxw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 11:53:52 -0500
Date: Mon, 16 Jan 2017 11:53:50 -0500 (EST)
Message-Id: <20170116.115350.943642905478824707.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: horms+renesas@verge.net.au, magnus.damm@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        masaru.nagai.vx@renesas.com
Subject: Re: [PATCH net v3] ravb: do not use zero-length alignment DMA
 descriptor
From: David Miller <davem@davemloft.net>
In-Reply-To: <96396803-caac-13cd-3e17-f9d10fc608ad@cogentembedded.com>
References: <1484563521-12009-1-git-send-email-horms+renesas@verge.net.au>
        <96396803-caac-13cd-3e17-f9d10fc608ad@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Mon, 16 Jan 2017 16:01:49 +0300

> On 01/16/2017 01:45 PM, Simon Horman wrote:
> 
>> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
>>
>> Due to alignment requirements of the hardware transmissions are split
>> into
>> two DMA descriptors, a small padding descriptor of 0 - 3 bytes in
>> length
>> followed by a descriptor for rest of the packet.
>>
>> In the case of IP packets the first descriptor will never be zero due
>> to
>> the way that the stack aligns buffers for IP packets. However, for
>> non-IP
>> packets it may be zero.
>>
>> In that case it has been reported that timeouts occur, presumably
>> because
>> transmission stops at the first zero-length DMA descriptor and thus
>> the
>> packet is not transmitted. However, in my environment a BUG is
>> triggered as
>> follows:
> [...]
> 
>> Fixes: 2f45d1902acf ("ravb: minimize TX data copying")
>> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied and queued up for -stable, thanks.
