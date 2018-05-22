Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36328 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbeEVIwP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 04:52:15 -0400
Date: Tue, 22 May 2018 10:52:10 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add GEther support
Message-ID: <20180522085209.ehqzfddqknghs6em@verge.net.au>
References: <a4230699-e46f-0782-e3b1-22d58b9033c8@cogentembedded.com>
 <8910c197-cf1b-9ee9-9ddb-5d2f705a4b26@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8910c197-cf1b-9ee9-9ddb-5d2f705a4b26@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 18, 2018 at 10:45:36PM +0300, Sergei Shtylyov wrote:
> Define the generic R8A77980 part of the GEther device node.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
