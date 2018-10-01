Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45934 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729321AbeJATVb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 15:21:31 -0400
Date: Mon, 1 Oct 2018 14:43:49 +0200
From: Simon Horman <horms@verge.net.au>
To: David Miller <davem@davemloft.net>
Cc: andrew@lunn.ch, netdev@vger.kernel.org, f.fainelli@gmail.com,
        sergei.shtylyov@cogentembedded.com,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next 07/12] net: ethernet: Add helper to remove a
 supported link mode
Message-ID: <20181001124347.j4clx7ffwrzd6lcx@verge.net.au>
References: <20180921081735.z3stog3evjh4m7dx@verge.net.au>
 <20180924153559.kbs6v6o3sj5uenyp@verge.net.au>
 <20180924155023.GB10667@lunn.ch>
 <20180926.200846.2016469227623990606.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180926.200846.2016469227623990606.davem@davemloft.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 26, 2018 at 08:08:46PM -0700, David Miller wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> Date: Mon, 24 Sep 2018 17:50:23 +0200
> 
> > I submitted it to netdev in the usual way. I hope DaveM will accept
> > and merge it.
> 
> Andrew did I miss your patch somehow?
> 
> If so, sorry, please resend.

Hi Dave,

I believe you have the patch in net-next as:

65c5877f6462 ("ravb: Disable Pause Advertisement")
