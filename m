Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50013 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730534AbeKWXEu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:04:50 -0500
Date: Fri, 23 Nov 2018 13:20:46 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] ARM: dts: r9a06g032: Correct the GIC DT node name
Message-ID: <20181123122046.xqxq7kxdkp7swxf4@verge.net.au>
References: <20181121100844.25825-1-phil.edworthy@renesas.com>
 <CAMuHMdUH74QA5oSuOe9LgoS08-CEHiGSz_FzPQs6S9BzCijDag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUH74QA5oSuOe9LgoS08-CEHiGSz_FzPQs6S9BzCijDag@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 23, 2018 at 10:24:06AM +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 21, 2018 at 11:10 AM Phil Edworthy
> <phil.edworthy@renesas.com> wrote:
> > Harmless mistake, but it's incorrect. The DT spec provides recommendations
> > for the node names:
> > "The name of a node should be somewhat generic, reflecting the function
> > of the device and not its precise programming model. If appropriate, the
> > name should be one of the following choices:
> > ...
> > interrupt-controller"
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
