Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:49703 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759409AbcIMPgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2016 11:36:10 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Simon Horman <horms+renesas@verge.net.au>, arm@kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for v4.9
Date: Tue, 13 Sep 2016 17:35:25 +0200
Message-ID: <14474684.Hhngk1emgJ@wuerfel>
In-Reply-To: <cover.1473234371.git.horms+renesas@verge.net.au>
References: <cover.1473234371.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, September 7, 2016 9:49:30 AM CEST Simon Horman wrote:
> Second Round of Renesas ARM Based SoC DT Updates for v4.9
> 
> Fixes (for v4.9):
> * Correct PWM clock parent on r8a7794 SoC
> 
> Clean-up:
> * Remove obsolete vsp1 properties from r8a779[01] SoCs
> 
> New boards:
> * Add r8a7792/wheat and r7s72100/rskrza1 boards
> 
> Enablement:
> * Enable LEDs, DU, SDHI on r8a7792/blanche board
> * Enable MMCIF and SDHI on r8a7794/alt board
> * Add SPI and VSP1 to r8a7792 SoC
> * Add ethernet to r7s72100 SoC
> 

Pulled into next/dt, thanks!

	Arnd
