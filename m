Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57417 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752033AbeGBOM7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 10:12:59 -0400
Date: Mon, 2 Jul 2018 16:12:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77970: remove
 SH_PFC_PIN_CFG_DRIVE_STRENGTH flag
Message-ID: <20180702141240.jy5d7z2ll3e27tti@verge.net.au>
References: <20180702080544.22665-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180702080544.22665-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 02, 2018 at 10:05:44AM +0200, Niklas Söderlund wrote:
> The datasheet do not document any registers to control drive strength,
> and no drive strength registers are for this reason described for this
> SoC. The flag indicating that drive strength can be controlled are
> however set for some pins in the driver.
> 
> This leads to a NULL pointer dereference when the sh-pfc core tries to
> access the struct describing the drive strength registers, for example
> when reading the sysfs file pinconf-pins.
> 
> Fix this by removing the SH_PFC_PIN_CFG_DRIVE_STRENGTH from all pins.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
