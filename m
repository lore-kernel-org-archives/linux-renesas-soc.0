Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32943 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbeIWTwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Sep 2018 15:52:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id l19-v6so1470400ljb.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Sep 2018 06:55:01 -0700 (PDT)
Date: Sun, 23 Sep 2018 06:19:38 -0700
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.20
Message-ID: <20180923131938.rbuafdmjtqhsnxvz@localhost>
References: <cover.1536828567.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1536828567.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 13, 2018 at 11:09:49AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT updates for v4.20.
> 
> I am sending out this pull-request at this time as there are a number
> of patches queued up in my arm (32) DT branch and I hope that this
> will ease the burden later on in the development cycle. I expect to
> send a follow-up pull-request for this branch at the usual pre-rc6 timing.
> 
> Highlights of this pull request:
> * New SoC: RZ/G2M (r8a774a1)
> * New Board: R-Car M3-N (r8a77965) based ULCB
> * And, as usual, increased hardware coverage a variety of SoCs and their boards
> 
> 
> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:
> 
>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v4.20
> 
> for you to fetch changes up to 450d6079e8d3c40c7ce67ac8bb4a2da9baf56613:
> 
>   arm64: dts: r8a77965: add FDP1 device nodes (2018-09-13 09:48:13 +0200)

Merged, thanks!


-Olof
