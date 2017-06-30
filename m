Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44820 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751858AbdF3JsC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2017 05:48:02 -0400
Date: Fri, 30 Jun 2017 11:47:57 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: dts: r8a7792: add IMR-L[S]X3 clocks
Message-ID: <20170630094757.GC26710@verge.net.au>
References: <20170321200443.078095898@cogentembedded.com>
 <34050114-752a-08b6-700e-697e78102af7@cogentembedded.com>
 <a802018c-9943-22e5-0f78-28b8ab9689d9@cogentembedded.com>
 <20170329080417.GD6512@verge.net.au>
 <fbd0e4c2-746c-8f74-a8e5-ab971a087aed@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbd0e4c2-746c-8f74-a8e5-ab971a087aed@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 28, 2017 at 11:49:01PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 03/29/2017 11:04 AM, Simon Horman wrote:
> 
> >>>Still not cover letter but I think it's better now, so I won't retry...
> >>>The patches are against Simon Horman's 'renesas.git' repo,
> >>>'renesas-devel-20170321-v4.11-rc3' tag.
> >>
> >>   The patches depend on the IMR driver patches adding the IMR-L[S]X3
> >>support for the "compatible" values.
> >
> >I have marked these patches as deferred accordingly.
> 
>    Actually, the 1st patch in htis series doesn't depend on anything and
> should still apply (with offsets).

I'd prefer to take both patches at the same time unless there is a strong
motivation to just take the first one.
