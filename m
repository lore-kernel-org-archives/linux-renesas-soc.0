Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33964 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752755AbdEJNe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2017 09:34:29 -0400
Received: by mail-oi0-f51.google.com with SMTP id b204so35537717oii.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 May 2017 06:34:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1493713942.git.horms+renesas@verge.net.au>
References: <cover.1493713942.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 May 2017 15:34:28 +0200
Message-ID: <CAK8P3a3Z2XL8zdWoQ9icQTioQaGQKGKaR=QCTq89h01Op=xmNQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v4.12
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 2, 2017 at 10:35 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC fixes for v4.12.
>
> * Fix from Geert Uytterhoeven to avoid an undefined reference
>   to `rcar_rst_read_mode_pins' in the case where the R-Car RST driver
>   is not included.
>
>

Pulled into fixes, thanks!

     Arnd
