Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52384 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750776AbdIMIOA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 04:14:00 -0400
Date: Wed, 13 Sep 2017 10:13:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 03/11] dt-bindings: power: add R8A77970 SYSC power domain
 definitions
Message-ID: <20170913081356.GK6756@verge.net.au>
References: <20170912210514.517628239@cogentembedded.com>
 <CAMuHMdUgVX719XfgM+7gwkmrfhjc-JjqKOadFz1asNUP+6apUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUgVX719XfgM+7gwkmrfhjc-JjqKOadFz1asNUP+6apUg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 10:11:31AM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 12, 2017 at 10:37 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Add macros usable by the device tree sources to reference R8A77970 SYSC
> > power domains by index.
> >
> > Based on the original (and large) patch by Daisuke Matsushita
> > <daisuke.matsushita.ns@hitachi.com>.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
