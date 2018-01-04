Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46738 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753240AbeADQ5J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 11:57:09 -0500
Date: Thu, 4 Jan 2018 17:57:04 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] ARM: dts: renesas: Reduce size of thermal registers
Message-ID: <20180104165704.i7ewh4i32zofs5vh@verge.net.au>
References: <20171220121445.31896-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171220121445.31896-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 20, 2017 at 01:14:42PM +0100, Simon Horman wrote:
> Reduce size of thermal registers in DT for the following SoCs:
> * r8a7790 (R-Car H2)
> * r8a7791 (R-Car M3-W)
> * r8a7793 (R-Car M3-N)
> 
> According to the "User's Manual: Hardware" v2.00 the registers at base
> 0xe61f0000 extend to an offset of 0x10, rather than 0x14 which is the case
> on the r8a73a4 (R-Mobile APE6).
> 
> This should not have any runtime affect as mapping granularity is PAGE_SIZE.
> 
> As pointed out by Geert Uytterhoeven.
> 
> Based on renesas-devel-20171220-v4.15-rc4
> 
> Simon Horman (3):
>   ARM: dts: r8a7790: Reduce size of thermal registers
>   ARM: dts: r8a7791: Reduce size of thermal registers
>   ARM: dts: r8a7793: Reduce size of thermal registers

Applied
