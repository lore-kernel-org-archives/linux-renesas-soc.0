Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45732 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730290AbeIRWaQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Sep 2018 18:30:16 -0400
Received: by mail-lj1-f194.google.com with SMTP id u83-v6so2405744lje.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Sep 2018 09:56:48 -0700 (PDT)
Subject: Re: [PATCH v3 net-next] ravb: do not write 1 to reserved bits
To: Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20180918102226.8017-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <56bacfca-e2a9-fbad-77cc-5c06d10f0648@cogentembedded.com>
Date: Tue, 18 Sep 2018 19:56:45 +0300
MIME-Version: 1.0
In-Reply-To: <20180918102226.8017-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/18/2018 01:22 PM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> EtherAVB hardware requires 0 to be written to status register bits in
> order to clear them, however, care must be taken not to:
> 
> 1. Clear other bits, by writing zero to them
> 2. Write one to reserved bits
> 
> This patch corrects the ravb driver with respect to the second point above.
> This is done by defining reserved bit masks for the affected registers and,
> after auditing the code, ensure all sites that may write a one to a
> reserved bit use are suitably masked.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

   BTW, perhaps this should be merged into net.git instead? DaveM, your call? :-)

MBR, Sergei
