Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45326 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750878AbeEBGpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 02:45:03 -0400
Date: Wed, 2 May 2018 08:44:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: consistently name r8a77965 as M3-N
Message-ID: <20180502064443.3uifvko5ceyc2jsb@verge.net.au>
References: <20180424055442.19710-1-horms+renesas@verge.net.au>
 <20180501134103.GA29214@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180501134103.GA29214@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 01, 2018 at 08:41:03AM -0500, Rob Herring wrote:
> On Tue, Apr 24, 2018 at 07:54:42AM +0200, Simon Horman wrote:
> > There is an inconsistency between the use of M3N and M3-N.
> > This patch resolves this by consistently using the latter.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > Based on renesas-devel-20180423-v4.17-rc2
> > ---
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, applied.
