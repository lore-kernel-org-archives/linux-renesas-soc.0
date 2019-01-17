Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561BDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:31:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21B932054F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfAQKbL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:31:11 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:39839 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbfAQKbL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:31:11 -0500
Received: by mail-ua1-f43.google.com with SMTP id c12so3273323uas.6;
        Thu, 17 Jan 2019 02:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60FBelbtfv+AQXnEIGtfyc9c6kBFMFUjdzQh4P5aRgA=;
        b=hn5CrFGh6CPkwE0PIxwOClQA1zYfeC7v3Z8XxY3Xz040mSO3UJhCM33YjGLNEe+gLO
         6MFXoL+w59+iGpj5rfvfOILUNGA4tNKgHdC/CMrHfuPC4UpBiRaifWXfrIafgKO9vqsg
         uszpr38zAIjUU5B86dXAOO/3AhguFbhZGj2PGobsRp5Trb6W4/lfRWWQIXQ994TjGlzw
         C5PTF5jm/qi07V/qNiSmee/+XLRxcaKIOL1Vc0LpTEcP6Jyjg7iiyi7P69mkWLOhiEWl
         jxugjE5n5leSxaPQXr4e23EqayXFNGRvqRVx53KoTnu3Agah0qjaAMfDYcCuBdy5h/PO
         aVuw==
X-Gm-Message-State: AJcUukc5LSnFi/y+NV9iHeleLVZNHE0JRW+0xgx+AOYH5+jv0k9q4LMj
        MraPfIlfpkhrXarX6XJ/ZuHpEwQ5srpvAqA8FSHVLn8T
X-Google-Smtp-Source: ALg8bN6bviSyg2aOi6qK8uNn52WKwxSvdrfl+Usn4xrJgP3GVtGxKwfZGwcC+Rq8PrDK+BsUvu55Umb5bb3bapSzD3Y=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr5416149ual.20.1547721070601;
 Thu, 17 Jan 2019 02:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com> <20190116210555.12209-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190116210555.12209-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jan 2019 11:30:59 +0100
Message-ID: <CAMuHMdWbDzuojHXnELpTZSgyZME4eiC=Xu9=d7FY+cUd9juvDg@mail.gmail.com>
Subject: Re: [RFC/RFT 4/7] i2c: sh_mobile: remove is_first_byte function
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 1:35 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> All state machines deal with pd->pos values. This helper function is an
> exception and makes it only more confusing.
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
