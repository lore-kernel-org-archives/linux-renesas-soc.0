Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55658 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751022AbeEMIHX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 04:07:23 -0400
Date: Sun, 13 May 2018 10:07:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: initial V3HSK board device tree
Message-ID: <20180513080704.yeypjjtv7hdmqajt@verge.net.au>
References: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com>
 <50de037c-7560-c261-f96a-f86065674c9b@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50de037c-7560-c261-f96a-f86065674c9b@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 10, 2018 at 09:12:30PM +0300, Sergei Shtylyov wrote:
> Add the initial device  tree for  the V3H Starter Kit board.
> The board has 1 debug serial port (SCIF0); include support for it,
> so that the serial console can work.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
