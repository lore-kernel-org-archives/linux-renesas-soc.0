Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58819 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752475AbeBFMra (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 07:47:30 -0500
Date: Tue, 6 Feb 2018 13:47:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: add R8A77980 SYSC power domain
 definitions
Message-ID: <20180206124725.brfawcurxgl5spk2@verge.net.au>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <5177bec1-422f-688d-ea67-f15951505b1e@cogentembedded.com>
 <CAMuHMdWUGbnF+vA6r4NCvNh3-TLhnWZCm3ixxfy2+s6+9giKiw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWUGbnF+vA6r4NCvNh3-TLhnWZCm3ixxfy2+s6+9giKiw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 05, 2018 at 01:43:19PM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 2, 2018 at 7:29 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Add macros usable by the device tree sources to reference R8A77980 SYSC
> > power domains by index.
> >
> > Based on the original (and large) patch by Vladimir Barinov.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
