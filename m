Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 10 Feb 2016 18:55:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, arnd@arndb.de, geert+renesas@glider.be,
	vinod.koul@intel.com, linus.walleij@linaro.org,
	laurent.pinchart@ideasonboard.com, dan.j.williams@intel.com,
	robin.murphy@arm.com
Subject: Re: [PATCH v3 7/8] ARM: dts: r8a7790: add iommus to dmac0 and dmac1
Message-ID: <20160210175559.GD17671@verge.net.au>
References: <1455065878-11906-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <1455065878-11906-8-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455065878-11906-8-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

I am deferring accepting this and the similar patch for the r8a7791 pending
acceptance of the driver changes earlier in this series. Please let me know
if you prefer a different course of action.

I notice that the devel branch of there renesas tree there are
dmac nodes for the r8a7793, r8a7794 and r8a7795. Is this change,
also suitable for those SoCs? If so, do you plan to update them?
If not I'll add it to my todo list.
