Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33019 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757614AbeD0Naj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 09:30:39 -0400
Received: by mail-it0-f66.google.com with SMTP id x144-v6so2509081itc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Apr 2018 06:30:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-4-wsa+renesas@sang-engineering.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com> <20180419140641.27926-4-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Apr 2018 15:30:37 +0200
Message-ID: <CACRpkdbZC8-V4fOmyCSzgvXoxFg35vN1VdNq_VbKTK3QXo2Btg@mail.gmail.com>
Subject: Re: [PATCH 03/61] auxdisplay: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 19, 2018 at 4:05 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for slow reply.

Yours,
Linus Walleij
