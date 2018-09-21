Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40816 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390179AbeIUWDl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 18:03:41 -0400
Received: by mail-lf1-f66.google.com with SMTP id t22-v6so2181326lfb.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Sep 2018 09:14:05 -0700 (PDT)
Subject: Re: [PATCH v2 net-next] ravb: remove tx buffer addr 4byte alilgnment
 restriction for R-Car Gen3
To: Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20180919080621.821-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4b0144fc-d2f2-e687-eb15-4ad703f9c649@cogentembedded.com>
Date: Fri, 21 Sep 2018 19:14:02 +0300
MIME-Version: 1.0
In-Reply-To: <20180919080621.821-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/19/2018 11:06 AM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> This patch sets from two descriptor to one descriptor because R-Car Gen3
> does not have the 4 bytes alignment restriction of the transmission buffer.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2 [Simon Horman]
> * As per review by Sergi Shtylyov

   It's Sergei or (more correctly) Sergey. :-)

>   - Use reverse xmas tree for variable declarations
>   - Use > rather than >= for conditions
>   - Dropped unnecessary parentheses
>   - Don't allocate memory for tx_align when it will not be used
>   - But, kept NUM_TX_DESC_GEN[23] as I see some value in
>     the self-documentation provided by these #defines
[...]

   Better late than never (-:

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
