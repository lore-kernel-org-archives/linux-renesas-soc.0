Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:53464 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751731AbcD1OOz (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 10:14:55 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Simon Horman <horms+renesas@verge.net.au>, arm@kernel.org,
	Kevin Hilman <khilman@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.7
Date: Thu, 28 Apr 2016 16:14:15 +0200
Message-ID: <1813099.gFLC2Strmj@wuerfel>
In-Reply-To: <cover.1461723181.git.horms+renesas@verge.net.au>
References: <cover.1461723181.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday 27 April 2016 14:06:43 Simon Horman wrote:
> Second Round of Renesas ARM64 Based SoC DT Updates for v4.7
> 
> * Don't disable referenced optional clocks in DT of r8a7795 SoC
> * Populate EXTALR in DT of salvator-x board
> * Enable PCIe in DT of salvator-x board
> 

Pulled into next/dt64.

I briefly looked at the contents and noticed that the PCIe host
node you add has a dma-ranges property, but its parent node does
not, so you are still limited to 32-bit DMA and you should fix that.

	Arnd
