Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 27 Oct 2016 09:08:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        catalin.marinas@arm.com, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, khilman@baylibre.com
Subject: Re: [PATCH] arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP
 modules
Message-ID: <20161027070801.GB7706@verge.net.au>
References: <20161026052422.17283.57864.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161026052422.17283.57864.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 26, 2016 at 02:24:22PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Extend the ARM64 defconfig to enable the DU DRM device as module
> together with required dependencies of V4L2 FCP and VSP modules.
> 
> This enables VGA output on the r8a7795 Salvator-X board.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks, I have queued this up.
