Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35050 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751319AbdHDKzx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Aug 2017 06:55:53 -0400
Received: by mail-oi0-f50.google.com with SMTP id e124so11711129oig.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Aug 2017 03:55:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1501499175.git.horms+renesas@verge.net.au>
References: <cover.1501499175.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Aug 2017 12:55:52 +0200
Message-ID: <CAK8P3a3j1mcv=pjg99PPTm2bptP4jkND_w+fTOuWsRVsFde=dw@mail.gmail.com>
Subject: Re: [GIT PULL] Third Round of Renesas ARM Based SoC Fixes for v4.13
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

On Mon, Jul 31, 2017 at 1:12 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these third round of Renesas ARM based SoC fixes for v4.13.
>
> This pull request is based on v4.12-rc1 rather than earlier fixes for v4.13
> as it is unrelated to those fixes and their dependencies - arm64 DT updates
> for R-Car Gen 3 SoCs.
>
> This fix resolves a deadlock during boot on R-Car Gen 2 SoCs.
> The bug has been present since v4.1-rc1 but does not manifest in
> a deadlock until v4.13-rc1.
>

Pulled into fixes, thanks!

       Arnd
