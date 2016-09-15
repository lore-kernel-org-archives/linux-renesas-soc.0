Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <niklas.soderlund@ragnatech.se>
Return-Path: <niklas.soderlund@ragnatech.se>
Date: Thu, 15 Sep 2016 15:19:05 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran+renesas@ksquared.org.uk>
Subject: Re: [PATCH 11/13] v4l: vsp1: Determine partition requirements for
 scaled images
Message-ID: <20160915131905.GB19172@bigcity.dyn.berto.se>
References: <1473808626-19488-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1473808626-19488-12-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20160914192733.GL739@bigcity.dyn.berto.se>
 <1554377.UPrL1uhbCT@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1554377.UPrL1uhbCT@avalon>
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2016-09-14 23:00:33 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Wednesday 14 Sep 2016 21:27:33 Niklas S�derlund wrote:
> > On 2016-09-14 02:17:04 +0300, Laurent Pinchart wrote:
> > > From: Kieran Bingham <kieran+renesas@bingham.xyz>
> > > 
> > > The partition algorithm needs to determine the capabilities of each
> > > entity in the pipeline to identify the correct maximum partition width.
> > > 
> > > Extend the vsp1 entity operations to provide a max_width operation and
> > > use this call to calculate the number of partitions that will be
> > > processed by the algorithm.
> > > 
> > > Gen 2 hardware does not require multiple partitioning, and as such
> > > will always return a single partition.
> > > 
> > > Signed-off-by: Kieran Bingham <kieran+renesas@bingham.xyz>
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > I can't find the information about the partition limitations for SRU or
> > UDS in any of the documents I have.
> 
> That's because it's not documented in the datasheet :-(

Sometimes a kind soul provides you with the proper documentation :-)

Acked-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> > But for the parts not relating to the logic of figuring out the hscale from
> > the input/output formats width:
> > 
> > Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas S�derlund
