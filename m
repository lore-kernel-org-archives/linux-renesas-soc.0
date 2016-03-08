Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 7 Mar 2016 23:38:47 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Niklas S??derlund <niklas.soderlund+renesas@ragnatech.se>
Cc: vinod.koul@intel.com, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, iommu@lists.linux-foundation.org,
	robin.murphy@arm.com, laurent.pinchart@ideasonboard.com,
	geert+renesas@glider.be, linus.walleij@linaro.org,
	dan.j.williams@intel.com, arnd@arndb.de, linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 3/9] dma-mapping: add dma_{map,unmap}_resource
Message-ID: <20160308073847.GA15520@infradead.org>
References: <1457404974-1800-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
 <1457404974-1800-4-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457404974-1800-4-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Please add some documentation on where/how this should be used.  It's
not a very obvious interface.
