Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54741 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbeA2ISQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jan 2018 03:18:16 -0500
Date: Mon, 29 Jan 2018 09:18:11 +0100
From: Simon Horman <horms@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: renesas: consistently use single space
 before =
Message-ID: <20180129081811.3pa5rg34dmvtlctf@verge.net.au>
References: <20180126093635.16945-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180126093635.16945-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 26, 2018 at 10:36:32AM +0100, Simon Horman wrote:
> Consistently use a single space before a =.
> 
> This series fixes instances where a tab is used instead.
> 
> This is part of an ongoing effort to improve consistency within and between
> the DT of Renesas SoCs to allow for easier comparison and maintenance.
> 
> This series should not introduce any functional change.
> 
> Based on renesas-devel-20180123-v4.15-rc9

I have applied this series with Geert's reviewed-by tags.
