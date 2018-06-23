Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:44886 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751473AbeFWRRT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Jun 2018 13:17:19 -0400
Received: by mail-lf0-f65.google.com with SMTP id j26-v6so3515524lfb.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Jun 2018 10:17:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1528889592.git.horms+renesas@verge.net.au>
References: <cover.1528889592.git.horms+renesas@verge.net.au>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 23 Jun 2018 10:17:16 -0700
Message-ID: <CAOesGMi5RDwv3jstPJ8ZMcKsbmYbhpq-2SyofBTt4mUWvZONJA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v4.18
To: Simon Horman <horms+renesas@verge.net.au>
Cc: ARM-SoC Maintainers <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 13, 2018 at 4:41 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC fixes for v4.18.
>
> This pull request is based on renesas-soc-for-v4.18,
> which you have already pulled.
>
> The following changes since commit 086b399965a7ee7e50c3b3c57f2dba30ff0334b0:
>
>   soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B} (2018-05-16 10:57:44 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v4.18
>
> for you to fetch changes up to 977d5ba4507dfe5b1346597ee57750262d8d2b19:
>
>   soc: renesas: rcar-sysc: Make PM domain initialization more robust (2018-06-08 10:04:25 +0200)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Fixes for v4.18
>
> Make PM domain initialization more robust in Renesas R-Car SYSC driver.
> This resolves a regression due to re-parenting of PM domains by
> 086b399965a7ee7e ("soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}").
>

Merged, thanks.


-Olof
