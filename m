Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40621 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752379AbeBZLCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 06:02:11 -0500
Date: Mon, 26 Feb 2018 12:02:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Yao Lihua <ylhuajnu@outlook.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable R8A77965 SoC
Message-ID: <20180226110207.k67jq2y7hxsmyfh4@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN4PR0601MB3709B0D878715B944580EFCCC4CC0@SN4PR0601MB3709.namprd06.prod.outlook.com>
 <e10b7083-5148-0463-9ca9-1eb08483265e@mentor.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 23, 2018 at 05:27:30PM +0200, Vladimir Zapolskiy wrote:
> Hi Simon,
> 
> On 02/23/2018 10:51 AM, Simon Horman wrote:
> > Enable the Renesas R-Car M3-W (R8A77965) SoC in the ARM64 defconfig.
> 
> If I'm not mistaken in my tardy note, then M3-W is R8A7796 and R8A77965 is M3-N, no?

On Fri, Feb 23, 2018 at 03:29:08PM +0000, Yao Lihua wrote:
> On Friday, February 23, 2018 04:51 PM, Simon Horman wrote:
> > Enable the Renesas R-Car M3-W (R8A77965) SoC in the ARM64 defconfig.
> R8A77965 should be M3-N?

Thanks, I have fixed this up to read M3-N.
