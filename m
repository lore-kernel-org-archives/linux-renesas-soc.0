Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35952 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751475AbdCSQUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Mar 2017 12:20:08 -0400
Received: by mail-wm0-f49.google.com with SMTP id n11so47326129wma.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Mar 2017 09:20:07 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Sun, 19 Mar 2017 17:20:04 +0100
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Print correct pinmux info name
Message-ID: <20170319162004.GB8580@x230>
References: <20170318205226.GA11403@x230>
 <CAMuHMdWzHLDjXknbK+Vik-7Qyi_WgcZL4JB5U_srKMh1sZa7Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWzHLDjXknbK+Vik-7Qyi_WgcZL4JB5U_srKMh1sZa7Vg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Mar 19, 2017 at 03:02:48PM +0100, Geert Uytterhoeven wrote:

Hi Geert,

> Thanks for your patch!
> But next time, please send it inline, for easier commenting.

Thanks! Will do that next time.

> From a code maintenance point of view, I think it's safer to update the info
> pointer itself, cfr. "[PATCH v2 1/4] pinctrl: sh-pfc: Update info pointer
> after SoC-specific init"
> (https://www.spinics.net/lists/linux-renesas-soc/msg12375.html).

Agree! It's good that printing the correct PFC driver name is already
fixed on your side.

Best regards,
Eugeniu.
