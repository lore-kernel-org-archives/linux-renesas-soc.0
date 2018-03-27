Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33831 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752060AbeC0NPN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 09:15:13 -0400
Received: by mail-it0-f67.google.com with SMTP id z7-v6so15966074iti.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Mar 2018 06:15:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1521206439.git.horms+renesas@verge.net.au>
References: <cover.1521206439.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 27 Mar 2018 15:15:11 +0200
Message-ID: <CAK8P3a1BcvykSjc1tPPxKDUezfHR=nXosfPBSSjhF=xDwXOTow@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.17
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

On Fri, Mar 16, 2018 at 3:51 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC defconfig updates for v4.17.
>
>
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
>
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-defconfig-for-v4.17
>
> for you to fetch changes up to a20d1390c1daac4b8ae1e544e1e49dfd386125a8:
>
>   ARM: shmobile: defconfig: Disable CONFIG_EMBEDDED (2018-03-05 07:45:31 +0100)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v4.17
>
> Updates to shmobile defconfig:
>
> * Redresh defconfig to ease future maintenence overhead
>
> * Disable CONFIG_EMBEDDED
>
>   Geert Uytterhoeven says "CONFIG_EXPERT exposes too many config options
>   that do not matter for development.  E.g. it prohibits using the default
>   values for the various SH_SCI options.  However, CONFIG_EMBEDDED selects
>   CONFIG_EXPERT, so it cannot be disabled.
>
>   Hence disable CONFIG_EMBEDDED, and compensate for the loss of
>   CONFIG_DEBUG_KERNEL by enabling the latter.
>
>   Actual impact, all harmless:
>     - CONFIG_NAMESPACES=y (plus a few related CONFIG_*_NS options),
>     - CONFIG_SYSCTL_SYSCALL=n,
>     - CONFIG_SERIAL_SH_SCI_NR_UARTS changed from 20 to 18,
>     - Some HID support became enabled,
>     - CONFIG_DEBUG_MEMORY_INIT=y,"

Pulled into next/soc, thanks!

      Arnd
