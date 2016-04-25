Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:53342 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964869AbcDYVDH (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 17:03:07 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2] Renesas ARM Based SoC DT Updates for v4.7
Date: Mon, 25 Apr 2016 23:02:28 +0200
Message-ID: <4737327.YB9LJZXs32@wuerfel>
In-Reply-To: <cover.1461558315.git.horms+renesas@verge.net.au>
References: <cover.1461558315.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Monday 25 April 2016 14:27:31 Simon Horman wrote:
> Renesas ARM Based SoC DT Updates for v4.7
> 
> * Configure NMI key as wakeup source in DT of kzm9g board
> * Add SDHI support to DT of gose board
> * Add support of UHS-I SDR-50 for SDHI to DT of r8a7790 SoC
> * Correct interrupt type for ARM TWD in DT of r8a7779 and sh73a0 SoCs
> * Add IIC support to DT of r8a7794 SoC
> * Add CAN support to DT of r8a7793 and r8a7794 SoCs
> * Add SCIF2 support to r8a7790 device tree
> * Use CAN, JPU and USB3.0 fallback compatibility string
>   in DT of r8a7791 and r8a7790 SoCs
> 

Pulled into next/dt, thanks!

	Arnd
