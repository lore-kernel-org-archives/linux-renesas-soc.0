Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 14 May 2016 13:34:59 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: of_dma: approximate an average distribution
Message-ID: <20160514080458.GC23734@localhost>
References: <1462972511-20927-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1462972511-20927-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 11, 2016 at 03:15:11PM +0200, Niklas S�derlund wrote:
> Currently the following DT description would result in dmac0 always
> being tried first and dmac1 second if dmac0 was unavailable. This
> results in heavier use of dmac0 then of dmac1. This patch adds an
> approximate average distribution over the two nodes lessening the load
> of anyone of them.
> 
>    i2c6: i2c@e60b0000 {
>            ...
>            dmas = <&dmac0 0x77>, <&dmac0 0x78>,
>                   <&dmac1 0x77>, <&dmac1 0x78>;
>            dma-names = "tx", "rx", "tx", "rx";
>            ...
>    };

Applied, thanks

-- 
~Vinod
