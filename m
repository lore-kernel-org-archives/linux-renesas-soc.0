Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34463 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753529AbdFSDA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Jun 2017 23:00:58 -0400
Received: by mail-lf0-f66.google.com with SMTP id o28so8803730lfk.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Jun 2017 20:00:57 -0700 (PDT)
Date: Sun, 18 Jun 2017 19:21:35 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v4.12
Message-ID: <20170619022135.GU30022@localhost>
References: <cover.1497259417.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1497259417.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On Mon, Jun 12, 2017 at 11:27:22AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these second round of Renesas ARM based SoC fixes for v4.12.
> 
> It splits LCD mux and gpio into separate nodes as different values
> for the output-high property are required.
> 
> This pull request is based on the previous round of
> such requests, tagged as renesas-fixes-for-v4.12,
> which I have already sent a pull-request for.
> 
> 
> The following changes since commit 7b4ccb3c466f62bbf2f4dd5d6a143d945a6f3051:
> 
>   soc: renesas: Provide dummy rcar_rst_read_mode_pins() for compile-testing (2017-04-28 10:07:36 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes2-for-v4.12
> 
> for you to fetch changes up to 13132b3f44d3600983aceb7e9920b8ebb55a7cf8:
> 
>   ARM: dts: armadillo800eva: Split LCD mux and gpio (2017-06-08 15:44:55 +0200)
> 
> ----------------------------------------------------------------
> Second Round of Renesas ARM Based SoC Fixes for v4.12
> 
> * Split LCD mux and gpio on armadillo800eva board

So, Geert wrote a great patch description as to why this patch is
important as a fix, but none of that made it into the pull request.

When you have the write-up already available, and especially this late in the
release cycle, it'd really be preferred to have it make it into the tag
description. As always, documentation of the _why_ is a lot more important than
the _what_.

Merged into fixes-non-critical for the v4.13 merge window, since the
fixed commit is two years old and thus doesn't seem like an urgent fix.

Note that this means that any new fixes that are indeed urgent can't be based
on this branch, they need to be sent independently.


Thanks,

-Olof
