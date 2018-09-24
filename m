Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49431 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbeIXOrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 10:47:43 -0400
Date: Mon, 24 Sep 2018 10:46:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Subject: Re: [PATCH v2 net-next] ravb: remove tx buffer addr 4byte alilgnment
 restriction for R-Car Gen3
Message-ID: <20180924084639.leelej2vxwt2fvb6@verge.net.au>
References: <20180919080621.821-1-horms+renesas@verge.net.au>
 <4b0144fc-d2f2-e687-eb15-4ad703f9c649@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b0144fc-d2f2-e687-eb15-4ad703f9c649@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 21, 2018 at 07:14:02PM +0300, Sergei Shtylyov wrote:
> On 09/19/2018 11:06 AM, Simon Horman wrote:
> 
> > From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > 
> > This patch sets from two descriptor to one descriptor because R-Car Gen3
> > does not have the 4 bytes alignment restriction of the transmission buffer.
> > 
> > Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > v2 [Simon Horman]
> > * As per review by Sergi Shtylyov
> 
>    It's Sergei or (more correctly) Sergey. :-)

Sorry, that was completely unintentional.

> 
> >   - Use reverse xmas tree for variable declarations
> >   - Use > rather than >= for conditions
> >   - Dropped unnecessary parentheses
> >   - Don't allocate memory for tx_align when it will not be used
> >   - But, kept NUM_TX_DESC_GEN[23] as I see some value in
> >     the self-documentation provided by these #defines
> [...]
> 
>    Better late than never (-:
> 
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> MBR, Sergei
> 
