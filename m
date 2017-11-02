Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43323 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751578AbdKBH64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Nov 2017 03:58:56 -0400
Date: Thu, 2 Nov 2017 08:58:25 +0100
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: shmobile: Document Renesas M3-W-based
 Salvator-XS board DT bindings
Message-ID: <20171102075825.3hiqwfbxjpqmeayp@verge.net.au>
References: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
 <1509384599-28953-2-git-send-email-geert+renesas@glider.be>
 <20171101214904.b5adavvirlmphnqn@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171101214904.b5adavvirlmphnqn@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 01, 2017 at 04:49:04PM -0500, Rob Herring wrote:
> On Mon, Oct 30, 2017 at 06:29:57PM +0100, Geert Uytterhoeven wrote:
> > The Renesas Salvator-XS (Salvator-X 2nd version) development board can
> > be equipped with either an R-Car H3 ES2.0 or M3-W ES1.x SiP, which are
> > pin-compatible.
> > 
> > Document board part number and compatible values for the version with
> > R-Car M3-W.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, applied.
