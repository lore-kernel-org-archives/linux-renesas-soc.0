Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35453 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753468AbdFSGOe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 02:14:34 -0400
Received: by mail-lf0-f65.google.com with SMTP id v20so9030043lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2017 23:14:33 -0700 (PDT)
Date: Sun, 18 Jun 2017 22:51:56 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC R-Car SYSC Updates for v4.13
Message-ID: <20170619055156.GL7703@localhost>
References: <cover.1497619041.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1497619041.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 16, 2017 at 03:31:08PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC R-Car SYSC updates for v4.13.
> 
> This has been separated out from the pull request
> "[GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.13"
> due to differing dependencies. It seems cleanest to provide separate
> branchs rather than do a merge to create a common base for a single branch.
> 
> 
> The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:
> 
>   Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-rcar-sysc-for-v4.13
> 
> for you to fetch changes up to 980532a5dda319eeafadc5c590376626ad178f4f:
> 
>   soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON (2017-06-15 21:10:41 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC R-Car SYSC Updates for v4.13
> 
> Use GENPD_FLAG_ALWAYS_ON in R-Car SYSC driver
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (1):
>       soc: renesas: rcar-sysc: Use GENPD_FLAG_ALWAYS_ON

Merged, thanks.


-Olof
