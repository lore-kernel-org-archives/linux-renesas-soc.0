Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:51275 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750957AbcEINks (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 09:40:48 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT PM Domain Updates for v4.7
Date: Mon, 09 May 2016 15:40:07 +0200
Message-ID: <13082172.iWN9bWJntt@wuerfel>
In-Reply-To: <cover.1461730364.git.horms+renesas@verge.net.au>
References: <cover.1461730364.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday 27 April 2016 14:20:10 Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT PM Domain updates for v4.7.
> 
> This pull requests is based on a merge of:
> 
> * "[GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC Updates for
>   v4.7", tagged as renesas-rcar-sysc2-for-v4.7, which you have already
>   pulled
> * "[GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.7",
>   tagged as renesas-arm64-dt2-for-v4.7, which I have sent a pull request
>   for.
> 
> The reason for the somewhat tedious base on
> renesas-rcar-sysc2-for-v4.7, which provides driver changes,
> is a hard run-time dependency.
> 
> I also have a similar set of changes for ARM (32-bit) which I will send
> separately.
> 

Pulled into next/late now along with the 32-bit branch. Thanks,

	Arnd
