Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:36153 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752850AbdBASGW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 13:06:22 -0500
Received: by mail-lf0-f51.google.com with SMTP id z134so232857157lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Feb 2017 10:06:21 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 1 Feb 2017 19:06:18 +0100
To: David Miller <davem@davemloft.net>
Cc: sergei.shtylyov@cogentembedded.com, horms+renesas@verge.net.au,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        geert@linux-m68k.org
Subject: Re: [PATCH 0/2] sh_eth: fixes for MagicPacket handling
Message-ID: <20170201180618.GB22023@bigcity.dyn.berto.se>
References: <20170201144155.17123-1-niklas.soderlund+renesas@ragnatech.se>
 <20170201.125441.297548008793869251.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170201.125441.297548008793869251.davem@davemloft.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2017-02-01 12:54:41 -0500, David Miller wrote:
> From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Date: Wed,  1 Feb 2017 15:41:53 +0100
> 
> > This series contain two fixes for MagicPacket handling. It's based on 
> > top of net-next and is tested on Koelsch.
> 
> Series applied, thanks.
> 
> I fixed the "register" --> "registered" thing in the commit message
> for patch #2 when I applied this.

Thanks for applying and thanks for fixing the typo.

> 
> Thanks again.

-- 
Regards,
Niklas S�derlund
