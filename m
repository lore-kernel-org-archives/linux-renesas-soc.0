Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:40544 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727169AbeH1NrK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 09:47:10 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Cc: Nguyen An Hoan <na-hoan@jinso.co.jp>, broonie@kernel.org,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        magnus.damm@gmail.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH 1/2] arm64: dts: r8a77965: add FDP1 device nodes
Date: Tue, 28 Aug 2018 12:56:18 +0300
Message-ID: <23995298.iSy7kN2eB8@avalon>
In-Reply-To: <20180827125704.jg4zuj2pfjykbcga@verge.net.au>
References: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp> <8040588.1BRXcikCUd@avalon> <20180827125704.jg4zuj2pfjykbcga@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Monday, 27 August 2018 15:57:05 EEST Simon Horman wrote:
> On Fri, Aug 24, 2018 at 11:45:52AM +0300, Laurent Pinchart wrote:
> > On Friday, 24 August 2018 07:52:28 EEST Nguyen An Hoan wrote:
> > > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > 
> > You're missing a commit message. I agree that for simple patches like this
> > one the subject line often contains enough information, but adding a
> > commit message is still a good practice that we try to enforce through
> > the kernel. For instance, looking at git history for r8a7796, you could
> > use
> > 
> > "The r8a77965 has a single FDP1 instance."
> > 
> > > Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > 
> > Apart from that,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Simon, could you update the commit message when taking this patch in your
> > tree, to avoid the need for a v2 ?
> 
> Yes, can do.
> 
> Can I confirm that it is safe, from a regression point of view,
> to apply this patch without patch 2/2?

As far as I know it is safe, yes.

-- 
Regards,

Laurent Pinchart
