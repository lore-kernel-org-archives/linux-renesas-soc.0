Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56244 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751270AbeDIM1m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Apr 2018 08:27:42 -0400
Date: Mon, 9 Apr 2018 14:27:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/3] R-Car DU: Fix LVDS output on Gen2 boards
Message-ID: <20180409122737.ec2ylrw6mrjt3xwn@verge.net.au>
References: <20180406191438.3630-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180409111714.rdfji4ub6cj332jc@verge.net.au>
 <2417530.tJNIET5ZDx@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2417530.tJNIET5ZDx@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 09, 2018 at 03:16:03PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Monday, 9 April 2018 14:17:15 EEST Simon Horman wrote:
> > On Fri, Apr 06, 2018 at 10:14:35PM +0300, Laurent Pinchart wrote:
> > > Hello,
> > > 
> > > This patch series fixes LVDS output support on the Lager, Koelsh, Porter
> > > and Gose boards that broke in v4.17-rc1 due to the combination of the
> > > R-Car DU LVDS driver rework and the DT move of all on-SoC peripherals to
> > > a /soc node.
> > > 
> > > We could handle the problem in the R-Car DU LVDS DT backward compatibility
> > > code, but that fix would only be used for v4.17 as in v4.18 the Gen2 DT
> > > will move to the new LVDS DT bindings. I thus propose merging these three
> > > patches in v4.17 already to fix the problem as this is the simplest
> > > solution.
> > > 
> > > The patches are based on top of Linus' master that includes both the R-Car
> > > DU changes and the ARM DT changes for v4.17-rc1. I can rebase them on top
> > > of v4.17-rc1 when it will be released, but I don't expect any change.
> > 
> > Thanks, I think this should be fine. Please ping me once v4.17-rc1 has
> > been released.
> 
> I'll send a v6 on top of v4.17-rc1 to fix the issue pointed out by Niklas in 
> patch 2/3.

Great, thanks!
