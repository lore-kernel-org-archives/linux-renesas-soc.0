Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34854 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdA3Ffh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 00:35:37 -0500
Received: by mail-pg0-f65.google.com with SMTP id 204so30610222pge.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Jan 2017 21:34:15 -0800 (PST)
Date: Sun, 29 Jan 2017 20:55:51 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Updates for
 v4.11
Message-ID: <20170130045551.GB18943@localhost>
References: <cover.1485425385.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1485425385.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 11:11:18AM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC updates for v4.11.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-soc-for-v4.11,
> which you have already pulled.
> 
> 
> The following changes since commit 70def3e53694a65c5583fb5f411491a5074bab18:
> 
>   ARM: shmobile: rcar-gen2: Remove unused rcar_gen2_read_mode_pins() (2017-01-03 10:50:45 +0100)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc2-for-v4.11
> 
> for you to fetch changes up to aa7f39d51e33555fc45645c08bc74a74e22b166f:
> 
>   ARM: shmobile: rcar-gen2: Add more register documentation (2017-01-25 11:28:28 +0100)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC Updates for v4.11
> 
> * Add more register documentation to R-Car Gen2 PM
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (1):
>       ARM: shmobile: rcar-gen2: Add more register documentation
> 
>  arch/arm/mach-shmobile/pm-rcar-gen2.c | 40 +++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 11 deletions(-)

Merged, thanks!


-Olof
