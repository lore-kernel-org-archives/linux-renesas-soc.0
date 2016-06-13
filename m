Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f177.google.com ([209.85.192.177]:36064 "EHLO
	mail-pf0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752786AbcFNQxj (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 12:53:39 -0400
Received: by mail-pf0-f177.google.com with SMTP id t190so59085325pfb.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2016 09:53:38 -0700 (PDT)
Date: Mon, 13 Jun 2016 15:44:42 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
	Kevin Hilman <khilman@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v4.8
Message-ID: <20160613224442.GE29879@localhost>
References: <cover.1465347025.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1465347025.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 08, 2016 at 10:00:19AM +0900, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC updates for v4.8.
> 
> 
> The following changes since commit 1a695a905c18548062509178b98bc91e67510864:
> 
>   Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.8
> 
> for you to fetch changes up to c94bc815f3c757df402d6f6a3e8d855b9168e6af:
> 
>   ARM: shmobile: rcar-gen2: Use ICRAM1 for jump stub on all SoCs (2016-05-30 09:39:43 +0900)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Updates for v4.8
> 
> * Use ICRAM1 for jump stub on R-Car Gen 2 SoCs
> * Postpone call to pm_genpd_init
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (2):
>       ARM: shmobile: pm-rmobile: Postpone call to pm_genpd_init()
>       ARM: shmobile: rcar-gen2: Use ICRAM1 for jump stub on all SoCs
> 
>  arch/arm/mach-shmobile/pm-rcar-gen2.c | 13 ++++---------
>  arch/arm/mach-shmobile/pm-rmobile.c   |  2 +-
>  2 files changed, 5 insertions(+), 10 deletions(-)

Merged, thanks.


-Olof
