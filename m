Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53731 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751152AbcJ0HP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 03:15:29 -0400
Date: Thu, 27 Oct 2016 09:15:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        catalin.marinas@arm.com, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, khilman@baylibre.com
Subject: Re: [PATCH] arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP
 modules
Message-ID: <20161027071523.GD7706@verge.net.au>
References: <20161026052422.17283.57864.sendpatchset@little-apple>
 <20161027070801.GB7706@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161027070801.GB7706@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 27, 2016 at 09:08:01AM +0200, Simon Horman wrote:
> On Wed, Oct 26, 2016 at 02:24:22PM +0900, Magnus Damm wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> > 
> > Extend the ARM64 defconfig to enable the DU DRM device as module
> > together with required dependencies of V4L2 FCP and VSP modules.
> > 
> > This enables VGA output on the r8a7795 Salvator-X board.
> > 
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> Thanks, I have queued this up.

Given discussion elsewhere on enabling DU I am holding off on this for a
little; it is not queued up for now.
