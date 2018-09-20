Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39197 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbeITOSr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 10:18:47 -0400
Received: by mail-lj1-f194.google.com with SMTP id l15-v6so7599756lji.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Sep 2018 01:36:26 -0700 (PDT)
Subject: Re: [PATCH v2 net-next] ravb: remove tx buffer addr 4byte alilgnment
 restriction for R-Car Gen3
To: David Miller <davem@davemloft.net>, horms+renesas@verge.net.au
Cc: magnus.damm@gmail.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kazuya.mizuguchi.ks@renesas.com
References: <20180919080621.821-1-horms+renesas@verge.net.au>
 <20180919.210836.924996973074874493.davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <60c73231-6e4a-5c18-139c-87d600967d97@cogentembedded.com>
Date: Thu, 20 Sep 2018 11:36:23 +0300
MIME-Version: 1.0
In-Reply-To: <20180919.210836.924996973074874493.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 9/20/2018 7:08 AM, David Miller wrote:

>> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>>
>> This patch sets from two descriptor to one descriptor because R-Car Gen3
>> does not have the 4 bytes alignment restriction of the transmission buffer.
>>
>> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> ---
>> v2 [Simon Horman]
>> * As per review by Sergi Shtylyov
>>    - Use reverse xmas tree for variable declarations
>>    - Use > rather than >= for conditions
>>    - Dropped unnecessary parentheses
>>    - Don't allocate memory for tx_align when it will not be used
>>    - But, kept NUM_TX_DESC_GEN[23] as I see some value in
>>      the self-documentation provided by these #defines
>>
>> v1 [Kazuya Mizuguchi]
> 
> Applied, thanks.

    Mhm, I was just going to re-review the patch...

MBR, Sergei
