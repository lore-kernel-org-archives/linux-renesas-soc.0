Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:53578 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753111AbdJHARi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Oct 2017 20:17:38 -0400
Received: by mail-io0-f180.google.com with SMTP id q11so18711900ioe.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Oct 2017 17:17:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507119376-12491-1-git-send-email-geert+renesas@glider.be>
References: <1507119376-12491-1-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 8 Oct 2017 02:17:37 +0200
Message-ID: <CACRpkdaeQ9e=p2jFw-b_5SBWSRTsTLk3TFU_XTQeOYsA_Wv9=g@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Use of_device_get_match_data() helper
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 4, 2017 at 2:16 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Use the of_device_get_match_data() helper instead of open coding.
> Note that the gpio-rcar driver is used with DT only, so there's always a
> valid match.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied with Simon's tag.

Yours,
Linus Walleij
