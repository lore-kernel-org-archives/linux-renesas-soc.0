Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799D6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 403812054F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfAQKgT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:36:19 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:44962 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbfAQKgS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:36:18 -0500
Received: by mail-vk1-f193.google.com with SMTP id h128so2133505vkg.11;
        Thu, 17 Jan 2019 02:36:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkWnFxapDvbI48oaZ7pS57joEt+NqSvaReNO/zC6fnE=;
        b=a3u0Jc6J4bH6jkXuR6zszPZwmY7B4qQpUSxgc1w3e1fdNhGX2ksyFo3QCNIOdEqbvq
         L2EI7iwts7MVIj1KgrTaVFvM44D3Nj9qBX9Qa7i9DS9kYLrCk6ckYhylEmA3GkOiI5I0
         WdH9JM0CqNyEz+wJJlEbW4TjpaIqpw8J/1oUy9qNM/N/w/6QcSmJN+13SV+HziCKf60P
         Lo12jzjGMlg9KqKxXdeCo4J+ag5QsQ17tWU2Swy/WCJlhBaxLIvTcp0kyCgA4oQNE3aY
         clbUFg3M5Zu0l1kNpdiiNl/VyaDyGncZD7qt8Mu81qhZLUGNoMdWYBxTAvGu9rODU9NS
         kkuQ==
X-Gm-Message-State: AJcUukce2o02eW+jgGtprg3CWxsxjFeu7J17w+GprzYyEgL7jv2xcAJy
        lCsFWyqwyUiHsiaG3+z9iNidWZs11Uy4UA3dafCODTTW
X-Google-Smtp-Source: ALg8bN6km06fSc/BLhN4Qmoy01ngCW+H7CFvqys904deXrquHs+G7Q+KspG2HL1P+/LjTsXalZ3x0C9WymHrefDAef4=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr5434914vkp.40.1547721377735;
 Thu, 17 Jan 2019 02:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com> <20190116210555.12209-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190116210555.12209-7-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:36:06 +0100
Message-ID: <CAMuHMdXOzaYeHg4a4eW_OATyh848B-U5y0w+L7CBHFvBRLgAxQ@mail.gmail.com>
Subject: Re: [RFC/RFT 6/7] i2c: sh_mobile: refactor rx isr
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 1:36 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Remove the do_while loop which was just there to have an easy exit with
> "break;" and replace it with if-else-blocks which should make the state
> machine clearer.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
