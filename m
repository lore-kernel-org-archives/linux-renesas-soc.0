Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33966 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbeGZPOY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jul 2018 11:14:24 -0400
Date: Thu, 26 Jul 2018 15:57:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] ARM: shmobile: Add basic RZ/A2 SoC support
Message-ID: <20180726135719.fpa7n44mvi4gmehl@verge.net.au>
References: <20180725212220.44525-1-chris.brandt@renesas.com>
 <20180725212220.44525-2-chris.brandt@renesas.com>
 <CAMuHMdVWoOS2Rj52=wjdfDLrHgx_a==6TqB9_VWPbXdvKNLw1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVWoOS2Rj52=wjdfDLrHgx_a==6TqB9_VWPbXdvKNLw1g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 26, 2018 at 01:51:18PM +0200, Geert Uytterhoeven wrote:
> On Wed, Jul 25, 2018 at 11:22 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Add the RZ/A2 SoC to the Renesas SoC collection.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.20.

I'm expecting v3 of patches 2 and 3 to address Geert's review of them.
