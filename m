Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33854 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753468AbdFSGO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 02:14:29 -0400
Received: by mail-lf0-f68.google.com with SMTP id o28so9031227lfk.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2017 23:14:28 -0700 (PDT)
Date: Sun, 18 Jun 2017 22:49:13 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.13
Message-ID: <20170619054913.GI7703@localhost>
References: <cover.1497617480.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1497617480.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 16, 2017 at 03:30:30PM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC drivers updates for v4.13.
> 
> This pull request is based on
> "[GIT PULL] Renesas ARM Based SoC Fixes for v4.12",
> tagged as renesas-fixes-for-v4.12,
> which you have already pulled and is present in v4.12-rc2.
> 
> This base was used to supply a dependency. It is one patch away from
> v4.11-rc1.  I could also have based the series on v4.12-rc2 but I wanted to
> avoid basing (any of my branches for v4.13) on something more recent than
> v4.12-rc1 unless strictly necessary. Nonetheless I'm happy to rebase if you
> prefer.
> 
> 
> The following changes since commit 7b4ccb3c466f62bbf2f4dd5d6a143d945a6f3051:
> 
>   soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing (2017-04-28 10:07:36 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-drivers-for-v4.13
> 
> for you to fetch changes up to 8be381a131c29c4737aed44e7e5f90cb77bb4a7e:
> 
>   soc: renesas: Rework Kconfig and Makefile logic (2017-06-12 11:31:07 +0200)
> 
> ----------------------------------------------------------------
> Renesas ARM Based SoC Drivers Updates for v4.13
> 
> * Rework Kconfig and Makefile logic

There's little point it just enumerating the patches in this pull request:
That's obvious from the shortlog. Instead, please provide context and the
"why".

Why is Kconfig and Makefile logic reworked here? Geert wrote a great commit
message about it that you could distill to a shorter tag description.

(I've commented on the patch on the list just now, but I've also merged this so
see that as room for incremental improvement).


-Olof
