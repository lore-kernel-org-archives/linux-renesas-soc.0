Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:34352 "EHLO
	mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750867AbcGGFnS (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 01:43:18 -0400
Received: by mail-pf0-f169.google.com with SMTP id h14so3097707pfe.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Jul 2016 22:43:18 -0700 (PDT)
Date: Wed, 6 Jul 2016 22:12:36 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Kevin Hilman <khilman@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC R-Car SYSC
 Updates for v4.8
Message-ID: <20160707051236.GG32389@localhost>
References: <cover.1467292648.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1467292648.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 30, 2016 at 04:16:11PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC R-Car SYSC
> updates for v4.8.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-rcar-sysc-for-v4.8,
> which you have already pulled.
> 
> 
> The following changes since commit e0c98b9171eecf1745eda08de86081db8ec41d51:
> 
>   soc: renesas: rcar-sysc: Add support for R-Car M3-W power areas (2016-06-06 10:14:21 +0900)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-rcar-sysc2-for-v4.8
> 
> for you to fetch changes up to ced42730d19dd140a76f86c3761f646b83a35d09:
> 
>   soc: renesas: rcar-sysc: Improve SYSC interrupt config in legacy wrapper (2016-06-29 14:37:24 +0200)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC R-Car SYSC Updates for v4.8
> 
> * Prepare for handling SYSC interrupt configuration purely
>   from DT in the rcar-sysc driver for new SoCs, while preserving
>   backward compatibility with old DTBs for R-Car H1, H2, and M2-W
> * Add R8A7792 support

Merged, thanks.


-Olof
