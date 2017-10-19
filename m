Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:52845 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752442AbdJSP6v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2017 11:58:51 -0400
Received: by mail-oi0-f66.google.com with SMTP id c202so15672163oih.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Oct 2017 08:58:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1506324907.git.horms+renesas@verge.net.au>
References: <cover.1506324907.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Oct 2017 17:58:50 +0200
Message-ID: <CAK8P3a1u--7HNiR7CRg999-GPqjHj-GnxSoi6Yd=1qFqTZegmA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v4.14
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 25, 2017 at 9:54 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC fixes for v4.14.
>
>
> The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:
>
>   Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v4.14
>
> for you to fetch changes up to 829e4887b8676255778e162efc57e4a0f18f8bb3:
>
>   arm64: dts: salvator-common: add 12V regulator to backlight (2017-09-21 10:03:51 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Fixes for v4.14
>
> Add 12V regulator to backlight allowing the power supply
> for the backlight to be found.

Pulled into fixes, thanks

      Arnd
