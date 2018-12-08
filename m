Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from void.printf.net ([192.34.86.38]:42219 "EHLO void.printf.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbeLHGHt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Dec 2018 01:07:49 -0500
Date: Sat, 8 Dec 2018 05:48:26 +0000
From: Chris Ball <chris@printf.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Avri Altman <avri.altman@wdc.com>,
        Chris Ball <chris@printf.net>
Subject: Re: [PATCH mmc-utils] use proper type for RPMB blocks_cnt
Message-ID: <20181208054826.GA12686@void.printf.net>
References: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Nov 30, 2018 at 01:54:47PM +0100, Wolfram Sang wrote:
> The JEDEC standard is confusing. The number of max blocks for reading
> RPMB is determined by CMD23 which can hold an unsigned int and not only
> u16. It is true that the current maximum is 64K of blocks, yet this may
> be extended in the future. Let's not apply a limit here which should be
> checked by the card.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied to mmc-utils master.

-- 
Chris Ball   <http://printf.net/>
