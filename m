Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36925 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753222AbeDUUov (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Apr 2018 16:44:51 -0400
Received: by mail-lf0-f51.google.com with SMTP id b23-v6so9639328lfg.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Apr 2018 13:44:51 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next 3/5] ravb: do not write 1 to reserved bits
To: David Miller <davem@davemloft.net>, horms+renesas@verge.net.au
Cc: magnus.damm@gmail.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        wsa+renesas@sang-engineering.com, kazuya.mizuguchi.ks@renesas.com
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-4-horms+renesas@verge.net.au>
 <20180417.101553.1512039208518397234.davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1908c6d0-f3e6-6436-c41c-7d2a388f91d4@cogentembedded.com>
Date: Sat, 21 Apr 2018 23:44:47 +0300
MIME-Version: 1.0
In-Reply-To: <20180417.101553.1512039208518397234.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 04/17/2018 05:15 PM, David Miller wrote:

>> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>>
>> This patch corrects writing 1 to reserved bits.
>> The write value should be 0.
>>
>> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> How are we ending up in situations where the driver is trying to write
> non-zero values to those fields in the first place?

   The brain damaged AVB core design is to blame here. You have to write 0 to
clear the set bits and, at the same time, you can't write 1 to the reserved
bits... :-/

> The places creating those values should be making sure that the
> reserved bits are never set.

   That's basically what this patch is doing.

> If you mask out the reserved bits in the register writing locations,
> this just hides bugs.

   There are no *other* locations in some cases... 
   And I don't think that forcing the reserved bits to 1 after a register is
read would look better. :-(

MBR, Sergei
