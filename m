Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43374 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932207AbcHOOtm (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 15 Aug 2016 10:49:42 -0400
Date: Mon, 15 Aug 2016 10:49:40 -0400
From: Kyle McMartin <kyle@infradead.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-firmware@kernel.org
Subject: Re: [PATCH] usb: host: xhci-rcar: update firmware for R-Car H3 and
 M3-W
Message-ID: <20160815144940.GF2817@merlin.infradead.org>
References: <1470826599-20446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1470826599-20446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 10, 2016 at 07:56:39PM +0900, Yoshihiro Shimoda wrote:
> This patch updates the firmware files for R-Car H3 and M3-W to fix
> the device detection issue.
> 
> The md5sum of the files are:
> 645db7e9056029efa15f158e51cc8a11  r8a779x_usb3_v2.dlmem
> 687d5d42f38f9850f8d5a6071dca3109  r8a779x_usb3_v3.dlmem
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  r8a779x_usb3_v2.dlmem | Bin 9472 -> 9416 bytes
>  r8a779x_usb3_v3.dlmem | Bin 9472 -> 9416 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
> 

applied, thanks!

--kyle
