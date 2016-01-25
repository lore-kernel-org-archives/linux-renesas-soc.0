Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, dmaengine@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, vinod.koul@intel.com,
	linus.walleij@linaro.org, geert+renesas@glider.be,
	dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dma-mapping: add dma_{map,unmap}_page_attrs
Date: Mon, 25 Jan 2016 10:09:41 +0100
Message-ID: <1926814.s3ZxygyFZe@wuerfel>
In-Reply-To: <1989275.WS6Og0GPnT@avalon>
References: <1453384895-20395-1-git-send-email-niklas.soderlund+renesas@ragnatech.se> <1453384895-20395-2-git-send-email-niklas.soderlund+renesas@ragnatech.se> <1989275.WS6Og0GPnT@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sunday 24 January 2016 22:43:57 Laurent Pinchart wrote:
> Hi Niklas,
> 
> (CC'ing LKML, linux-arch and Arnd Bergmann)
> 
> Thank you for the patch.
> 
> On Thursday 21 January 2016 15:01:31 Niklas S�derlund wrote:
> > Add a version of dmap_{map,unmap}_page that can pass on attributes to
> > the underlaying map_page. This already exists for dma_{map,unmap}_single
> > and dmap_{map,unmap}_sg versions.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

The patch looks fine, but won't apply any more now that the code has
been moved to include/linux/dma-mapping.h

	Arnd
