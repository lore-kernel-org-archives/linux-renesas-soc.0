Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:36510 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750844AbcGGFnL (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 01:43:11 -0400
Received: by mail-pa0-f66.google.com with SMTP id ib6so847746pad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jul 2016 22:43:11 -0700 (PDT)
Date: Wed, 6 Jul 2016 22:11:09 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Kevin Hilman <khilman@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Updates for
 v4.8
Message-ID: <20160707051109.GF32389@localhost>
References: <cover.1467294011.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1467294011.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 30, 2016 at 04:15:54PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC DT updates for v4.8.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-dt-for-v4.8,
> which you have already pulled.
> 
> 
> The following changes since commit b6960f19676e19f37a5e5a8af059fdf3b435d2f4:
> 
>   ARM: dts: silk: Fix W=1 dtc warnings (2016-05-30 09:37:13 +0900)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt2-for-v4.8
> 
> for you to fetch changes up to 8fd763c75c3ab8e72e5d7f0d4c53531e6ff76197:
> 
>   ARM: dts: r8a7792: add SMP support (2016-06-30 14:26:14 +0200)

This one also introduces header files but I don't see any dependent driver
changes posted so far, so I'm going to presume that those changes will happen
after this is merged to avoid the cross-tree dependency.


Merged, thanks.


-Olof
