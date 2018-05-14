Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47467 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932253AbeENOah (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 May 2018 10:30:37 -0400
Date: Mon, 14 May 2018 16:30:33 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add GPIO device nodes
Message-ID: <20180514143032.fxk4gcww6xihilrl@verge.net.au>
References: <20180513090855.25982-1-horms+renesas@verge.net.au>
 <e9646f33-9a82-f3ea-c4a6-cd2469b7658a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9646f33-9a82-f3ea-c4a6-cd2469b7658a@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 13, 2018 at 12:12:27PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 5/13/2018 12:08 PM, Simon Horman wrote:
> 
> > The compat string renesas,gpio-rcar has been deprecated since v4.14,
> > the same release that r8a77990 SoC support was added. Thus
> > renesas,gpio-rcar can safely be removed without any risk of behaviour
> > changes between old and new mainline kernels and DTBs.
> 
>    This hardly matches the subject. :-)

Indeed, I will resubmit.

> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> [...]
> 
> MBR, Sergei
> 
