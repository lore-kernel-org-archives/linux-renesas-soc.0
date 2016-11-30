Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:51486 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751583AbcK3PqC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 10:46:02 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2] Second Round of Renesas ARM Based SoC DT Updates for v4.10
Date: Wed, 30 Nov 2016 16:45:24 +0100
Message-ID: <6048589.rSbvWcLf7m@wuerfel>
In-Reply-To: <cover.1479931686.git.horms+renesas@verge.net.au>
References: <cover.1479931686.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, November 23, 2016 9:14:33 PM CET Simon Horman wrote:
> Second Round of Renesas ARM Based SoC DT Updates for v4.10
> 
> Enhancements:
> * Add device nodes for PRR
> * Add r8a7745 SoC and sk-rzg1e board
> * Add r8a7743 SoC and sk-rzg1m board
> * Enable SDR-104 and I2C demuxer on alt, koelsch and lager boards
> 
> Corrections:
> * Use SYSC "always-on" PM Domain for sound on r8a7794 SoC
> * Correct hsusb parent clock on r8a7794 SoC
> * Correct PFC names for DU on alt board
> 

Pulled into next/dt, thanks!

	Arnd
